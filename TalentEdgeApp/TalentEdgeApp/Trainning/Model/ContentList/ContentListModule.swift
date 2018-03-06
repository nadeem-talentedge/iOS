//
//  ContentListModule.swift
//
//  Created by Temp  on 31/05/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ContentListModule: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let action = "action"
    static let isDraft = "is_draft"
    static let likesCount = "likes_count"
    static let allowView = "allow_view"
    static let totalVideo = "total_video"
    static let descriptionValue = "description"
    static let totalInteractiveVideo = "total_interactive_video"
    static let totalNotes = "total_notes"
    static let endDateValue = "end_date_value"
    static let startDateLabel = "start_date_label"
    static let refType = "ref_type"
    static let endDateLabel = "end_date_label"
    static let totalAssignment = "total_assignment"
    static let contentTypeId = "content_type_id"
    static let contentDuration = "content_duration"
    static let moduleName = "module_name"
    static let id = "id"
    static let startDateValue = "start_date_value"
    static let totalAssessment = "total_assessment"
    static let viewCount = "view_count"
    static let allowEdit = "allow_edit"
    static let title = "title"
    static let completionPercentage = "completion_percentage"
    static let moduleId = "module_id"
  }

  // MARK: Properties
  public var action: String?
  public var isDraft: Int?
  public var likesCount: String?
  public var allowView: Int?
  public var totalVideo: String?
  public var descriptionValue: String?
  public var totalInteractiveVideo: String?
  public var totalNotes: String?
  public var endDateValue: String?
  public var startDateLabel: String?
  public var refType: String?
  public var endDateLabel: String?
  public var totalAssignment: String?
  public var contentTypeId: String?
  public var contentDuration: String?
  public var moduleName: String?
  public var id: String?
  public var startDateValue: String?
  public var totalAssessment: Int?
  public var viewCount: String?
  public var allowEdit: Int?
  public var title: String?
  public var completionPercentage: String?
  public var moduleId: String?

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
    isDraft = json[SerializationKeys.isDraft].int
    likesCount = json[SerializationKeys.likesCount].string
    allowView = json[SerializationKeys.allowView].int
    totalVideo = json[SerializationKeys.totalVideo].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    totalInteractiveVideo = json[SerializationKeys.totalInteractiveVideo].string
    totalNotes = json[SerializationKeys.totalNotes].string
    endDateValue = json[SerializationKeys.endDateValue].string
    startDateLabel = json[SerializationKeys.startDateLabel].string
    refType = json[SerializationKeys.refType].string
    endDateLabel = json[SerializationKeys.endDateLabel].string
    totalAssignment = json[SerializationKeys.totalAssignment].string
    contentTypeId = json[SerializationKeys.contentTypeId].string
    contentDuration = json[SerializationKeys.contentDuration].string
    moduleName = json[SerializationKeys.moduleName].string
    id = json[SerializationKeys.id].string
    startDateValue = json[SerializationKeys.startDateValue].string
    totalAssessment = json[SerializationKeys.totalAssessment].int
    viewCount = json[SerializationKeys.viewCount].string
    allowEdit = json[SerializationKeys.allowEdit].int
    title = json[SerializationKeys.title].string
    completionPercentage = json[SerializationKeys.completionPercentage].string
    moduleId = json[SerializationKeys.moduleId].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = action { dictionary[SerializationKeys.action] = value }
    if let value = isDraft { dictionary[SerializationKeys.isDraft] = value }
    if let value = likesCount { dictionary[SerializationKeys.likesCount] = value }
    if let value = allowView { dictionary[SerializationKeys.allowView] = value }
    if let value = totalVideo { dictionary[SerializationKeys.totalVideo] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = totalInteractiveVideo { dictionary[SerializationKeys.totalInteractiveVideo] = value }
    if let value = totalNotes { dictionary[SerializationKeys.totalNotes] = value }
    if let value = endDateValue { dictionary[SerializationKeys.endDateValue] = value }
    if let value = startDateLabel { dictionary[SerializationKeys.startDateLabel] = value }
    if let value = refType { dictionary[SerializationKeys.refType] = value }
    if let value = endDateLabel { dictionary[SerializationKeys.endDateLabel] = value }
    if let value = totalAssignment { dictionary[SerializationKeys.totalAssignment] = value }
    if let value = contentTypeId { dictionary[SerializationKeys.contentTypeId] = value }
    if let value = contentDuration { dictionary[SerializationKeys.contentDuration] = value }
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = startDateValue { dictionary[SerializationKeys.startDateValue] = value }
    if let value = totalAssessment { dictionary[SerializationKeys.totalAssessment] = value }
    if let value = viewCount { dictionary[SerializationKeys.viewCount] = value }
    if let value = allowEdit { dictionary[SerializationKeys.allowEdit] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = completionPercentage { dictionary[SerializationKeys.completionPercentage] = value }
    if let value = moduleId { dictionary[SerializationKeys.moduleId] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.action = aDecoder.decodeObject(forKey: SerializationKeys.action) as? String
    self.isDraft = aDecoder.decodeObject(forKey: SerializationKeys.isDraft) as? Int
    self.likesCount = aDecoder.decodeObject(forKey: SerializationKeys.likesCount) as? String
    self.allowView = aDecoder.decodeObject(forKey: SerializationKeys.allowView) as? Int
    self.totalVideo = aDecoder.decodeObject(forKey: SerializationKeys.totalVideo) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.totalInteractiveVideo = aDecoder.decodeObject(forKey: SerializationKeys.totalInteractiveVideo) as? String
    self.totalNotes = aDecoder.decodeObject(forKey: SerializationKeys.totalNotes) as? String
    self.endDateValue = aDecoder.decodeObject(forKey: SerializationKeys.endDateValue) as? String
    self.startDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.startDateLabel) as? String
    self.refType = aDecoder.decodeObject(forKey: SerializationKeys.refType) as? String
    self.endDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.endDateLabel) as? String
    self.totalAssignment = aDecoder.decodeObject(forKey: SerializationKeys.totalAssignment) as? String
    self.contentTypeId = aDecoder.decodeObject(forKey: SerializationKeys.contentTypeId) as? String
    self.contentDuration = aDecoder.decodeObject(forKey: SerializationKeys.contentDuration) as? String
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.startDateValue = aDecoder.decodeObject(forKey: SerializationKeys.startDateValue) as? String
    self.totalAssessment = aDecoder.decodeObject(forKey: SerializationKeys.totalAssessment) as? Int
    self.viewCount = aDecoder.decodeObject(forKey: SerializationKeys.viewCount) as? String
    self.allowEdit = aDecoder.decodeObject(forKey: SerializationKeys.allowEdit) as? Int
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.completionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.completionPercentage) as? String
    self.moduleId = aDecoder.decodeObject(forKey: SerializationKeys.moduleId) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(action, forKey: SerializationKeys.action)
    aCoder.encode(isDraft, forKey: SerializationKeys.isDraft)
    aCoder.encode(likesCount, forKey: SerializationKeys.likesCount)
    aCoder.encode(allowView, forKey: SerializationKeys.allowView)
    aCoder.encode(totalVideo, forKey: SerializationKeys.totalVideo)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(totalInteractiveVideo, forKey: SerializationKeys.totalInteractiveVideo)
    aCoder.encode(totalNotes, forKey: SerializationKeys.totalNotes)
    aCoder.encode(endDateValue, forKey: SerializationKeys.endDateValue)
    aCoder.encode(startDateLabel, forKey: SerializationKeys.startDateLabel)
    aCoder.encode(refType, forKey: SerializationKeys.refType)
    aCoder.encode(endDateLabel, forKey: SerializationKeys.endDateLabel)
    aCoder.encode(totalAssignment, forKey: SerializationKeys.totalAssignment)
    aCoder.encode(contentTypeId, forKey: SerializationKeys.contentTypeId)
    aCoder.encode(contentDuration, forKey: SerializationKeys.contentDuration)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(startDateValue, forKey: SerializationKeys.startDateValue)
    aCoder.encode(totalAssessment, forKey: SerializationKeys.totalAssessment)
    aCoder.encode(viewCount, forKey: SerializationKeys.viewCount)
    aCoder.encode(allowEdit, forKey: SerializationKeys.allowEdit)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(completionPercentage, forKey: SerializationKeys.completionPercentage)
    aCoder.encode(moduleId, forKey: SerializationKeys.moduleId)
  }

}
