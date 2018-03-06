//
//  Reply.swift
//
//  Created by Vinod Kumar on 11/07/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Reply: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let selfLiked = "self_liked"
    static let created = "created"
    static let comment = "comment"
    static let userName = "user_name"
    static let userId = "user_id"
    static let assetId = "asset_id"
    static let userPic = "user_pic"
  }

  // MARK: Properties
  public var id: String?
  public var selfLiked: Int?
  public var created: String?
  public var comment: String?
  public var userName: String?
  public var userId: String?
  public var assetId: String?
  public var userPic: String?

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
    id = json[SerializationKeys.id].string
    selfLiked = json[SerializationKeys.selfLiked].int
    created = json[SerializationKeys.created].string
    comment = json[SerializationKeys.comment].string
    userName = json[SerializationKeys.userName].string
    userId = json[SerializationKeys.userId].string
    assetId = json[SerializationKeys.assetId].string
    userPic = json[SerializationKeys.userPic].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = selfLiked { dictionary[SerializationKeys.selfLiked] = value }
    if let value = created { dictionary[SerializationKeys.created] = value }
    if let value = comment { dictionary[SerializationKeys.comment] = value }
    if let value = userName { dictionary[SerializationKeys.userName] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = assetId { dictionary[SerializationKeys.assetId] = value }
    if let value = userPic { dictionary[SerializationKeys.userPic] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.selfLiked = aDecoder.decodeObject(forKey: SerializationKeys.selfLiked) as? Int
    self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? String
    self.comment = aDecoder.decodeObject(forKey: SerializationKeys.comment) as? String
    self.userName = aDecoder.decodeObject(forKey: SerializationKeys.userName) as? String
    self.userId = aDecoder.decodeObject(forKey: SerializationKeys.userId) as? String
    self.assetId = aDecoder.decodeObject(forKey: SerializationKeys.assetId) as? String
    self.userPic = aDecoder.decodeObject(forKey: SerializationKeys.userPic) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(selfLiked, forKey: SerializationKeys.selfLiked)
    aCoder.encode(created, forKey: SerializationKeys.created)
    aCoder.encode(comment, forKey: SerializationKeys.comment)
    aCoder.encode(userName, forKey: SerializationKeys.userName)
    aCoder.encode(userId, forKey: SerializationKeys.userId)
    aCoder.encode(assetId, forKey: SerializationKeys.assetId)
    aCoder.encode(userPic, forKey: SerializationKeys.userPic)
  }

}
