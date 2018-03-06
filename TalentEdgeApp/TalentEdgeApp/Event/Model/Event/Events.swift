//
//  Events.swift
//
//  Created by Vinod Kumar on 27/07/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Events: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let eventDetailId = "event_detail_id"
    static let venue = "venue"
    static let colorCode = "color_code"
    static let id = "id"
    static let descriptionValue = "description"
    static let title = "title"
    static let allDayEvent = "all_day_event"
    static let startDate = "start_date"
    static let endDate = "end_date"
    static let contentTypeId = "content_type_id"
  }

  // MARK: Properties
  public var eventDetailId: String?
  public var venue: String?
  public var colorCode: String?
  public var id: String?
  public var descriptionValue: String?
  public var title: String?
  public var allDayEvent: Bool? = false
  public var startDate: String?
  public var endDate: String?
  public var contentTypeId: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    eventDetailId = json[SerializationKeys.eventDetailId].string
    venue = json[SerializationKeys.venue].string
    colorCode = json[SerializationKeys.colorCode].string
    id = json[SerializationKeys.id].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    title = json[SerializationKeys.title].string
    allDayEvent = json[SerializationKeys.allDayEvent].boolValue
    startDate = json[SerializationKeys.startDate].string
    endDate = json[SerializationKeys.endDate].string
    contentTypeId = json[SerializationKeys.contentTypeId].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = eventDetailId { dictionary[SerializationKeys.eventDetailId] = value }
    if let value = venue { dictionary[SerializationKeys.venue] = value }
    if let value = colorCode { dictionary[SerializationKeys.colorCode] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    dictionary[SerializationKeys.allDayEvent] = allDayEvent
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    if let value = contentTypeId { dictionary[SerializationKeys.contentTypeId] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.eventDetailId = aDecoder.decodeObject(forKey: SerializationKeys.eventDetailId) as? String
    self.venue = aDecoder.decodeObject(forKey: SerializationKeys.venue) as? String
    self.colorCode = aDecoder.decodeObject(forKey: SerializationKeys.colorCode) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.allDayEvent = aDecoder.decodeBool(forKey: SerializationKeys.allDayEvent)
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
    self.contentTypeId = aDecoder.decodeObject(forKey: SerializationKeys.contentTypeId) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(eventDetailId, forKey: SerializationKeys.eventDetailId)
    aCoder.encode(venue, forKey: SerializationKeys.venue)
    aCoder.encode(colorCode, forKey: SerializationKeys.colorCode)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(allDayEvent, forKey: SerializationKeys.allDayEvent)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
    aCoder.encode(contentTypeId, forKey: SerializationKeys.contentTypeId)
  }

}
