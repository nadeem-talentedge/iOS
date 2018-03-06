//
//  Content.swift
//
//  Created by Vinod Kumar on 09/06/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class AssignmentContent: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let contentPathLabel = "content_path_label"
    static let startDate = "start_date"
    static let parentId = "parent_id"
    static let startDateLabel = "start_date_label"
    static let id = "id"
    static let gradedLabel = "graded_label"
    static let descriptionValue = "description"
    static let contentPath = "content_path"
    static let title = "title"
    static let endDate = "end_date"
    static let endDateLabel = "end_date_label"
    static let isGradingDone = "is_grading_done"
    static let obtainedMarks = "obtained_marks"
    static let obtainedMarksLabel = "obtained_marks_label"
    
  }

  // MARK: Properties
  public var contentPathLabel: String?
  public var startDate: String?
  public var parentId: String?
  public var startDateLabel: String?
  public var id: String?
  public var gradedLabel: String?
  public var descriptionValue: String?
  public var contentPath: String?
  public var title: String?
  public var endDate: String?
  public var endDateLabel: String?
  public var isGradingDone: String?
  public var obtainedMarks: String?
  public var obtainedMarksLabel: String?
  

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
    contentPathLabel = json[SerializationKeys.contentPathLabel].string
    startDate = json[SerializationKeys.startDate].string
    parentId = json[SerializationKeys.parentId].string
    startDateLabel = json[SerializationKeys.startDateLabel].string
    id = json[SerializationKeys.id].string
    gradedLabel = json[SerializationKeys.gradedLabel].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    contentPath = json[SerializationKeys.contentPath].string
    title = json[SerializationKeys.title].string
    endDate = json[SerializationKeys.endDate].string
    endDateLabel = json[SerializationKeys.endDateLabel].string
    isGradingDone = json[SerializationKeys.isGradingDone].string
    obtainedMarks = json[SerializationKeys.obtainedMarks].string
    obtainedMarksLabel = json[SerializationKeys.obtainedMarksLabel].string
    
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = contentPathLabel { dictionary[SerializationKeys.contentPathLabel] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = parentId { dictionary[SerializationKeys.parentId] = value }
    if let value = startDateLabel { dictionary[SerializationKeys.startDateLabel] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = gradedLabel { dictionary[SerializationKeys.gradedLabel] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = contentPath { dictionary[SerializationKeys.contentPath] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    if let value = endDateLabel { dictionary[SerializationKeys.endDateLabel] = value }
    if let value = isGradingDone { dictionary[SerializationKeys.isGradingDone] = value }
    if let value = obtainedMarks { dictionary[SerializationKeys.obtainedMarks] = value }
    if let value = obtainedMarksLabel { dictionary[SerializationKeys.obtainedMarksLabel] = value }
    
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.contentPathLabel = aDecoder.decodeObject(forKey: SerializationKeys.contentPathLabel) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.parentId = aDecoder.decodeObject(forKey: SerializationKeys.parentId) as? String
    self.startDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.startDateLabel) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.gradedLabel = aDecoder.decodeObject(forKey: SerializationKeys.gradedLabel) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.contentPath = aDecoder.decodeObject(forKey: SerializationKeys.contentPath) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
    self.endDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.endDateLabel) as? String
    self.isGradingDone = aDecoder.decodeObject(forKey: SerializationKeys.isGradingDone) as? String
    
    self.obtainedMarks = aDecoder.decodeObject(forKey: SerializationKeys.obtainedMarks) as? String
    self.obtainedMarksLabel = aDecoder.decodeObject(forKey: SerializationKeys.obtainedMarksLabel) as? String
    
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(contentPathLabel, forKey: SerializationKeys.contentPathLabel)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(parentId, forKey: SerializationKeys.parentId)
    aCoder.encode(startDateLabel, forKey: SerializationKeys.startDateLabel)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(gradedLabel, forKey: SerializationKeys.gradedLabel)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(contentPath, forKey: SerializationKeys.contentPath)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
    aCoder.encode(endDateLabel, forKey: SerializationKeys.endDateLabel)
    aCoder.encode(isGradingDone, forKey: SerializationKeys.isGradingDone)
    aCoder.encode(obtainedMarks, forKey: SerializationKeys.obtainedMarks)
    aCoder.encode(obtainedMarksLabel, forKey: SerializationKeys.obtainedMarksLabel)
    
  }

}
