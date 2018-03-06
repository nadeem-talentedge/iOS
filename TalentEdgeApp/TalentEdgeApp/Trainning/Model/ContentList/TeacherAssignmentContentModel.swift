//
//  TeacherAssignmentContentModel.swift
//
//  Created by Vinod Kumar on 01/10/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TeacherAssignmentContentModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let totalMarks = "total_marks"
    static let action = "action"
    static let isGraded = "is_graded"
    static let totalMarksLabel = "total_marks_label"
    static let cntNotSubmitted = "cnt_not_submitted"
    static let endDateValue = "end_date_value"
    static let startDateLabel = "start_date_label"
    static let contentTypeId = "content_type_id"
    static let startDateValue = "start_date_value"
    static let submissionCount = "submission_count"
    static let id = "id"
    static let allowedMultiple = "allowed_multiple"
    static let allowEdit = "allow_edit"
    static let title = "title"
    static let passingMarksLabel = "passing_marks_label"
    static let moduleId = "module_id"
    static let cntSubmitted = "cnt_submitted"
    static let parentId = "parent_id"
    static let isDraft = "is_draft"
    static let allowView = "allow_view"
    static let descriptionValue = "description"
    static let endDateLabel = "end_date_label"
    static let showGradesOnly = "show_grades_only"
    static let moduleName = "module_name"
    static let submissionLabel = "submission_label"
    static let passingMarks = "passing_marks"
    static let avgCompletionPercentage = "avg_completion_percentage"
    static let submissionMode = "submission_mode"
  }

  // MARK: Properties
  public var totalMarks: String?
  public var action: String?
  public var isGraded: String?
  public var totalMarksLabel: String?
  public var cntNotSubmitted: String?
  public var endDateValue: String?
  public var startDateLabel: String?
  public var contentTypeId: String?
  public var startDateValue: String?
  public var submissionCount: Int?
  public var id: String?
  public var allowedMultiple: String?
  public var allowEdit: Int?
  public var title: String?
  public var passingMarksLabel: String?
  public var moduleId: String?
  public var cntSubmitted: String?
  public var parentId: String?
  public var isDraft: Int?
  public var allowView: Int?
  public var descriptionValue: String?
  public var endDateLabel: String?
  public var showGradesOnly: Bool? = false
  public var moduleName: String?
  public var submissionLabel: String?
  public var passingMarks: String?
  public var avgCompletionPercentage: String?
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
    isGraded = json[SerializationKeys.isGraded].string
    totalMarksLabel = json[SerializationKeys.totalMarksLabel].string
    cntNotSubmitted = json[SerializationKeys.cntNotSubmitted].string
    endDateValue = json[SerializationKeys.endDateValue].string
    startDateLabel = json[SerializationKeys.startDateLabel].string
    contentTypeId = json[SerializationKeys.contentTypeId].string
    startDateValue = json[SerializationKeys.startDateValue].string
    submissionCount = json[SerializationKeys.submissionCount].int
    id = json[SerializationKeys.id].string
    allowedMultiple = json[SerializationKeys.allowedMultiple].string
    allowEdit = json[SerializationKeys.allowEdit].int
    title = json[SerializationKeys.title].string
    passingMarksLabel = json[SerializationKeys.passingMarksLabel].string
    moduleId = json[SerializationKeys.moduleId].string
    cntSubmitted = json[SerializationKeys.cntSubmitted].string
    parentId = json[SerializationKeys.parentId].string
    isDraft = json[SerializationKeys.isDraft].int
    allowView = json[SerializationKeys.allowView].int
    descriptionValue = json[SerializationKeys.descriptionValue].string
    endDateLabel = json[SerializationKeys.endDateLabel].string
    showGradesOnly = json[SerializationKeys.showGradesOnly].boolValue
    moduleName = json[SerializationKeys.moduleName].string
    submissionLabel = json[SerializationKeys.submissionLabel].string
    passingMarks = json[SerializationKeys.passingMarks].string
    avgCompletionPercentage = json[SerializationKeys.avgCompletionPercentage].string
    submissionMode = json[SerializationKeys.submissionMode].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = totalMarks { dictionary[SerializationKeys.totalMarks] = value }
    if let value = action { dictionary[SerializationKeys.action] = value }
    if let value = isGraded { dictionary[SerializationKeys.isGraded] = value }
    if let value = totalMarksLabel { dictionary[SerializationKeys.totalMarksLabel] = value }
    if let value = cntNotSubmitted { dictionary[SerializationKeys.cntNotSubmitted] = value }
    if let value = endDateValue { dictionary[SerializationKeys.endDateValue] = value }
    if let value = startDateLabel { dictionary[SerializationKeys.startDateLabel] = value }
    if let value = contentTypeId { dictionary[SerializationKeys.contentTypeId] = value }
    if let value = startDateValue { dictionary[SerializationKeys.startDateValue] = value }
    if let value = submissionCount { dictionary[SerializationKeys.submissionCount] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = allowedMultiple { dictionary[SerializationKeys.allowedMultiple] = value }
    if let value = allowEdit { dictionary[SerializationKeys.allowEdit] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = passingMarksLabel { dictionary[SerializationKeys.passingMarksLabel] = value }
    if let value = moduleId { dictionary[SerializationKeys.moduleId] = value }
    if let value = cntSubmitted { dictionary[SerializationKeys.cntSubmitted] = value }
    if let value = parentId { dictionary[SerializationKeys.parentId] = value }
    if let value = isDraft { dictionary[SerializationKeys.isDraft] = value }
    if let value = allowView { dictionary[SerializationKeys.allowView] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = endDateLabel { dictionary[SerializationKeys.endDateLabel] = value }
    dictionary[SerializationKeys.showGradesOnly] = showGradesOnly
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = submissionLabel { dictionary[SerializationKeys.submissionLabel] = value }
    if let value = passingMarks { dictionary[SerializationKeys.passingMarks] = value }
    if let value = avgCompletionPercentage { dictionary[SerializationKeys.avgCompletionPercentage] = value }
    if let value = submissionMode { dictionary[SerializationKeys.submissionMode] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.totalMarks = aDecoder.decodeObject(forKey: SerializationKeys.totalMarks) as? String
    self.action = aDecoder.decodeObject(forKey: SerializationKeys.action) as? String
    self.isGraded = aDecoder.decodeObject(forKey: SerializationKeys.isGraded) as? String
    self.totalMarksLabel = aDecoder.decodeObject(forKey: SerializationKeys.totalMarksLabel) as? String
    self.cntNotSubmitted = aDecoder.decodeObject(forKey: SerializationKeys.cntNotSubmitted) as? String
    self.endDateValue = aDecoder.decodeObject(forKey: SerializationKeys.endDateValue) as? String
    self.startDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.startDateLabel) as? String
    self.contentTypeId = aDecoder.decodeObject(forKey: SerializationKeys.contentTypeId) as? String
    self.startDateValue = aDecoder.decodeObject(forKey: SerializationKeys.startDateValue) as? String
    self.submissionCount = aDecoder.decodeObject(forKey: SerializationKeys.submissionCount) as? Int
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.allowedMultiple = aDecoder.decodeObject(forKey: SerializationKeys.allowedMultiple) as? String
    self.allowEdit = aDecoder.decodeObject(forKey: SerializationKeys.allowEdit) as? Int
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.passingMarksLabel = aDecoder.decodeObject(forKey: SerializationKeys.passingMarksLabel) as? String
    self.moduleId = aDecoder.decodeObject(forKey: SerializationKeys.moduleId) as? String
    self.cntSubmitted = aDecoder.decodeObject(forKey: SerializationKeys.cntSubmitted) as? String
    self.parentId = aDecoder.decodeObject(forKey: SerializationKeys.parentId) as? String
    self.isDraft = aDecoder.decodeObject(forKey: SerializationKeys.isDraft) as? Int
    self.allowView = aDecoder.decodeObject(forKey: SerializationKeys.allowView) as? Int
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.endDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.endDateLabel) as? String
    self.showGradesOnly = aDecoder.decodeBool(forKey: SerializationKeys.showGradesOnly)
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.submissionLabel = aDecoder.decodeObject(forKey: SerializationKeys.submissionLabel) as? String
    self.passingMarks = aDecoder.decodeObject(forKey: SerializationKeys.passingMarks) as? String
    self.avgCompletionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.avgCompletionPercentage) as? String
    self.submissionMode = aDecoder.decodeObject(forKey: SerializationKeys.submissionMode) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(totalMarks, forKey: SerializationKeys.totalMarks)
    aCoder.encode(action, forKey: SerializationKeys.action)
    aCoder.encode(isGraded, forKey: SerializationKeys.isGraded)
    aCoder.encode(totalMarksLabel, forKey: SerializationKeys.totalMarksLabel)
    aCoder.encode(cntNotSubmitted, forKey: SerializationKeys.cntNotSubmitted)
    aCoder.encode(endDateValue, forKey: SerializationKeys.endDateValue)
    aCoder.encode(startDateLabel, forKey: SerializationKeys.startDateLabel)
    aCoder.encode(contentTypeId, forKey: SerializationKeys.contentTypeId)
    aCoder.encode(startDateValue, forKey: SerializationKeys.startDateValue)
    aCoder.encode(submissionCount, forKey: SerializationKeys.submissionCount)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(allowedMultiple, forKey: SerializationKeys.allowedMultiple)
    aCoder.encode(allowEdit, forKey: SerializationKeys.allowEdit)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(passingMarksLabel, forKey: SerializationKeys.passingMarksLabel)
    aCoder.encode(moduleId, forKey: SerializationKeys.moduleId)
    aCoder.encode(cntSubmitted, forKey: SerializationKeys.cntSubmitted)
    aCoder.encode(parentId, forKey: SerializationKeys.parentId)
    aCoder.encode(isDraft, forKey: SerializationKeys.isDraft)
    aCoder.encode(allowView, forKey: SerializationKeys.allowView)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(endDateLabel, forKey: SerializationKeys.endDateLabel)
    aCoder.encode(showGradesOnly, forKey: SerializationKeys.showGradesOnly)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(submissionLabel, forKey: SerializationKeys.submissionLabel)
    aCoder.encode(passingMarks, forKey: SerializationKeys.passingMarks)
    aCoder.encode(avgCompletionPercentage, forKey: SerializationKeys.avgCompletionPercentage)
    aCoder.encode(submissionMode, forKey: SerializationKeys.submissionMode)
  }

}
