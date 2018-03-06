//
//  Content.swift
//
//  Created by Rohit on 29/05/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Content: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let stepCompleted = "step_completed"
    static let parentId = "parent_id"
    static let id = "id"
    static let created = "created"
    static let isDeleted = "is_deleted"
    static let descriptionValue = "description"
    static let title = "title"
    static let startDate = "start_date"
    static let endDate = "end_date"
  }

  // MARK: Properties
  public var status: Bool? = false
  public var stepCompleted: String?
  public var parentId: String?
  public var id: String?
  public var created: String?
  public var isDeleted: Bool? = false
  public var descriptionValue: String?
  public var title: String?
  public var startDate: String?
  public var endDate: String?

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
    status = json[SerializationKeys.status].boolValue
    stepCompleted = json[SerializationKeys.stepCompleted].string
    parentId = json[SerializationKeys.parentId].string
    id = json[SerializationKeys.id].string
    created = json[SerializationKeys.created].string
    isDeleted = json[SerializationKeys.isDeleted].boolValue
    descriptionValue = json[SerializationKeys.descriptionValue].string
    title = json[SerializationKeys.title].string
    startDate = json[SerializationKeys.startDate].string
    endDate = json[SerializationKeys.endDate].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.status] = status
    if let value = stepCompleted { dictionary[SerializationKeys.stepCompleted] = value }
    if let value = parentId { dictionary[SerializationKeys.parentId] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = created { dictionary[SerializationKeys.created] = value }
    dictionary[SerializationKeys.isDeleted] = isDeleted
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.status = aDecoder.decodeBool(forKey: SerializationKeys.status)
    self.stepCompleted = aDecoder.decodeObject(forKey: SerializationKeys.stepCompleted) as? String
    self.parentId = aDecoder.decodeObject(forKey: SerializationKeys.parentId) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? String
    self.isDeleted = aDecoder.decodeBool(forKey: SerializationKeys.isDeleted)
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(stepCompleted, forKey: SerializationKeys.stepCompleted)
    aCoder.encode(parentId, forKey: SerializationKeys.parentId)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(created, forKey: SerializationKeys.created)
    aCoder.encode(isDeleted, forKey: SerializationKeys.isDeleted)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
  }

}
