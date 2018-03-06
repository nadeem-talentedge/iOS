//
//  TeacherModulePlannerContentModel.swift
//
//  Created by Vinod Kumar on 01/10/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TeacherModulePlannerContentModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let action = "action"
    static let cntNotCompleted = "cnt_not_completed"
    static let totalVideo = "total_video"
    static let totalInteractiveVideo = "total_interactive_video"
    static let cntCompleted = "cnt_completed"
    static let totalNotes = "total_notes"
    static let endDateValue = "end_date_value"
    static let startDateLabel = "start_date_label"
    static let refType = "ref_type"
    static let totalAssignment = "total_assignment"
    static let contentTypeId = "content_type_id"
    static let startDateValue = "start_date_value"
    static let contentDuration = "content_duration"
    static let totalAssessment = "total_assessment"
    static let id = "id"
    static let viewCount = "view_count"
    static let allowEdit = "allow_edit"
    static let title = "title"
    static let moduleId = "module_id"
    static let isDraft = "is_draft"
    static let allowView = "allow_view"
    static let descriptionValue = "description"
    static let endDateLabel = "end_date_label"
    static let moduleName = "module_name"
    static let avgCompletionPercentage = "avg_completion_percentage"
  }

  // MARK: Properties
  public var action: String?
  public var cntNotCompleted: String?
  public var totalVideo: Int?
  public var totalInteractiveVideo: Int?
  public var cntCompleted: String?
  public var totalNotes: String?
  public var endDateValue: String?
  public var startDateLabel: String?
  public var refType: String?
  public var totalAssignment: String?
  public var contentTypeId: String?
  public var startDateValue: String?
  public var contentDuration: String?
  public var totalAssessment: String?
  public var id: String?
  public var viewCount: String?
  public var allowEdit: Int?
  public var title: String?
  public var moduleId: String?
  public var isDraft: Int?
  public var allowView: Int?
  public var descriptionValue: String?
  public var endDateLabel: String?
  public var moduleName: String?
  public var avgCompletionPercentage: String?

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
    cntNotCompleted = json[SerializationKeys.cntNotCompleted].string
    totalVideo = json[SerializationKeys.totalVideo].int
    totalInteractiveVideo = json[SerializationKeys.totalInteractiveVideo].int
    cntCompleted = json[SerializationKeys.cntCompleted].string
    totalNotes = json[SerializationKeys.totalNotes].string
    endDateValue = json[SerializationKeys.endDateValue].string
    startDateLabel = json[SerializationKeys.startDateLabel].string
    refType = json[SerializationKeys.refType].string
    totalAssignment = json[SerializationKeys.totalAssignment].string
    contentTypeId = json[SerializationKeys.contentTypeId].string
    startDateValue = json[SerializationKeys.startDateValue].string
    contentDuration = json[SerializationKeys.contentDuration].string
    totalAssessment = json[SerializationKeys.totalAssessment].string
    id = json[SerializationKeys.id].string
    viewCount = json[SerializationKeys.viewCount].string
    allowEdit = json[SerializationKeys.allowEdit].int
    title = json[SerializationKeys.title].string
    moduleId = json[SerializationKeys.moduleId].string
    isDraft = json[SerializationKeys.isDraft].int
    allowView = json[SerializationKeys.allowView].int
    descriptionValue = json[SerializationKeys.descriptionValue].string
    endDateLabel = json[SerializationKeys.endDateLabel].string
    moduleName = json[SerializationKeys.moduleName].string
    avgCompletionPercentage = json[SerializationKeys.avgCompletionPercentage].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = action { dictionary[SerializationKeys.action] = value }
    if let value = cntNotCompleted { dictionary[SerializationKeys.cntNotCompleted] = value }
    if let value = totalVideo { dictionary[SerializationKeys.totalVideo] = value }
    if let value = totalInteractiveVideo { dictionary[SerializationKeys.totalInteractiveVideo] = value }
    if let value = cntCompleted { dictionary[SerializationKeys.cntCompleted] = value }
    if let value = totalNotes { dictionary[SerializationKeys.totalNotes] = value }
    if let value = endDateValue { dictionary[SerializationKeys.endDateValue] = value }
    if let value = startDateLabel { dictionary[SerializationKeys.startDateLabel] = value }
    if let value = refType { dictionary[SerializationKeys.refType] = value }
    if let value = totalAssignment { dictionary[SerializationKeys.totalAssignment] = value }
    if let value = contentTypeId { dictionary[SerializationKeys.contentTypeId] = value }
    if let value = startDateValue { dictionary[SerializationKeys.startDateValue] = value }
    if let value = contentDuration { dictionary[SerializationKeys.contentDuration] = value }
    if let value = totalAssessment { dictionary[SerializationKeys.totalAssessment] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = viewCount { dictionary[SerializationKeys.viewCount] = value }
    if let value = allowEdit { dictionary[SerializationKeys.allowEdit] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = moduleId { dictionary[SerializationKeys.moduleId] = value }
    if let value = isDraft { dictionary[SerializationKeys.isDraft] = value }
    if let value = allowView { dictionary[SerializationKeys.allowView] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = endDateLabel { dictionary[SerializationKeys.endDateLabel] = value }
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = avgCompletionPercentage { dictionary[SerializationKeys.avgCompletionPercentage] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.action = aDecoder.decodeObject(forKey: SerializationKeys.action) as? String
    self.cntNotCompleted = aDecoder.decodeObject(forKey: SerializationKeys.cntNotCompleted) as? String
    self.totalVideo = aDecoder.decodeObject(forKey: SerializationKeys.totalVideo) as? Int
    self.totalInteractiveVideo = aDecoder.decodeObject(forKey: SerializationKeys.totalInteractiveVideo) as? Int
    self.cntCompleted = aDecoder.decodeObject(forKey: SerializationKeys.cntCompleted) as? String
    self.totalNotes = aDecoder.decodeObject(forKey: SerializationKeys.totalNotes) as? String
    self.endDateValue = aDecoder.decodeObject(forKey: SerializationKeys.endDateValue) as? String
    self.startDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.startDateLabel) as? String
    self.refType = aDecoder.decodeObject(forKey: SerializationKeys.refType) as? String
    self.totalAssignment = aDecoder.decodeObject(forKey: SerializationKeys.totalAssignment) as? String
    self.contentTypeId = aDecoder.decodeObject(forKey: SerializationKeys.contentTypeId) as? String
    self.startDateValue = aDecoder.decodeObject(forKey: SerializationKeys.startDateValue) as? String
    self.contentDuration = aDecoder.decodeObject(forKey: SerializationKeys.contentDuration) as? String
    self.totalAssessment = aDecoder.decodeObject(forKey: SerializationKeys.totalAssessment) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.viewCount = aDecoder.decodeObject(forKey: SerializationKeys.viewCount) as? String
    self.allowEdit = aDecoder.decodeObject(forKey: SerializationKeys.allowEdit) as? Int
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.moduleId = aDecoder.decodeObject(forKey: SerializationKeys.moduleId) as? String
    self.isDraft = aDecoder.decodeObject(forKey: SerializationKeys.isDraft) as? Int
    self.allowView = aDecoder.decodeObject(forKey: SerializationKeys.allowView) as? Int
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.endDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.endDateLabel) as? String
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.avgCompletionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.avgCompletionPercentage) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(action, forKey: SerializationKeys.action)
    aCoder.encode(cntNotCompleted, forKey: SerializationKeys.cntNotCompleted)
    aCoder.encode(totalVideo, forKey: SerializationKeys.totalVideo)
    aCoder.encode(totalInteractiveVideo, forKey: SerializationKeys.totalInteractiveVideo)
    aCoder.encode(cntCompleted, forKey: SerializationKeys.cntCompleted)
    aCoder.encode(totalNotes, forKey: SerializationKeys.totalNotes)
    aCoder.encode(endDateValue, forKey: SerializationKeys.endDateValue)
    aCoder.encode(startDateLabel, forKey: SerializationKeys.startDateLabel)
    aCoder.encode(refType, forKey: SerializationKeys.refType)
    aCoder.encode(totalAssignment, forKey: SerializationKeys.totalAssignment)
    aCoder.encode(contentTypeId, forKey: SerializationKeys.contentTypeId)
    aCoder.encode(startDateValue, forKey: SerializationKeys.startDateValue)
    aCoder.encode(contentDuration, forKey: SerializationKeys.contentDuration)
    aCoder.encode(totalAssessment, forKey: SerializationKeys.totalAssessment)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(viewCount, forKey: SerializationKeys.viewCount)
    aCoder.encode(allowEdit, forKey: SerializationKeys.allowEdit)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(moduleId, forKey: SerializationKeys.moduleId)
    aCoder.encode(isDraft, forKey: SerializationKeys.isDraft)
    aCoder.encode(allowView, forKey: SerializationKeys.allowView)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(endDateLabel, forKey: SerializationKeys.endDateLabel)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(avgCompletionPercentage, forKey: SerializationKeys.avgCompletionPercentage)
  }

}
