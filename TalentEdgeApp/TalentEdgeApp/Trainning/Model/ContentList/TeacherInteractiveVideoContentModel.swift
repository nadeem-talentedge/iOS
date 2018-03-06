//
//  TeacherInteractiveVideoContentModel.swift
//
//  Created by Vinod Kumar on 10/10/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TeacherInteractiveVideoContentModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let action = "action"
    static let isDraft = "is_draft"
    static let likesCount = "likes_count"
    static let cntNotCompleted = "cnt_not_completed"
    static let allowView = "allow_view"
    static let contentDurationFormated = "content_duration_formated"
    static let descriptionValue = "description"
    static let cntCompleted = "cnt_completed"
    static let startDateLabel = "start_date_label"
    static let refType = "ref_type"
    static let contentTypeId = "content_type_id"
    static let startDateValue = "start_date_value"
    static let viewCount = "view_count"
    static let publishedByLabel = "published_by_label"
    static let contentDuration = "content_duration"
    static let moduleName = "module_name"
    static let id = "id"
    static let contentPath = "content_path"
    static let allowEdit = "allow_edit"
    static let title = "title"
    static let moduleId = "module_id"
    static let avgCompletionPercentage = "avg_completion_percentage"
    static let publishedByValue = "published_by_value"
  }

  // MARK: Properties
  public var action: String?
  public var isDraft: Int?
  public var likesCount: String?
  public var cntNotCompleted: String?
  public var allowView: Int?
  public var contentDurationFormated: String?
  public var descriptionValue: String?
  public var cntCompleted: String?
  public var startDateLabel: String?
  public var refType: String?
  public var contentTypeId: String?
  public var startDateValue: String?
  public var viewCount: String?
  public var publishedByLabel: String?
  public var contentDuration: String?
  public var moduleName: String?
  public var id: String?
  public var contentPath: String?
  public var allowEdit: Int?
  public var title: String?
  public var moduleId: String?
  public var avgCompletionPercentage: String?
  public var publishedByValue: String?

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
    cntNotCompleted = json[SerializationKeys.cntNotCompleted].string
    allowView = json[SerializationKeys.allowView].int
    contentDurationFormated = json[SerializationKeys.contentDurationFormated].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    cntCompleted = json[SerializationKeys.cntCompleted].string
    startDateLabel = json[SerializationKeys.startDateLabel].string
    refType = json[SerializationKeys.refType].string
    contentTypeId = json[SerializationKeys.contentTypeId].string
    startDateValue = json[SerializationKeys.startDateValue].string
    viewCount = json[SerializationKeys.viewCount].string
    publishedByLabel = json[SerializationKeys.publishedByLabel].string
    contentDuration = json[SerializationKeys.contentDuration].string
    moduleName = json[SerializationKeys.moduleName].string
    id = json[SerializationKeys.id].string
    contentPath = json[SerializationKeys.contentPath].string
    allowEdit = json[SerializationKeys.allowEdit].int
    title = json[SerializationKeys.title].string
    moduleId = json[SerializationKeys.moduleId].string
    avgCompletionPercentage = json[SerializationKeys.avgCompletionPercentage].string
    publishedByValue = json[SerializationKeys.publishedByValue].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = action { dictionary[SerializationKeys.action] = value }
    if let value = isDraft { dictionary[SerializationKeys.isDraft] = value }
    if let value = likesCount { dictionary[SerializationKeys.likesCount] = value }
    if let value = cntNotCompleted { dictionary[SerializationKeys.cntNotCompleted] = value }
    if let value = allowView { dictionary[SerializationKeys.allowView] = value }
    if let value = contentDurationFormated { dictionary[SerializationKeys.contentDurationFormated] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = cntCompleted { dictionary[SerializationKeys.cntCompleted] = value }
    if let value = startDateLabel { dictionary[SerializationKeys.startDateLabel] = value }
    if let value = refType { dictionary[SerializationKeys.refType] = value }
    if let value = contentTypeId { dictionary[SerializationKeys.contentTypeId] = value }
    if let value = startDateValue { dictionary[SerializationKeys.startDateValue] = value }
    if let value = viewCount { dictionary[SerializationKeys.viewCount] = value }
    if let value = publishedByLabel { dictionary[SerializationKeys.publishedByLabel] = value }
    if let value = contentDuration { dictionary[SerializationKeys.contentDuration] = value }
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = contentPath { dictionary[SerializationKeys.contentPath] = value }
    if let value = allowEdit { dictionary[SerializationKeys.allowEdit] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = moduleId { dictionary[SerializationKeys.moduleId] = value }
    if let value = avgCompletionPercentage { dictionary[SerializationKeys.avgCompletionPercentage] = value }
    if let value = publishedByValue { dictionary[SerializationKeys.publishedByValue] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.action = aDecoder.decodeObject(forKey: SerializationKeys.action) as? String
    self.isDraft = aDecoder.decodeObject(forKey: SerializationKeys.isDraft) as? Int
    self.likesCount = aDecoder.decodeObject(forKey: SerializationKeys.likesCount) as? String
    self.cntNotCompleted = aDecoder.decodeObject(forKey: SerializationKeys.cntNotCompleted) as? String
    self.allowView = aDecoder.decodeObject(forKey: SerializationKeys.allowView) as? Int
    self.contentDurationFormated = aDecoder.decodeObject(forKey: SerializationKeys.contentDurationFormated) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.cntCompleted = aDecoder.decodeObject(forKey: SerializationKeys.cntCompleted) as? String
    self.startDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.startDateLabel) as? String
    self.refType = aDecoder.decodeObject(forKey: SerializationKeys.refType) as? String
    self.contentTypeId = aDecoder.decodeObject(forKey: SerializationKeys.contentTypeId) as? String
    self.startDateValue = aDecoder.decodeObject(forKey: SerializationKeys.startDateValue) as? String
    self.viewCount = aDecoder.decodeObject(forKey: SerializationKeys.viewCount) as? String
    self.publishedByLabel = aDecoder.decodeObject(forKey: SerializationKeys.publishedByLabel) as? String
    self.contentDuration = aDecoder.decodeObject(forKey: SerializationKeys.contentDuration) as? String
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.contentPath = aDecoder.decodeObject(forKey: SerializationKeys.contentPath) as? String
    self.allowEdit = aDecoder.decodeObject(forKey: SerializationKeys.allowEdit) as? Int
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.moduleId = aDecoder.decodeObject(forKey: SerializationKeys.moduleId) as? String
    self.avgCompletionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.avgCompletionPercentage) as? String
    self.publishedByValue = aDecoder.decodeObject(forKey: SerializationKeys.publishedByValue) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(action, forKey: SerializationKeys.action)
    aCoder.encode(isDraft, forKey: SerializationKeys.isDraft)
    aCoder.encode(likesCount, forKey: SerializationKeys.likesCount)
    aCoder.encode(cntNotCompleted, forKey: SerializationKeys.cntNotCompleted)
    aCoder.encode(allowView, forKey: SerializationKeys.allowView)
    aCoder.encode(contentDurationFormated, forKey: SerializationKeys.contentDurationFormated)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(cntCompleted, forKey: SerializationKeys.cntCompleted)
    aCoder.encode(startDateLabel, forKey: SerializationKeys.startDateLabel)
    aCoder.encode(refType, forKey: SerializationKeys.refType)
    aCoder.encode(contentTypeId, forKey: SerializationKeys.contentTypeId)
    aCoder.encode(startDateValue, forKey: SerializationKeys.startDateValue)
    aCoder.encode(viewCount, forKey: SerializationKeys.viewCount)
    aCoder.encode(publishedByLabel, forKey: SerializationKeys.publishedByLabel)
    aCoder.encode(contentDuration, forKey: SerializationKeys.contentDuration)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(contentPath, forKey: SerializationKeys.contentPath)
    aCoder.encode(allowEdit, forKey: SerializationKeys.allowEdit)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(moduleId, forKey: SerializationKeys.moduleId)
    aCoder.encode(avgCompletionPercentage, forKey: SerializationKeys.avgCompletionPercentage)
    aCoder.encode(publishedByValue, forKey: SerializationKeys.publishedByValue)
  }

}
