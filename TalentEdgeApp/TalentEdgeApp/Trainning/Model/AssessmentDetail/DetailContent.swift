//
//  Content.swift
//
//  Created by Vinod Kumar Sahu on 11/06/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DetailContent: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let parentId = "parent_id"
    static let descriptionValue = "description"
    static let obtainedMarks = "obtained_marks"
    static let endDateUnformated = "end_date_unformated"
    static let endDateLabel = "end_date_label"
    static let startDateLabel = "start_date_label"
    static let createdLabel = "created_label"
    static let status = "status"
    static let startDateUnformated = "start_date_unformated"
    static let id = "id"
    static let obtainedMarksLabel = "obtained_marks_label"
    static let created = "created"
    static let title = "title"
    static let endDate = "end_date"
    static let startDate = "start_date"
  }

  // MARK: Properties
  public var parentId: String?
  public var descriptionValue: String?
  public var obtainedMarks: Int?
  public var endDateUnformated: String?
  public var endDateLabel: String?
  public var startDateLabel: String?
  public var createdLabel: String?
  public var status: Bool? = false
  public var startDateUnformated: String?
  public var id: String?
  public var obtainedMarksLabel: String?
  public var created: String?
  public var title: String?
  public var endDate: String?
  public var startDate: String?

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
    parentId = json[SerializationKeys.parentId].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    obtainedMarks = json[SerializationKeys.obtainedMarks].int
    endDateUnformated = json[SerializationKeys.endDateUnformated].string
    endDateLabel = json[SerializationKeys.endDateLabel].string
    startDateLabel = json[SerializationKeys.startDateLabel].string
    createdLabel = json[SerializationKeys.createdLabel].string
    status = json[SerializationKeys.status].boolValue
    startDateUnformated = json[SerializationKeys.startDateUnformated].string
    id = json[SerializationKeys.id].string
    obtainedMarksLabel = json[SerializationKeys.obtainedMarksLabel].string
    created = json[SerializationKeys.created].string
    title = json[SerializationKeys.title].string
    endDate = json[SerializationKeys.endDate].string
    startDate = json[SerializationKeys.startDate].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = parentId { dictionary[SerializationKeys.parentId] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = obtainedMarks { dictionary[SerializationKeys.obtainedMarks] = value }
    if let value = endDateUnformated { dictionary[SerializationKeys.endDateUnformated] = value }
    if let value = endDateLabel { dictionary[SerializationKeys.endDateLabel] = value }
    if let value = startDateLabel { dictionary[SerializationKeys.startDateLabel] = value }
    if let value = createdLabel { dictionary[SerializationKeys.createdLabel] = value }
    dictionary[SerializationKeys.status] = status
    if let value = startDateUnformated { dictionary[SerializationKeys.startDateUnformated] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = obtainedMarksLabel { dictionary[SerializationKeys.obtainedMarksLabel] = value }
    if let value = created { dictionary[SerializationKeys.created] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.parentId = aDecoder.decodeObject(forKey: SerializationKeys.parentId) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.obtainedMarks = aDecoder.decodeObject(forKey: SerializationKeys.obtainedMarks) as? Int
    self.endDateUnformated = aDecoder.decodeObject(forKey: SerializationKeys.endDateUnformated) as? String
    self.endDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.endDateLabel) as? String
    self.startDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.startDateLabel) as? String
    self.createdLabel = aDecoder.decodeObject(forKey: SerializationKeys.createdLabel) as? String
    self.status = aDecoder.decodeBool(forKey: SerializationKeys.status)
    self.startDateUnformated = aDecoder.decodeObject(forKey: SerializationKeys.startDateUnformated) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.obtainedMarksLabel = aDecoder.decodeObject(forKey: SerializationKeys.obtainedMarksLabel) as? String
    self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(parentId, forKey: SerializationKeys.parentId)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(obtainedMarks, forKey: SerializationKeys.obtainedMarks)
    aCoder.encode(endDateUnformated, forKey: SerializationKeys.endDateUnformated)
    aCoder.encode(endDateLabel, forKey: SerializationKeys.endDateLabel)
    aCoder.encode(startDateLabel, forKey: SerializationKeys.startDateLabel)
    aCoder.encode(createdLabel, forKey: SerializationKeys.createdLabel)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(startDateUnformated, forKey: SerializationKeys.startDateUnformated)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(obtainedMarksLabel, forKey: SerializationKeys.obtainedMarksLabel)
    aCoder.encode(created, forKey: SerializationKeys.created)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
  }

}
