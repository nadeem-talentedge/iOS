//
//  TENotificationModel.swift
//
//  Created by Vinod Kumar on 27/07/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TENotificationModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let total = "total"
    static let status = "status"
    static let notifications = "resultData"
    static let message = "message"
    static let unread = "unread"
    static let code = "code"
  }

  // MARK: Properties
  public var total: Int?
  public var status: Int?
  public var notifications: [Notifications]?
  public var message: String?
  public var unread: Int?
  public var code: Int?

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
    total = json[SerializationKeys.total].int
    status = json[SerializationKeys.status].int
    if let items = json[SerializationKeys.notifications].array { notifications = items.map { Notifications(json: $0) } }
    message = json[SerializationKeys.message].string
    unread = json[SerializationKeys.unread].int
    code = json[SerializationKeys.code].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = notifications { dictionary[SerializationKeys.notifications] = value.map { $0.dictionaryRepresentation() } }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = unread { dictionary[SerializationKeys.unread] = value }
    if let value = code { dictionary[SerializationKeys.code] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.total = aDecoder.decodeObject(forKey: SerializationKeys.total) as? Int
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.notifications = aDecoder.decodeObject(forKey: SerializationKeys.notifications) as? [Notifications]
    self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
    self.unread = aDecoder.decodeObject(forKey: SerializationKeys.unread) as? Int
    self.code = aDecoder.decodeObject(forKey: SerializationKeys.code) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(total, forKey: SerializationKeys.total)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(notifications, forKey: SerializationKeys.notifications)
    aCoder.encode(message, forKey: SerializationKeys.message)
    aCoder.encode(unread, forKey: SerializationKeys.unread)
    aCoder.encode(code, forKey: SerializationKeys.code)
  }

}
