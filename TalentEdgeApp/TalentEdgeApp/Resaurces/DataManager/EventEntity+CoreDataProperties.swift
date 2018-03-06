//
//  EventEntity+CoreDataProperties.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 06/08/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import Foundation
import CoreData


extension EventEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventEntity> {
        return NSFetchRequest<EventEntity>(entityName: "EventEntity")
    }

    static let entityName =  "EventEntity"
    @NSManaged public var event_detail_id: String?
    @NSManaged public var venue: String?
    @NSManaged public var id: String?
    @NSManaged public var content_type_id: String?
    @NSManaged public var title: String?
    @NSManaged public var start_date_complete: NSDate?
    @NSManaged public var color_code: String?
    @NSManaged public var all_day_event: Bool
    @NSManaged public var end_date_complete: NSDate?
    @NSManaged public var description_value: String?
    @NSManaged public var start_date: NSDate?
    @NSManaged public var end_date: NSDate?

}
