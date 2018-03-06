//
//  TeacherAssessmentContentModel.swift
//
//  Created by Vinod Kumar on 01/10/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TeacherAssessmentContentModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let action = "action"
    static let cntNotAttempted = "cnt_not_attempted"
    static let totalMarksLabel = "total_marks_label"
    static let attemptCount = "attempt_count"
    static let endDateValue = "end_date_value"
    static let startDateLabel = "start_date_label"
    static let contentTypeId = "content_type_id"
    static let startDateValue = "start_date_value"
    static let totalDuration = "total_duration"
    static let id = "id"
    static let testTypeLabel = "test_type_label"
    static let allowedMultiple = "allowed_multiple"
    static let allowEdit = "allow_edit"
    static let title = "title"
    static let passingMarksLabel = "passing_marks_label"
    static let moduleId = "module_id"
    static let cntAttempted = "cnt_attempted"
    static let parentId = "parent_id"
    static let isDraft = "is_draft"
    static let testType = "test_type"
    static let allowView = "allow_view"
    static let attemptLabel = "attempt_label"
    static let descriptionValue = "description"
    static let attemptAfterDuedate = "attempt_after_duedate"
    static let endDateUnformated = "end_date_unformated"
    static let endDateLabel = "end_date_label"
    static let startDateUnformated = "start_date_unformated"
    static let moduleName = "module_name"
    static let avgCompletionPercentage = "avg_completion_percentage"
    static let passingMarks = "passing_marks"
    static let totalQuestions = "total_questions"
    static let totalMarks = "total_marks"
  }

  // MARK: Properties
  public var action: String?
  public var cntNotAttempted: String?
  public var totalMarksLabel: String?
  public var attemptCount: Int?
  public var endDateValue: String?
  public var startDateLabel: String?
  public var contentTypeId: String?
  public var startDateValue: String?
  public var totalDuration: String?
  public var id: String?
  public var testTypeLabel: String?
  public var allowedMultiple: Bool? = false
  public var allowEdit: Int?
  public var title: String?
  public var passingMarksLabel: String?
  public var moduleId: String?
  public var cntAttempted: String?
  public var parentId: String?
  public var isDraft: Int?
  public var testType: Int?
  public var allowView: Int?
  public var attemptLabel: String?
  public var descriptionValue: String?
  public var attemptAfterDuedate: Bool? = false
  public var endDateUnformated: String?
  public var endDateLabel: String?
  public var startDateUnformated: String?
  public var moduleName: String?
  public var avgCompletionPercentage: String?
  public var passingMarks: String?
  public var totalQuestions: String?
  public var totalMarks: String?

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
    action = json[SerializationKeys.action].string
    cntNotAttempted = json[SerializationKeys.cntNotAttempted].string
    totalMarksLabel = json[SerializationKeys.totalMarksLabel].string
    attemptCount = json[SerializationKeys.attemptCount].int
    endDateValue = json[SerializationKeys.endDateValue].string
    startDateLabel = json[SerializationKeys.startDateLabel].string
    contentTypeId = json[SerializationKeys.contentTypeId].string
    startDateValue = json[SerializationKeys.startDateValue].string
    totalDuration = json[SerializationKeys.totalDuration].string
    id = json[SerializationKeys.id].string
    testTypeLabel = json[SerializationKeys.testTypeLabel].string
    allowedMultiple = json[SerializationKeys.allowedMultiple].boolValue
    allowEdit = json[SerializationKeys.allowEdit].int
    title = json[SerializationKeys.title].string
    passingMarksLabel = json[SerializationKeys.passingMarksLabel].string
    moduleId = json[SerializationKeys.moduleId].string
    cntAttempted = json[SerializationKeys.cntAttempted].string
    parentId = json[SerializationKeys.parentId].string
    isDraft = json[SerializationKeys.isDraft].int
    testType = json[SerializationKeys.testType].int
    allowView = json[SerializationKeys.allowView].int
    attemptLabel = json[SerializationKeys.attemptLabel].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    attemptAfterDuedate = json[SerializationKeys.attemptAfterDuedate].boolValue
    endDateUnformated = json[SerializationKeys.endDateUnformated].string
    endDateLabel = json[SerializationKeys.endDateLabel].string
    startDateUnformated = json[SerializationKeys.startDateUnformated].string
    moduleName = json[SerializationKeys.moduleName].string
    avgCompletionPercentage = json[SerializationKeys.avgCompletionPercentage].string
    passingMarks = json[SerializationKeys.passingMarks].string
    totalQuestions = json[SerializationKeys.totalQuestions].string
    totalMarks = json[SerializationKeys.totalMarks].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = action { dictionary[SerializationKeys.action] = value }
    if let value = cntNotAttempted { dictionary[SerializationKeys.cntNotAttempted] = value }
    if let value = totalMarksLabel { dictionary[SerializationKeys.totalMarksLabel] = value }
    if let value = attemptCount { dictionary[SerializationKeys.attemptCount] = value }
    if let value = endDateValue { dictionary[SerializationKeys.endDateValue] = value }
    if let value = startDateLabel { dictionary[SerializationKeys.startDateLabel] = value }
    if let value = contentTypeId { dictionary[SerializationKeys.contentTypeId] = value }
    if let value = startDateValue { dictionary[SerializationKeys.startDateValue] = value }
    if let value = totalDuration { dictionary[SerializationKeys.totalDuration] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = testTypeLabel { dictionary[SerializationKeys.testTypeLabel] = value }
    dictionary[SerializationKeys.allowedMultiple] = allowedMultiple
    if let value = allowEdit { dictionary[SerializationKeys.allowEdit] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = passingMarksLabel { dictionary[SerializationKeys.passingMarksLabel] = value }
    if let value = moduleId { dictionary[SerializationKeys.moduleId] = value }
    if let value = cntAttempted { dictionary[SerializationKeys.cntAttempted] = value }
    if let value = parentId { dictionary[SerializationKeys.parentId] = value }
    if let value = isDraft { dictionary[SerializationKeys.isDraft] = value }
    if let value = testType { dictionary[SerializationKeys.testType] = value }
    if let value = allowView { dictionary[SerializationKeys.allowView] = value }
    if let value = attemptLabel { dictionary[SerializationKeys.attemptLabel] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    dictionary[SerializationKeys.attemptAfterDuedate] = attemptAfterDuedate
    if let value = endDateUnformated { dictionary[SerializationKeys.endDateUnformated] = value }
    if let value = endDateLabel { dictionary[SerializationKeys.endDateLabel] = value }
    if let value = startDateUnformated { dictionary[SerializationKeys.startDateUnformated] = value }
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = avgCompletionPercentage { dictionary[SerializationKeys.avgCompletionPercentage] = value }
    if let value = passingMarks { dictionary[SerializationKeys.passingMarks] = value }
    if let value = totalQuestions { dictionary[SerializationKeys.totalQuestions] = value }
    if let value = totalMarks { dictionary[SerializationKeys.totalMarks] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.action = aDecoder.decodeObject(forKey: SerializationKeys.action) as? String
    self.cntNotAttempted = aDecoder.decodeObject(forKey: SerializationKeys.cntNotAttempted) as? String
    self.totalMarksLabel = aDecoder.decodeObject(forKey: SerializationKeys.totalMarksLabel) as? String
    self.attemptCount = aDecoder.decodeObject(forKey: SerializationKeys.attemptCount) as? Int
    self.endDateValue = aDecoder.decodeObject(forKey: SerializationKeys.endDateValue) as? String
    self.startDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.startDateLabel) as? String
    self.contentTypeId = aDecoder.decodeObject(forKey: SerializationKeys.contentTypeId) as? String
    self.startDateValue = aDecoder.decodeObject(forKey: SerializationKeys.startDateValue) as? String
    self.totalDuration = aDecoder.decodeObject(forKey: SerializationKeys.totalDuration) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.testTypeLabel = aDecoder.decodeObject(forKey: SerializationKeys.testTypeLabel) as? String
    self.allowedMultiple = aDecoder.decodeBool(forKey: SerializationKeys.allowedMultiple)
    self.allowEdit = aDecoder.decodeObject(forKey: SerializationKeys.allowEdit) as? Int
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.passingMarksLabel = aDecoder.decodeObject(forKey: SerializationKeys.passingMarksLabel) as? String
    self.moduleId = aDecoder.decodeObject(forKey: SerializationKeys.moduleId) as? String
    self.cntAttempted = aDecoder.decodeObject(forKey: SerializationKeys.cntAttempted) as? String
    self.parentId = aDecoder.decodeObject(forKey: SerializationKeys.parentId) as? String
    self.isDraft = aDecoder.decodeObject(forKey: SerializationKeys.isDraft) as? Int
    self.testType = aDecoder.decodeObject(forKey: SerializationKeys.testType) as? Int
    self.allowView = aDecoder.decodeObject(forKey: SerializationKeys.allowView) as? Int
    self.attemptLabel = aDecoder.decodeObject(forKey: SerializationKeys.attemptLabel) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.attemptAfterDuedate = aDecoder.decodeBool(forKey: SerializationKeys.attemptAfterDuedate)
    self.endDateUnformated = aDecoder.decodeObject(forKey: SerializationKeys.endDateUnformated) as? String
    self.endDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.endDateLabel) as? String
    self.startDateUnformated = aDecoder.decodeObject(forKey: SerializationKeys.startDateUnformated) as? String
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.avgCompletionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.avgCompletionPercentage) as? String
    self.passingMarks = aDecoder.decodeObject(forKey: SerializationKeys.passingMarks) as? String
    self.totalQuestions = aDecoder.decodeObject(forKey: SerializationKeys.totalQuestions) as? String
    self.totalMarks = aDecoder.decodeObject(forKey: SerializationKeys.totalMarks) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(action, forKey: SerializationKeys.action)
    aCoder.encode(cntNotAttempted, forKey: SerializationKeys.cntNotAttempted)
    aCoder.encode(totalMarksLabel, forKey: SerializationKeys.totalMarksLabel)
    aCoder.encode(attemptCount, forKey: SerializationKeys.attemptCount)
    aCoder.encode(endDateValue, forKey: SerializationKeys.endDateValue)
    aCoder.encode(startDateLabel, forKey: SerializationKeys.startDateLabel)
    aCoder.encode(contentTypeId, forKey: SerializationKeys.contentTypeId)
    aCoder.encode(startDateValue, forKey: SerializationKeys.startDateValue)
    aCoder.encode(totalDuration, forKey: SerializationKeys.totalDuration)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(testTypeLabel, forKey: SerializationKeys.testTypeLabel)
    aCoder.encode(allowedMultiple, forKey: SerializationKeys.allowedMultiple)
    aCoder.encode(allowEdit, forKey: SerializationKeys.allowEdit)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(passingMarksLabel, forKey: SerializationKeys.passingMarksLabel)
    aCoder.encode(moduleId, forKey: SerializationKeys.moduleId)
    aCoder.encode(cntAttempted, forKey: SerializationKeys.cntAttempted)
    aCoder.encode(parentId, forKey: SerializationKeys.parentId)
    aCoder.encode(isDraft, forKey: SerializationKeys.isDraft)
    aCoder.encode(testType, forKey: SerializationKeys.testType)
    aCoder.encode(allowView, forKey: SerializationKeys.allowView)
    aCoder.encode(attemptLabel, forKey: SerializationKeys.attemptLabel)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(attemptAfterDuedate, forKey: SerializationKeys.attemptAfterDuedate)
    aCoder.encode(endDateUnformated, forKey: SerializationKeys.endDateUnformated)
    aCoder.encode(endDateLabel, forKey: SerializationKeys.endDateLabel)
    aCoder.encode(startDateUnformated, forKey: SerializationKeys.startDateUnformated)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(avgCompletionPercentage, forKey: SerializationKeys.avgCompletionPercentage)
    aCoder.encode(passingMarks, forKey: SerializationKeys.passingMarks)
    aCoder.encode(totalQuestions, forKey: SerializationKeys.totalQuestions)
    aCoder.encode(totalMarks, forKey: SerializationKeys.totalMarks)
  }

}
