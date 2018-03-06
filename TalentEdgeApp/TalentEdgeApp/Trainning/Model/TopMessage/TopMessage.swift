//
//  TopMessage.swift
//
//  Created by Vinod Kumar Sahu on 24/11/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TopMessage: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let attach = "attach"
    static let subject = "subject"
    static let id = "id"
    static let fromId = "from_id"
    static let created = "created"
    static let isRead = "is_read"
    static let isDoubt = "is_doubt"
    static let fromName = "from_name"
    static let message = "message"
    static let batchId = "batch_id"
    static let fromUserPic = "from_user_pic"
    static let toId = "to_id"
    static let toName = "to_name"
    static let toUserPic = "to_user_pic"
  }

  // MARK: Properties
  public var attach: [String]?
  public var subject: String?
  public var id: String?
  public var fromId: String?
  public var created: String?
  public var isRead: Bool? = false
  public var isDoubt: Bool? = false
  public var fromName: String?
  public var message: String?
  public var batchId: String?
  public var fromUserPic: String?
  public var toId: String?
  public var toName: String?
  public var toUserPic: String?

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
    if let items = json[SerializationKeys.attach].array { attach = items.map { $0.stringValue } }
    subject = json[SerializationKeys.subject].string
    id = json[SerializationKeys.id].string
    fromId = json[SerializationKeys.fromId].string
    created = json[SerializationKeys.created].string
    isRead = json[SerializationKeys.isRead].boolValue
    isDoubt = json[SerializationKeys.isDoubt].boolValue
    fromName = json[SerializationKeys.fromName].string
    message = json[SerializationKeys.message].string
    batchId = json[SerializationKeys.batchId].string
    fromUserPic = json[SerializationKeys.fromUserPic].string
    toId = json[SerializationKeys.toId].string
    toUserPic = json[SerializationKeys.toUserPic].string
    toName = json[SerializationKeys.toName].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = attach { dictionary[SerializationKeys.attach] = value }
    if let value = subject { dictionary[SerializationKeys.subject] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = fromId { dictionary[SerializationKeys.fromId] = value }
    if let value = created { dictionary[SerializationKeys.created] = value }
    dictionary[SerializationKeys.isRead] = isRead
    dictionary[SerializationKeys.isDoubt] = isDoubt
    if let value = fromName { dictionary[SerializationKeys.fromName] = value }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = batchId { dictionary[SerializationKeys.batchId] = value }
    if let value = fromUserPic { dictionary[SerializationKeys.fromUserPic] = value }
    if let value = toId { dictionary[SerializationKeys.toId] = value }
    if let value = toUserPic { dictionary[SerializationKeys.toUserPic] = value }
    if let value = toName { dictionary[SerializationKeys.toName] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.attach = aDecoder.decodeObject(forKey: SerializationKeys.attach) as? [String]
    self.subject = aDecoder.decodeObject(forKey: SerializationKeys.subject) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.fromId = aDecoder.decodeObject(forKey: SerializationKeys.fromId) as? String
    self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? String
    self.isRead = aDecoder.decodeBool(forKey: SerializationKeys.isRead)
    self.isDoubt = aDecoder.decodeBool(forKey: SerializationKeys.isDoubt)
    self.fromName = aDecoder.decodeObject(forKey: SerializationKeys.fromName) as? String
    self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
    self.batchId = aDecoder.decodeObject(forKey: SerializationKeys.batchId) as? String
    self.fromUserPic = aDecoder.decodeObject(forKey: SerializationKeys.fromUserPic) as? String
    self.toId = aDecoder.decodeObject(forKey: SerializationKeys.toId) as? String
    self.toUserPic = aDecoder.decodeObject(forKey: SerializationKeys.toUserPic) as? String
    self.toName = aDecoder.decodeObject(forKey: SerializationKeys.toName) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(attach, forKey: SerializationKeys.attach)
    aCoder.encode(subject, forKey: SerializationKeys.subject)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(fromId, forKey: SerializationKeys.fromId)
    aCoder.encode(created, forKey: SerializationKeys.created)
    aCoder.encode(isRead, forKey: SerializationKeys.isRead)
    aCoder.encode(isDoubt, forKey: SerializationKeys.isDoubt)
    aCoder.encode(fromName, forKey: SerializationKeys.fromName)
    aCoder.encode(message, forKey: SerializationKeys.message)
    aCoder.encode(batchId, forKey: SerializationKeys.batchId)
    aCoder.encode(fromUserPic, forKey: SerializationKeys.fromUserPic)
    aCoder.encode(toId, forKey: SerializationKeys.toId)
    aCoder.encode(toUserPic, forKey: SerializationKeys.toUserPic)
    aCoder.encode(toName, forKey: SerializationKeys.toName)
  }

}
