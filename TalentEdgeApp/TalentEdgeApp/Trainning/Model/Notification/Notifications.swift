//
//  Notifications.swift
//
//  Created by Vinod Kumar on 27/07/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Notifications: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let dateCreated = "date_created"
    static let id = "id"
    static let webMessage = "web_message"
    static let isRead = "is_read"
  }

  // MARK: Properties
  public var dateCreated: String?
  public var id: String?
  public var webMessage: String?
  public var isRead: String?
  public var numberOfLine = 2

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
    dateCreated = json[SerializationKeys.dateCreated].string
    id = json[SerializationKeys.id].string
    webMessage = json[SerializationKeys.webMessage].string
    isRead = json[SerializationKeys.isRead].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = dateCreated { dictionary[SerializationKeys.dateCreated] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = webMessage { dictionary[SerializationKeys.webMessage] = value }
    if let value = isRead { dictionary[SerializationKeys.isRead] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.dateCreated = aDecoder.decodeObject(forKey: SerializationKeys.dateCreated) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.webMessage = aDecoder.decodeObject(forKey: SerializationKeys.webMessage) as? String
    self.isRead = aDecoder.decodeObject(forKey: SerializationKeys.isRead) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(dateCreated, forKey: SerializationKeys.dateCreated)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(webMessage, forKey: SerializationKeys.webMessage)
    aCoder.encode(isRead, forKey: SerializationKeys.isRead)
  }

}
