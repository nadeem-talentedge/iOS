//
//  RFReferralInfo.swift
//
//  Created by Vinod Kumar Sahu on 16/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class RFReferralInfo: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let content = "content"
    static let user = "user"
    static let referral = "referral"
  }

  // MARK: Properties
  public var content: RFContent?
  public var user: RFUser?
  public var referral: [RFReferral]?

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
    content = RFContent(json: json[SerializationKeys.content])
    user = RFUser(json: json[SerializationKeys.user])
    if let items = json[SerializationKeys.referral].array { referral = items.map { RFReferral(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = content { dictionary[SerializationKeys.content] = value.dictionaryRepresentation() }
    if let value = user { dictionary[SerializationKeys.user] = value.dictionaryRepresentation() }
    if let value = referral { dictionary[SerializationKeys.referral] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.content = aDecoder.decodeObject(forKey: SerializationKeys.content) as? RFContent
    self.user = aDecoder.decodeObject(forKey: SerializationKeys.user) as? RFUser
    self.referral = aDecoder.decodeObject(forKey: SerializationKeys.referral) as? [RFReferral]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(content, forKey: SerializationKeys.content)
    aCoder.encode(user, forKey: SerializationKeys.user)
    aCoder.encode(referral, forKey: SerializationKeys.referral)
  }

}
