//
//  ContentListDiscussion.swift
//
//  Created by Temp  on 31/05/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ContentListDiscussion: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let action = "action"
    static let isDraft = "is_draft"
    static let likesCount = "likes_count"
    static let allowView = "allow_view"
    static let descriptionValue = "description"
    static let endDateValue = "end_date_value"
    static let commentsCount = "comments_count"
    static let endDateLabel = "end_date_label"
    static let contentTypeId = "content_type_id"
    static let startDateLabel = "start_date_label"
    static let startDateValue = "start_date_value"
    static let publishedByLabel = "published_by_label"
    static let moduleName = "module_name"
    static let id = "id"
    static let allowReply = "allow_reply"
    static let viewCount = "view_count"
    static let allowDelete = "allow_delete"
    static let userRole = "user_role"
    static let allowEdit = "allow_edit"
    static let title = "title"
    static let moduleId = "module_id"
    static let publishedByValue = "published_by_value"
  }

  // MARK: Properties
  public var action: String?
  public var isDraft: Int?
  public var likesCount: String?
  public var allowView: Int?
  public var descriptionValue: String?
  public var endDateValue: String?
  public var commentsCount: String?
  public var endDateLabel: String?
  public var contentTypeId: Int?
  public var startDateLabel: String?
  public var startDateValue: String?
  public var publishedByLabel: String?
  public var moduleName: String?
  public var id: String?
  public var allowReply: Int?
  public var viewCount: String?
  public var allowDelete: Int?
  public var userRole: String?
  public var allowEdit: Int?
  public var title: String?
  public var moduleId: String?
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
    allowView = json[SerializationKeys.allowView].int
    descriptionValue = json[SerializationKeys.descriptionValue].string
    endDateValue = json[SerializationKeys.endDateValue].string
    commentsCount = json[SerializationKeys.commentsCount].string
    endDateLabel = json[SerializationKeys.endDateLabel].string
    contentTypeId = json[SerializationKeys.contentTypeId].int
    startDateLabel = json[SerializationKeys.startDateLabel].string
    startDateValue = json[SerializationKeys.startDateValue].string
    publishedByLabel = json[SerializationKeys.publishedByLabel].string
    moduleName = json[SerializationKeys.moduleName].string
    id = json[SerializationKeys.id].string
    allowReply = json[SerializationKeys.allowReply].int
    viewCount = json[SerializationKeys.viewCount].string
    allowDelete = json[SerializationKeys.allowDelete].int
    userRole = json[SerializationKeys.userRole].string
    allowEdit = json[SerializationKeys.allowEdit].int
    title = json[SerializationKeys.title].string
    moduleId = json[SerializationKeys.moduleId].string
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
    if let value = allowView { dictionary[SerializationKeys.allowView] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = endDateValue { dictionary[SerializationKeys.endDateValue] = value }
    if let value = commentsCount { dictionary[SerializationKeys.commentsCount] = value }
    if let value = endDateLabel { dictionary[SerializationKeys.endDateLabel] = value }
    if let value = contentTypeId { dictionary[SerializationKeys.contentTypeId] = value }
    if let value = startDateLabel { dictionary[SerializationKeys.startDateLabel] = value }
    if let value = startDateValue { dictionary[SerializationKeys.startDateValue] = value }
    if let value = publishedByLabel { dictionary[SerializationKeys.publishedByLabel] = value }
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = allowReply { dictionary[SerializationKeys.allowReply] = value }
    if let value = viewCount { dictionary[SerializationKeys.viewCount] = value }
    if let value = allowDelete { dictionary[SerializationKeys.allowDelete] = value }
    if let value = userRole { dictionary[SerializationKeys.userRole] = value }
    if let value = allowEdit { dictionary[SerializationKeys.allowEdit] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = moduleId { dictionary[SerializationKeys.moduleId] = value }
    if let value = publishedByValue { dictionary[SerializationKeys.publishedByValue] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.action = aDecoder.decodeObject(forKey: SerializationKeys.action) as? String
    self.isDraft = aDecoder.decodeObject(forKey: SerializationKeys.isDraft) as? Int
    self.likesCount = aDecoder.decodeObject(forKey: SerializationKeys.likesCount) as? String
    self.allowView = aDecoder.decodeObject(forKey: SerializationKeys.allowView) as? Int
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.endDateValue = aDecoder.decodeObject(forKey: SerializationKeys.endDateValue) as? String
    self.commentsCount = aDecoder.decodeObject(forKey: SerializationKeys.commentsCount) as? String
    self.endDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.endDateLabel) as? String
    self.contentTypeId = aDecoder.decodeObject(forKey: SerializationKeys.contentTypeId) as? Int
    self.startDateLabel = aDecoder.decodeObject(forKey: SerializationKeys.startDateLabel) as? String
    self.startDateValue = aDecoder.decodeObject(forKey: SerializationKeys.startDateValue) as? String
    self.publishedByLabel = aDecoder.decodeObject(forKey: SerializationKeys.publishedByLabel) as? String
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.allowReply = aDecoder.decodeObject(forKey: SerializationKeys.allowReply) as? Int
    self.viewCount = aDecoder.decodeObject(forKey: SerializationKeys.viewCount) as? String
    self.allowDelete = aDecoder.decodeObject(forKey: SerializationKeys.allowDelete) as? Int
    self.userRole = aDecoder.decodeObject(forKey: SerializationKeys.userRole) as? String
    self.allowEdit = aDecoder.decodeObject(forKey: SerializationKeys.allowEdit) as? Int
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.moduleId = aDecoder.decodeObject(forKey: SerializationKeys.moduleId) as? String
    self.publishedByValue = aDecoder.decodeObject(forKey: SerializationKeys.publishedByValue) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(action, forKey: SerializationKeys.action)
    aCoder.encode(isDraft, forKey: SerializationKeys.isDraft)
    aCoder.encode(likesCount, forKey: SerializationKeys.likesCount)
    aCoder.encode(allowView, forKey: SerializationKeys.allowView)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(endDateValue, forKey: SerializationKeys.endDateValue)
    aCoder.encode(commentsCount, forKey: SerializationKeys.commentsCount)
    aCoder.encode(endDateLabel, forKey: SerializationKeys.endDateLabel)
    aCoder.encode(contentTypeId, forKey: SerializationKeys.contentTypeId)
    aCoder.encode(startDateLabel, forKey: SerializationKeys.startDateLabel)
    aCoder.encode(startDateValue, forKey: SerializationKeys.startDateValue)
    aCoder.encode(publishedByLabel, forKey: SerializationKeys.publishedByLabel)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(allowReply, forKey: SerializationKeys.allowReply)
    aCoder.encode(viewCount, forKey: SerializationKeys.viewCount)
    aCoder.encode(allowDelete, forKey: SerializationKeys.allowDelete)
    aCoder.encode(userRole, forKey: SerializationKeys.userRole)
    aCoder.encode(allowEdit, forKey: SerializationKeys.allowEdit)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(moduleId, forKey: SerializationKeys.moduleId)
    aCoder.encode(publishedByValue, forKey: SerializationKeys.publishedByValue)
  }

}
