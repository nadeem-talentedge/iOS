//
//  ANLiveClassModel.swift
//
//  Created by Vinod Kumar on 02/07/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ANLiveClassModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let action = "action"
    static let dateValue = "date_value"
    static let contentDurationFormated = "content_duration_formated"
    static let startDateFormatted = "start_date_formatted"
    static let endDateFormatted = "end_date_formatted"
    static let byUserPic = "by_user_pic"
    static let contentTypeId = "content_type_id"
    static let viewCount = "view_count"
    static let canView = "can_view"
    static let publishedByLabel = "published_by_label"
    static let contentDuration = "content_duration"
    static let id = "id"
    static let allowEdit = "allow_edit"
    static let title = "title"
    static let moduleId = "module_id"
    static let startDate = "start_date"
    static let endDate = "end_date"
    static let byUserName = "by_user_name"
    static let publishedByValue = "published_by_value"
    static let dateLabel = "date_label"
    static let byUserDesignation = "by_user_designation"
    static let likesCount = "likes_count"
    static let selfLiked = "self_liked"
    static let allowView = "allow_view"
    static let liveClassType = "live_class_type"
    static let descriptionValue = "description"
    static let moduleName = "module_name"
    static let commentCount = "comment_count"
    static let byUserDepartment = "by_user_department"
  }

  // MARK: Properties
  public var action: String?
  public var dateValue: String?
  public var contentDurationFormated: String?
  public var startDateFormatted: String?
  public var endDateFormatted: String?
  public var byUserPic: String?
  public var contentTypeId: String?
  public var viewCount: String?
  public var canView: Int?
  public var publishedByLabel: String?
  public var contentDuration: String?
  public var id: String?
  public var allowEdit: Int?
  public var title: String?
  public var moduleId: String?
  public var startDate: String?
  public var endDate: String?
  public var byUserName: String?
  public var publishedByValue: String?
  public var dateLabel: String?
  public var byUserDesignation: String?
  public var likesCount: String?
  public var selfLiked: Int?
  public var allowView: Int?
  public var liveClassType: String?
  public var descriptionValue: String?
  public var moduleName: String?
  public var commentCount: String?
  public var byUserDepartment: String?

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
    dateValue = json[SerializationKeys.dateValue].string
    contentDurationFormated = json[SerializationKeys.contentDurationFormated].string
    startDateFormatted = json[SerializationKeys.startDateFormatted].string
    endDateFormatted = json[SerializationKeys.endDateFormatted].string
    byUserPic = json[SerializationKeys.byUserPic].string
    contentTypeId = json[SerializationKeys.contentTypeId].string
    viewCount = json[SerializationKeys.viewCount].string
    canView = json[SerializationKeys.canView].int
    publishedByLabel = json[SerializationKeys.publishedByLabel].string
    contentDuration = json[SerializationKeys.contentDuration].string
    id = json[SerializationKeys.id].string
    allowEdit = json[SerializationKeys.allowEdit].int
    title = json[SerializationKeys.title].string
    moduleId = json[SerializationKeys.moduleId].string
    startDate = json[SerializationKeys.startDate].string
    endDate = json[SerializationKeys.endDate].string
    byUserName = json[SerializationKeys.byUserName].string
    publishedByValue = json[SerializationKeys.publishedByValue].string
    dateLabel = json[SerializationKeys.dateLabel].string
    byUserDesignation = json[SerializationKeys.byUserDesignation].string
    likesCount = json[SerializationKeys.likesCount].string
    selfLiked = json[SerializationKeys.selfLiked].int
    allowView = json[SerializationKeys.allowView].int
    liveClassType = json[SerializationKeys.liveClassType].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    moduleName = json[SerializationKeys.moduleName].string
    commentCount = json[SerializationKeys.commentCount].string
    byUserDepartment = json[SerializationKeys.byUserDepartment].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = action { dictionary[SerializationKeys.action] = value }
    if let value = dateValue { dictionary[SerializationKeys.dateValue] = value }
    if let value = contentDurationFormated { dictionary[SerializationKeys.contentDurationFormated] = value }
    if let value = startDateFormatted { dictionary[SerializationKeys.startDateFormatted] = value }
    if let value = endDateFormatted { dictionary[SerializationKeys.endDateFormatted] = value }
    if let value = byUserPic { dictionary[SerializationKeys.byUserPic] = value }
    if let value = contentTypeId { dictionary[SerializationKeys.contentTypeId] = value }
    if let value = viewCount { dictionary[SerializationKeys.viewCount] = value }
    if let value = canView { dictionary[SerializationKeys.canView] = value }
    if let value = publishedByLabel { dictionary[SerializationKeys.publishedByLabel] = value }
    if let value = contentDuration { dictionary[SerializationKeys.contentDuration] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = allowEdit { dictionary[SerializationKeys.allowEdit] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = moduleId { dictionary[SerializationKeys.moduleId] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    if let value = byUserName { dictionary[SerializationKeys.byUserName] = value }
    if let value = publishedByValue { dictionary[SerializationKeys.publishedByValue] = value }
    if let value = dateLabel { dictionary[SerializationKeys.dateLabel] = value }
    if let value = byUserDesignation { dictionary[SerializationKeys.byUserDesignation] = value }
    if let value = likesCount { dictionary[SerializationKeys.likesCount] = value }
    if let value = selfLiked { dictionary[SerializationKeys.selfLiked] = value }
    if let value = allowView { dictionary[SerializationKeys.allowView] = value }
    if let value = liveClassType { dictionary[SerializationKeys.liveClassType] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = commentCount { dictionary[SerializationKeys.commentCount] = value }
    if let value = byUserDepartment { dictionary[SerializationKeys.byUserDepartment] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.action = aDecoder.decodeObject(forKey: SerializationKeys.action) as? String
    self.dateValue = aDecoder.decodeObject(forKey: SerializationKeys.dateValue) as? String
    self.contentDurationFormated = aDecoder.decodeObject(forKey: SerializationKeys.contentDurationFormated) as? String
    self.startDateFormatted = aDecoder.decodeObject(forKey: SerializationKeys.startDateFormatted) as? String
    self.endDateFormatted = aDecoder.decodeObject(forKey: SerializationKeys.endDateFormatted) as? String
    self.byUserPic = aDecoder.decodeObject(forKey: SerializationKeys.byUserPic) as? String
    self.contentTypeId = aDecoder.decodeObject(forKey: SerializationKeys.contentTypeId) as? String
    self.viewCount = aDecoder.decodeObject(forKey: SerializationKeys.viewCount) as? String
    self.canView = aDecoder.decodeObject(forKey: SerializationKeys.canView) as? Int
    self.publishedByLabel = aDecoder.decodeObject(forKey: SerializationKeys.publishedByLabel) as? String
    self.contentDuration = aDecoder.decodeObject(forKey: SerializationKeys.contentDuration) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.allowEdit = aDecoder.decodeObject(forKey: SerializationKeys.allowEdit) as? Int
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.moduleId = aDecoder.decodeObject(forKey: SerializationKeys.moduleId) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
    self.byUserName = aDecoder.decodeObject(forKey: SerializationKeys.byUserName) as? String
    self.publishedByValue = aDecoder.decodeObject(forKey: SerializationKeys.publishedByValue) as? String
    self.dateLabel = aDecoder.decodeObject(forKey: SerializationKeys.dateLabel) as? String
    self.byUserDesignation = aDecoder.decodeObject(forKey: SerializationKeys.byUserDesignation) as? String
    self.likesCount = aDecoder.decodeObject(forKey: SerializationKeys.likesCount) as? String
    self.selfLiked = aDecoder.decodeObject(forKey: SerializationKeys.selfLiked) as? Int
    self.allowView = aDecoder.decodeObject(forKey: SerializationKeys.allowView) as? Int
    self.liveClassType = aDecoder.decodeObject(forKey: SerializationKeys.liveClassType) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.commentCount = aDecoder.decodeObject(forKey: SerializationKeys.commentCount) as? String
    self.byUserDepartment = aDecoder.decodeObject(forKey: SerializationKeys.byUserDepartment) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(action, forKey: SerializationKeys.action)
    aCoder.encode(dateValue, forKey: SerializationKeys.dateValue)
    aCoder.encode(contentDurationFormated, forKey: SerializationKeys.contentDurationFormated)
    aCoder.encode(startDateFormatted, forKey: SerializationKeys.startDateFormatted)
    aCoder.encode(endDateFormatted, forKey: SerializationKeys.endDateFormatted)
    aCoder.encode(byUserPic, forKey: SerializationKeys.byUserPic)
    aCoder.encode(contentTypeId, forKey: SerializationKeys.contentTypeId)
    aCoder.encode(viewCount, forKey: SerializationKeys.viewCount)
    aCoder.encode(canView, forKey: SerializationKeys.canView)
    aCoder.encode(publishedByLabel, forKey: SerializationKeys.publishedByLabel)
    aCoder.encode(contentDuration, forKey: SerializationKeys.contentDuration)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(allowEdit, forKey: SerializationKeys.allowEdit)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(moduleId, forKey: SerializationKeys.moduleId)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
    aCoder.encode(byUserName, forKey: SerializationKeys.byUserName)
    aCoder.encode(publishedByValue, forKey: SerializationKeys.publishedByValue)
    aCoder.encode(dateLabel, forKey: SerializationKeys.dateLabel)
    aCoder.encode(byUserDesignation, forKey: SerializationKeys.byUserDesignation)
    aCoder.encode(likesCount, forKey: SerializationKeys.likesCount)
    aCoder.encode(selfLiked, forKey: SerializationKeys.selfLiked)
    aCoder.encode(allowView, forKey: SerializationKeys.allowView)
    aCoder.encode(liveClassType, forKey: SerializationKeys.liveClassType)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(commentCount, forKey: SerializationKeys.commentCount)
    aCoder.encode(byUserDepartment, forKey: SerializationKeys.byUserDepartment)
  }

}
