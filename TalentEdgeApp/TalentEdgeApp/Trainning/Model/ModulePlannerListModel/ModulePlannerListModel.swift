//
//  ModulePlannerListModel.swift
//
//  Created by Temp  on 17/06/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ModulePlannerListModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let action = "action"
    static let contentDurationFormated = "content_duration_formated"
    static let endDateValue = "end_date_value"
    static let startDateLabel = "start_date_label"
    static let refType = "ref_type"
    static let contentTypeId = "content_type_id"
    static let startDateValue = "start_date_value"
    static let publishedByLabel = "published_by_label"
    static let contentDuration = "content_duration"
    static let id = "id"
    static let allowedMultiple = "allowed_multiple"
    static let contentPath = "content_path"
    static let allowEdit = "allow_edit"
    static let title = "title"
    static let completionPercentage = "completion_percentage"
    static let moduleId = "module_id"
    static let publishedByValue = "published_by_value"
    static let notesCount = "notes_count"
    static let isDraft = "is_draft"
    static let allowView = "allow_view"
    static let descriptionValue = "description"
    static let attemptAfterDuedate = "attempt_after_duedate"
    static let endDateUnformated = "end_date_unformated"
    static let endDateLabel = "end_date_label"
    static let startDateUnformated = "start_date_unformated"
    static let moduleName = "module_name"
    static let isLocked = "is_locked"
  }

  // MARK: Properties
  public var action: String?
  public var contentDurationFormated: String?
  public var endDateValue: String?
  public var startDateLabel: String?
  public var refType: String?
  public var contentTypeId: String?
  public var startDateValue: String?
  public var publishedByLabel: String?
  public var contentDuration: String?
  public var id: String?
  public var allowedMultiple: Bool? = false
  public var contentPath: String?
  public var allowEdit: Int?
  public var title: String?
  public var completionPercentage: String?
  public var moduleId: String?
  public var publishedByValue: String?
  public var notesCount: String?
  public var isDraft: Int?
  public var allowView: Int?
  public var descriptionValue: String?
  public var attemptAfterDuedate: Bool? = false
  public var endDateUnformated: String?
  public var endDateLabel: String?
  public var startDateUnformated: String?
  public var moduleName: String?
  public var isLocked: Int?

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
    contentDurationFormated = json[SerializationKeys.contentDurationFormated].string
    endDateValue = json[SerializationKeys.endDateValue].string
    startDateLabel = json[SerializationKeys.startDateLabel].string
    refType = json[SerializationKeys.refType].string
    contentTypeId = json[SerializationKeys.contentTypeId].string
    startDateValue = json[SerializationKeys.startDateValue].string
    publishedByLabel = json[SerializationKeys.publishedByLabel].string
    contentDuration = json[SerializationKeys.contentDuration].string
    id = json[SerializationKeys.id].string
    allowedMultiple = json[SerializationKeys.allowedMultiple].boolValue
    contentPath = json[SerializationKeys.contentPath].string
    allowEdit = json[SerializationKeys.allowEdit].int
    title = json[SerializationKeys.title].string
    completionPercentage = json[SerializationKeys.completionPercentage].string
    moduleId = json[SerializationKeys.moduleId].string
    publishedByValue = json[SerializationKeys.publishedByValue].string
    notesCount = json[SerializationKeys.notesCount].string
    isDraft = json[SerializationKeys.isDraft].int
    allowView = json[SerializationKeys.allowView].int
    descriptionValue = json[SerializationKeys.descriptionValue].string
    attemptAfterDuedate = json[SerializationKeys.attemptAfterDuedate].boolValue
    endDateUnformated = json[SerializationKeys.endDateUnformated].string
    endDateLabel = json[SerializationKeys.endDateLabel].string
    startDateUnformated = json[SerializationKeys.startDateUnformated].string
    moduleName = json[SerializationKeys.moduleName].string
    isLocked = json[SerializationKeys.isLocked].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = action { dictionary[SerializationKeys.action] = value }
    if let value = contentDurationFormated { dictionary[SerializationKeys.contentDurationFormated] = value }
    if let value = endDateValue { dictionary[SerializationKeys.endDateValue] = value }
    if let value = startDateLabel { dictionary[SerializationKeys.startDateLabel] = value }
    if let value = refType { dictionary[SerializationKeys.refType] = value }
    if let value = contentTypeId { dictionary[SerializationKeys.contentTypeId] = value }
    if let value = startDateValue { dictionary[SerializationKeys.startDateValue] = value }
    if let value = publishedByLabel { dictionary[SerializationKeys.publishedByLabel] = value }
    if let value = contentDuration { dictionary[SerializationKeys.contentDuration] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    dictionary[SerializationKeys.allowedMultiple] = allowedMultiple
    if let value = contentPath { dictionary[SerializationKeys.contentPath] = value }
    if let value = allowEdit { dictionary[SerializationKeys.allowEdit] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = completionPercentage { dictionary[SerializationKeys.completionPercentage] = value }
    if let value = moduleId { dictionary[SerializationKeys.moduleId] = value }
    if let value = publishedByValue { dictionary[SerializationKeys.publishedByValue] = value }
    if let value = notesCount { dictionary[SerializationKeys.notesCount] = value }
    if let value = isDraft { dictionary[SerializationKeys.isDraft] = value }
    if let value = allowView { dictionary[SerializationKeys.allowView] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    dictionary[SerializationKeys.attemptAfterDuedate] = attemptAfterDuedate
    if let value = endDateUnformated { dictionary[SerializationKeys.endDateUnformated] = value }
    if let value = endDateLabel { dictionary[SerializationKeys.endDateLabel] = value }
    if let value = startDateUnformated { dictionary[SerializationKeys.startDateUnformated] = value }
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = isLocked { dictionary[SerializationKeys.isLocked] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.action = aDecoder.decodeObject(forKey: SerializationKeys.action) as? String
    self.contentDurationFormated = aDecoder.decodeObject(forKey: SerializationKeys.contentDurationFormated) as? String
    self.endDateValue = aDecoder.decodeObject(forKey: SerializationKeys.endDateValue) as? String
    self.startDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.startDateLabel) as? String
    self.refType = aDecoder.decodeObject(forKey: SerializationKeys.refType) as? String
    self.contentTypeId = aDecoder.decodeObject(forKey: SerializationKeys.contentTypeId) as? String
    self.startDateValue = aDecoder.decodeObject(forKey: SerializationKeys.startDateValue) as? String
    self.publishedByLabel = aDecoder.decodeObject(forKey: SerializationKeys.publishedByLabel) as? String
    self.contentDuration = aDecoder.decodeObject(forKey: SerializationKeys.contentDuration) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.allowedMultiple = aDecoder.decodeBool(forKey: SerializationKeys.allowedMultiple)
    self.contentPath = aDecoder.decodeObject(forKey: SerializationKeys.contentPath) as? String
    self.allowEdit = aDecoder.decodeObject(forKey: SerializationKeys.allowEdit) as? Int
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.completionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.completionPercentage) as? String
    self.moduleId = aDecoder.decodeObject(forKey: SerializationKeys.moduleId) as? String
    self.publishedByValue = aDecoder.decodeObject(forKey: SerializationKeys.publishedByValue) as? String
    self.notesCount = aDecoder.decodeObject(forKey: SerializationKeys.notesCount) as? String
    self.isDraft = aDecoder.decodeObject(forKey: SerializationKeys.isDraft) as? Int
    self.allowView = aDecoder.decodeObject(forKey: SerializationKeys.allowView) as? Int
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.attemptAfterDuedate = aDecoder.decodeBool(forKey: SerializationKeys.attemptAfterDuedate)
    self.endDateUnformated = aDecoder.decodeObject(forKey: SerializationKeys.endDateUnformated) as? String
    self.endDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.endDateLabel) as? String
    self.startDateUnformated = aDecoder.decodeObject(forKey: SerializationKeys.startDateUnformated) as? String
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.isLocked = aDecoder.decodeObject(forKey: SerializationKeys.isLocked) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(action, forKey: SerializationKeys.action)
    aCoder.encode(contentDurationFormated, forKey: SerializationKeys.contentDurationFormated)
    aCoder.encode(endDateValue, forKey: SerializationKeys.endDateValue)
    aCoder.encode(startDateLabel, forKey: SerializationKeys.startDateLabel)
    aCoder.encode(refType, forKey: SerializationKeys.refType)
    aCoder.encode(contentTypeId, forKey: SerializationKeys.contentTypeId)
    aCoder.encode(startDateValue, forKey: SerializationKeys.startDateValue)
    aCoder.encode(publishedByLabel, forKey: SerializationKeys.publishedByLabel)
    aCoder.encode(contentDuration, forKey: SerializationKeys.contentDuration)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(allowedMultiple, forKey: SerializationKeys.allowedMultiple)
    aCoder.encode(contentPath, forKey: SerializationKeys.contentPath)
    aCoder.encode(allowEdit, forKey: SerializationKeys.allowEdit)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(completionPercentage, forKey: SerializationKeys.completionPercentage)
    aCoder.encode(moduleId, forKey: SerializationKeys.moduleId)
    aCoder.encode(publishedByValue, forKey: SerializationKeys.publishedByValue)
    aCoder.encode(notesCount, forKey: SerializationKeys.notesCount)
    aCoder.encode(isDraft, forKey: SerializationKeys.isDraft)
    aCoder.encode(allowView, forKey: SerializationKeys.allowView)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(attemptAfterDuedate, forKey: SerializationKeys.attemptAfterDuedate)
    aCoder.encode(endDateUnformated, forKey: SerializationKeys.endDateUnformated)
    aCoder.encode(endDateLabel, forKey: SerializationKeys.endDateLabel)
    aCoder.encode(startDateUnformated, forKey: SerializationKeys.startDateUnformated)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(isLocked, forKey: SerializationKeys.isLocked)
  }

}
