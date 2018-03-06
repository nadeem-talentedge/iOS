//
//  ContactsModel.swift
//
//  Created by Vinod Kumar on 27/08/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ContactsModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let contact = "resultData"
    static let status = "status"
    static let message = "message"
    static let code = "code"
  }

  // MARK: Properties
  public var contact: [Contact]?
  public var status: Int?
  public var message: String?
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
    if let items = json[SerializationKeys.contact].array { contact = items.map { Contact(json: $0) } }
    status = json[SerializationKeys.status].int
    message = json[SerializationKeys.message].string
    code = json[SerializationKeys.code].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = contact { dictionary[SerializationKeys.contact] = value.map { $0.dictionaryRepresentation() } }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = code { dictionary[SerializationKeys.code] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.contact = aDecoder.decodeObject(forKey: SerializationKeys.contact) as? [Contact]
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
    self.code = aDecoder.decodeObject(forKey: SerializationKeys.code) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(contact, forKey: SerializationKeys.contact)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(message, forKey: SerializationKeys.message)
    aCoder.encode(code, forKey: SerializationKeys.code)
  }

}
