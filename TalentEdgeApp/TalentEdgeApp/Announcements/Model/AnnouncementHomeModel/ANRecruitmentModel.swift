//
//  ANRecruitmentModel.swift
//
//  Created by Vinod Kumar Sahu on 29/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ANRecruitmentModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let recruitmentStatus = "recruitment_status"
    static let rewardType = "reward_type"
    static let selfLiked = "self_liked"
    static let byUserDesignation = "by_user_designation"
    static let likesCount = "likes_count"
    static let byUserPic = "by_user_pic"
    static let descriptionValue = "description"
    static let refType = "ref_type"
    static let contentTypeId = "content_type_id"
    static let rewardAmount = "reward_amount"
    static let viewCount = "view_count"
    static let id = "id"
    static let commentCount = "comment_count"
    static let created = "created"
    static let contentPath = "content_path"
    static let byUserDepartment = "by_user_department"
    static let title = "title"
    static let moduleId = "module_id"
    static let startDate = "start_date"
    static let byUserName = "by_user_name"
  }

  // MARK: Properties
  public var recruitmentStatus: String?
  public var rewardType: String?
  public var selfLiked: Int?
  public var byUserDesignation: String?
  public var likesCount: String?
  public var byUserPic: String?
  public var descriptionValue: String?
  public var refType: String?
  public var contentTypeId: String?
  public var rewardAmount: String?
  public var viewCount: String?
  public var id: String?
  public var commentCount: String?
  public var created: String?
  public var contentPath: String?
  public var byUserDepartment: String?
  public var title: String?
  public var moduleId: String?
  public var startDate: String?
  public var byUserName: String?

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
    recruitmentStatus = json[SerializationKeys.recruitmentStatus].string
    rewardType = json[SerializationKeys.rewardType].string
    selfLiked = json[SerializationKeys.selfLiked].int
    byUserDesignation = json[SerializationKeys.byUserDesignation].string
    likesCount = json[SerializationKeys.likesCount].string
    byUserPic = json[SerializationKeys.byUserPic].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    refType = json[SerializationKeys.refType].string
    contentTypeId = json[SerializationKeys.contentTypeId].string
    rewardAmount = json[SerializationKeys.rewardAmount].string
    viewCount = json[SerializationKeys.viewCount].string
    id = json[SerializationKeys.id].string
    commentCount = json[SerializationKeys.commentCount].string
    created = json[SerializationKeys.created].string
    contentPath = json[SerializationKeys.contentPath].string
    byUserDepartment = json[SerializationKeys.byUserDepartment].string
    title = json[SerializationKeys.title].string
    moduleId = json[SerializationKeys.moduleId].string
    startDate = json[SerializationKeys.startDate].string
    byUserName = json[SerializationKeys.byUserName].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = recruitmentStatus { dictionary[SerializationKeys.recruitmentStatus] = value }
    if let value = rewardType { dictionary[SerializationKeys.rewardType] = value }
    if let value = selfLiked { dictionary[SerializationKeys.selfLiked] = value }
    if let value = byUserDesignation { dictionary[SerializationKeys.byUserDesignation] = value }
    if let value = likesCount { dictionary[SerializationKeys.likesCount] = value }
    if let value = byUserPic { dictionary[SerializationKeys.byUserPic] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = refType { dictionary[SerializationKeys.refType] = value }
    if let value = contentTypeId { dictionary[SerializationKeys.contentTypeId] = value }
    if let value = rewardAmount { dictionary[SerializationKeys.rewardAmount] = value }
    if let value = viewCount { dictionary[SerializationKeys.viewCount] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = commentCount { dictionary[SerializationKeys.commentCount] = value }
    if let value = created { dictionary[SerializationKeys.created] = value }
    if let value = contentPath { dictionary[SerializationKeys.contentPath] = value }
    if let value = byUserDepartment { dictionary[SerializationKeys.byUserDepartment] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = moduleId { dictionary[SerializationKeys.moduleId] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = byUserName { dictionary[SerializationKeys.byUserName] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.recruitmentStatus = aDecoder.decodeObject(forKey: SerializationKeys.recruitmentStatus) as? String
    self.rewardType = aDecoder.decodeObject(forKey: SerializationKeys.rewardType) as? String
    self.selfLiked = aDecoder.decodeObject(forKey: SerializationKeys.selfLiked) as? Int
    self.byUserDesignation = aDecoder.decodeObject(forKey: SerializationKeys.byUserDesignation) as? String
    self.likesCount = aDecoder.decodeObject(forKey: SerializationKeys.likesCount) as? String
    self.byUserPic = aDecoder.decodeObject(forKey: SerializationKeys.byUserPic) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.refType = aDecoder.decodeObject(forKey: SerializationKeys.refType) as? String
    self.contentTypeId = aDecoder.decodeObject(forKey: SerializationKeys.contentTypeId) as? String
    self.rewardAmount = aDecoder.decodeObject(forKey: SerializationKeys.rewardAmount) as? String
    self.viewCount = aDecoder.decodeObject(forKey: SerializationKeys.viewCount) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.commentCount = aDecoder.decodeObject(forKey: SerializationKeys.commentCount) as? String
    self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? String
    self.contentPath = aDecoder.decodeObject(forKey: SerializationKeys.contentPath) as? String
    self.byUserDepartment = aDecoder.decodeObject(forKey: SerializationKeys.byUserDepartment) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.moduleId = aDecoder.decodeObject(forKey: SerializationKeys.moduleId) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.byUserName = aDecoder.decodeObject(forKey: SerializationKeys.byUserName) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(recruitmentStatus, forKey: SerializationKeys.recruitmentStatus)
    aCoder.encode(rewardType, forKey: SerializationKeys.rewardType)
    aCoder.encode(selfLiked, forKey: SerializationKeys.selfLiked)
    aCoder.encode(byUserDesignation, forKey: SerializationKeys.byUserDesignation)
    aCoder.encode(likesCount, forKey: SerializationKeys.likesCount)
    aCoder.encode(byUserPic, forKey: SerializationKeys.byUserPic)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(refType, forKey: SerializationKeys.refType)
    aCoder.encode(contentTypeId, forKey: SerializationKeys.contentTypeId)
    aCoder.encode(rewardAmount, forKey: SerializationKeys.rewardAmount)
    aCoder.encode(viewCount, forKey: SerializationKeys.viewCount)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(commentCount, forKey: SerializationKeys.commentCount)
    aCoder.encode(created, forKey: SerializationKeys.created)
    aCoder.encode(contentPath, forKey: SerializationKeys.contentPath)
    aCoder.encode(byUserDepartment, forKey: SerializationKeys.byUserDepartment)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(moduleId, forKey: SerializationKeys.moduleId)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(byUserName, forKey: SerializationKeys.byUserName)
  }

}
