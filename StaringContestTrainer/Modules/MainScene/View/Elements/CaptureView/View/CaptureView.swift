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
        
        videoPreviewLayer.frame = canvas.layer.bounds
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
        
        guard let canvas, let session, let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else { return }
        
        do {
            try device.lockForConfiguration()
            device.activeVideoMinFrameDuration = CMTimeMake(value: 1, timescale: 30)
            device.activeVideoMaxFrameDuration = CMTimeMake(value: 1, timescale: 30)
            device.unlockForConfiguration()
        } catch {
            writeLog(type: .error, message: "Device configuration failed")
        }
        
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
    
    func setup(with model: CaptureViewModelType) {
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

        viewModel?.check(image: CIImage(cvImageBuffer: imageBuffer))
    }
}

extension CaptureView {
    private struct Constants {
        static let cornerRadiusValue: CGFloat = 30.0
        static let elementsPadding: CGFloat = 10.0
        static let queueImageRecognitionLabel = "imageCapture.queue"
    }
}
