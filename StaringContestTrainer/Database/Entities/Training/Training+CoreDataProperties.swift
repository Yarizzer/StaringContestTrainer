//
//  Training+CoreDataProperties.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//
//

import Foundation
import CoreData

extension Training {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Training> {
        return NSFetchRequest<Training>(entityName: "Training")
    }

    @NSManaged public var created: Date
    @NSManaged public var finished: Date
    @NSManaged public var finalImage: Data
}

extension Training : Identifiable { }
