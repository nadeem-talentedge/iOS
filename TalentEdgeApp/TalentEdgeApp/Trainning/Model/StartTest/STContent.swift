//
//  Content.swift
//
//  Created by Vinod Kumar Sahu on 11/06/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class STContent: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let endDate = "end_date"
    static let status = "status"
    static let parentId = "parent_id"
    static let id = "id"
    static let descriptionValue = "description"
    static let title = "title"
    static let startDateLabel = "start_date_label"
    static let startDate = "start_date"
    static let endDateLabel = "end_date_label"
  }

  // MARK: Properties
  public var endDate: String?
  public var status: Bool? = false
  public var parentId: String?
  public var id: String?
  public var descriptionValue: String?
  public var title: String?
  public var startDateLabel: String?
  public var startDate: String?
  public var endDateLabel: String?

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
    endDate = json[SerializationKeys.endDate].string
    status = json[SerializationKeys.status].boolValue
    parentId = json[SerializationKeys.parentId].string
    id = json[SerializationKeys.id].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    title = json[SerializationKeys.title].string
    startDateLabel = json[SerializationKeys.startDateLabel].string
    startDate = json[SerializationKeys.startDate].string
    endDateLabel = json[SerializationKeys.endDateLabel].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    dictionary[SerializationKeys.status] = status
    if let value = parentId { dictionary[SerializationKeys.parentId] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = startDateLabel { dictionary[SerializationKeys.startDateLabel] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = endDateLabel { dictionary[SerializationKeys.endDateLabel] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
    self.status = aDecoder.decodeBool(forKey: SerializationKeys.status)
    self.parentId = aDecoder.decodeObject(forKey: SerializationKeys.parentId) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.startDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.startDateLabel) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.endDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.endDateLabel) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(parentId, forKey: SerializationKeys.parentId)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(startDateLabel, forKey: SerializationKeys.startDateLabel)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(endDateLabel, forKey: SerializationKeys.endDateLabel)
  }

}
