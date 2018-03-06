//
//  AssignmentListBase.swift
//
//  Created by Rohit on 29/05/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class AssignmentListBase: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let totalMarks = "total_marks"
    static let action = "action"
    static let parentId = "parent_id"
    static let isGraded = "is_graded"
    static let isDraft = "is_draft"
    static let allowView = "allow_view"
    static let totalMarksLabel = "total_marks_label"
    static let descriptionValue = "description"
    static let endDateValue = "end_date_value"
    static let startDateLabel = "start_date_label"
    static let endDateLabel = "end_date_label"
    static let startDateValue = "start_date_value"
    static let moduleName = "module_name"
    static let id = "id"
    static let submissionCount = "submission_count"
    static let allowEdit = "allow_edit"
    static let title = "title"
    static let passingMarksLabel = "passing_marks_label"
    static let submissionLabel = "submission_label"
    static let passingMarks = "passing_marks"
    static let moduleId = "module_id"
    static let submissionMode = "submission_mode"
  }

  // MARK: Properties
  public var totalMarks: String?
  public var action: String?
  public var parentId: String?
  public var isGraded: String?
  public var isDraft: Int?
  public var allowView: Int?
  public var totalMarksLabel: String?
  public var descriptionValue: String?
  public var endDateValue: String?
  public var startDateLabel: String?
  public var endDateLabel: String?
  public var startDateValue: String?
  public var moduleName: String?
  public var id: String?
  public var submissionCount: Int?
  public var allowEdit: Int?
  public var title: String?
  public var passingMarksLabel: String?
  public var submissionLabel: String?
  public var passingMarks: String?
  public var moduleId: String?
  public var submissionMode: String?

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
    totalMarks = json[SerializationKeys.totalMarks].string
    action = json[SerializationKeys.action].string
    parentId = json[SerializationKeys.parentId].string
    isGraded = json[SerializationKeys.isGraded].string
    isDraft = json[SerializationKeys.isDraft].int
    allowView = json[SerializationKeys.allowView].int
    totalMarksLabel = json[SerializationKeys.totalMarksLabel].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    endDateValue = json[SerializationKeys.endDateValue].string
    startDateLabel = json[SerializationKeys.startDateLabel].string
    endDateLabel = json[SerializationKeys.endDateLabel].string
    startDateValue = json[SerializationKeys.startDateValue].string
    moduleName = json[SerializationKeys.moduleName].string
    id = json[SerializationKeys.id].string
    submissionCount = json[SerializationKeys.submissionCount].int
    allowEdit = json[SerializationKeys.allowEdit].int
    title = json[SerializationKeys.title].string
    passingMarksLabel = json[SerializationKeys.passingMarksLabel].string
    submissionLabel = json[SerializationKeys.submissionLabel].string
    passingMarks = json[SerializationKeys.passingMarks].string
    moduleId = json[SerializationKeys.moduleId].string
    submissionMode = json[SerializationKeys.submissionMode].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = totalMarks { dictionary[SerializationKeys.totalMarks] = value }
    if let value = action { dictionary[SerializationKeys.action] = value }
    if let value = parentId { dictionary[SerializationKeys.parentId] = value }
    if let value = isGraded { dictionary[SerializationKeys.isGraded] = value }
    if let value = isDraft { dictionary[SerializationKeys.isDraft] = value }
    if let value = allowView { dictionary[SerializationKeys.allowView] = value }
    if let value = totalMarksLabel { dictionary[SerializationKeys.totalMarksLabel] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = endDateValue { dictionary[SerializationKeys.endDateValue] = value }
    if let value = startDateLabel { dictionary[SerializationKeys.startDateLabel] = value }
    if let value = endDateLabel { dictionary[SerializationKeys.endDateLabel] = value }
    if let value = startDateValue { dictionary[SerializationKeys.startDateValue] = value }
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = submissionCount { dictionary[SerializationKeys.submissionCount] = value }
    if let value = allowEdit { dictionary[SerializationKeys.allowEdit] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = passingMarksLabel { dictionary[SerializationKeys.passingMarksLabel] = value }
    if let value = submissionLabel { dictionary[SerializationKeys.submissionLabel] = value }
    if let value = passingMarks { dictionary[SerializationKeys.passingMarks] = value }
    if let value = moduleId { dictionary[SerializationKeys.moduleId] = value }
    if let value = submissionMode { dictionary[SerializationKeys.submissionMode] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.totalMarks = aDecoder.decodeObject(forKey: SerializationKeys.totalMarks) as? String
    self.action = aDecoder.decodeObject(forKey: SerializationKeys.action) as? String
    self.parentId = aDecoder.decodeObject(forKey: SerializationKeys.parentId) as? String
    self.isGraded = aDecoder.decodeObject(forKey: SerializationKeys.isGraded) as? String
    self.isDraft = aDecoder.decodeObject(forKey: SerializationKeys.isDraft) as? Int
    self.allowView = aDecoder.decodeObject(forKey: SerializationKeys.allowView) as? Int
    self.totalMarksLabel = aDecoder.decodeObject(forKey: SerializationKeys.totalMarksLabel) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.endDateValue = aDecoder.decodeObject(forKey: SerializationKeys.endDateValue) as? String
    self.startDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.startDateLabel) as? String
    self.endDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.endDateLabel) as? String
    self.startDateValue = aDecoder.decodeObject(forKey: SerializationKeys.startDateValue) as? String
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.submissionCount = aDecoder.decodeObject(forKey: SerializationKeys.submissionCount) as? Int
    self.allowEdit = aDecoder.decodeObject(forKey: SerializationKeys.allowEdit) as? Int
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.passingMarksLabel = aDecoder.decodeObject(forKey: SerializationKeys.passingMarksLabel) as? String
    self.submissionLabel = aDecoder.decodeObject(forKey: SerializationKeys.submissionLabel) as? String
    self.passingMarks = aDecoder.decodeObject(forKey: SerializationKeys.passingMarks) as? String
    self.moduleId = aDecoder.decodeObject(forKey: SerializationKeys.moduleId) as? String
    self.submissionMode = aDecoder.decodeObject(forKey: SerializationKeys.submissionMode) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(totalMarks, forKey: SerializationKeys.totalMarks)
    aCoder.encode(action, forKey: SerializationKeys.action)
    aCoder.encode(parentId, forKey: SerializationKeys.parentId)
    aCoder.encode(isGraded, forKey: SerializationKeys.isGraded)
    aCoder.encode(isDraft, forKey: SerializationKeys.isDraft)
    aCoder.encode(allowView, forKey: SerializationKeys.allowView)
    aCoder.encode(totalMarksLabel, forKey: SerializationKeys.totalMarksLabel)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(endDateValue, forKey: SerializationKeys.endDateValue)
    aCoder.encode(startDateLabel, forKey: SerializationKeys.startDateLabel)
    aCoder.encode(endDateLabel, forKey: SerializationKeys.endDateLabel)
    aCoder.encode(startDateValue, forKey: SerializationKeys.startDateValue)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(submissionCount, forKey: SerializationKeys.submissionCount)
    aCoder.encode(allowEdit, forKey: SerializationKeys.allowEdit)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(passingMarksLabel, forKey: SerializationKeys.passingMarksLabel)
    aCoder.encode(submissionLabel, forKey: SerializationKeys.submissionLabel)
    aCoder.encode(passingMarks, forKey: SerializationKeys.passingMarks)
    aCoder.encode(moduleId, forKey: SerializationKeys.moduleId)
    aCoder.encode(submissionMode, forKey: SerializationKeys.submissionMode)
  }

}
