//
//  CaptureView.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 10.08.2023.
//

import AVFoundation
import UIKit

class CaptureView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialSetup()
        configureSession()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initialSetup()
        configureSession()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let canvas, let videoPreviewLayer else { return }
        
//        canvas.layer.cornerRadius = Constants.cornerRadiusValue
//        canvas.layer.masksToBounds = true
//        
//        videoPreviewLayer.frame = canvas.layer.bounds
    }
    
    private func initialSetup() {
        canvas = UIView()
        
        guard let canvas else { return }
        
        addSubview(canvas)
    }
    
    private func setupConstraints() {
        guard let canvas else { return }
        
        canvas.translatesAutoresizingMaskIntoConstraints = false
        
        canvas.topAnchor.constraint(equalTo: topAnchor).isActive = true
        canvas.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        canvas.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        canvas.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func configureSession() {
        session = AVCaptureSession()
        
        guard let canvas, let session, let device = AVCaptureDevice.default(for: .video) else { return }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            let output = AVCaptureVideoDataOutput()
            output.setSampleBufferDelegate(self, queue: DispatchQueue(label: Constants.queueImageRecognitionLabel))
            output.alwaysDiscardsLateVideoFrames = true
            
            session.addInput(input)
            session.addOutput(output)
        } catch {
            writeLog(type: .error, message: "CaptureDeviceInput initialiser failed")
        }
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
        
        guard let videoPreviewLayer else { return }
        
        videoPreviewLayer.videoGravity = .resizeAspectFill
        
        canvas.layer.addSublayer(videoPreviewLayer)
    }
    
    func inject(model: CaptureViewModelType) {
        self.viewModel = model
    }
    
    private var viewModel: CaptureViewModelType?
    
    private var canvas: UIView?
    private var session: AVCaptureSession?
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
}

extension CaptureView: CaptureViewType {
    func awakeSession() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let session = self?.session else { return }
            
            session.startRunning()
        }
    }
    
    func sleepSession() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let session = self?.session else { return }
            
            session.stopRunning()
        }
    }
}

extension CaptureView: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        connection.videoOrientation = .portrait
        
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        let ciImage = CIImage(cvImageBuffer: imageBuffer)
        
        let image = UIImage(ciImage: ciImage)
        
        //MARK: - Begin context
        UIGraphicsBeginImageContext(Constants.allowedImageDrawRect.size)
        
        image.draw(in: Constants.allowedImageDrawRect)
        guard let resizedImage = UIGraphicsGetImageFromCurrentImageContext() else { return }
        
        UIGraphicsEndImageContext()
        //MARK: - End context
        
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
             kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        
        var pixelBuffer: CVPixelBuffer?
        
        CVPixelBufferCreate(kCFAllocatorDefault, Int(resizedImage.size.width), Int(resizedImage.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        
        guard let pixelBuffer else { return }
        
        CVPixelBufferLockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer)
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData,
                                width: Int(resizedImage.size.width),
                                height: Int(resizedImage.size.height),
                                bitsPerComponent: 8,
                                bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer),
                                space: rgbColorSpace,
                                bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
        
        context?.translateBy(x: 0, y: resizedImage.size.height)
        context?.scaleBy(x: 1, y: -1)
        
        guard let context else { return }
        
        UIGraphicsPushContext(context)
        
        resizedImage.draw(in: CGRect(x: 0.0, y: 0.0, width: resizedImage.size.width, height: resizedImage.size.height))
        
        UIGraphicsPopContext()
        
        CVPixelBufferUnlockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        
        viewModel?.updatePrediction(for: pixelBuffer)
    }
}

extension CaptureView {
    private struct Constants {
        static let cornerRadiusValue: CGFloat = 30.0
        
        static let elementsPadding: CGFloat = 10.0
        static let queueImageRecognitionLabel = "imageCapture.queue"
        static let allowedImageDrawRect: CGRect = CGRect(x: 0.0, y: 0.0, width: 224.0, height: 224.0)
    }
}
