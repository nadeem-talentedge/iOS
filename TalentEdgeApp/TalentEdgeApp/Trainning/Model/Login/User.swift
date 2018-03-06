//
//  User.swift
//
//  Created by Vinod Kumar on 18/09/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class User: NSObject,NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let mobileNo = "mobile_no"
    static let email = "email"
    static let avtarUrl = "avtar_url"
    static let userId = "userId"
    static let referralCode = "referral_code"
    static let lName = "lName"
    static let username = "username"
    static let fName = "fName"
    static let userRole = "user_role"
  }

  // MARK: Properties
  public var mobileNo: String?
  public var email: String?
  public var avtarUrl: String?
  public var userId: String?
  public var referralCode: String?
  public var lName: String?
  public var username: String?
  public var fName: String?
  public var userRole: String?

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
    mobileNo = json[SerializationKeys.mobileNo].string
    email = json[SerializationKeys.email].string
    avtarUrl = json[SerializationKeys.avtarUrl].string
    userId = json[SerializationKeys.userId].string
    referralCode = json[SerializationKeys.referralCode].string
    lName = json[SerializationKeys.lName].string
    username = json[SerializationKeys.username].string
    fName = json[SerializationKeys.fName].string
    userRole = json[SerializationKeys.userRole].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = mobileNo { dictionary[SerializationKeys.mobileNo] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = avtarUrl { dictionary[SerializationKeys.avtarUrl] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = referralCode { dictionary[SerializationKeys.referralCode] = value }
    if let value = lName { dictionary[SerializationKeys.lName] = value }
    if let value = username { dictionary[SerializationKeys.username] = value }
    if let value = fName { dictionary[SerializationKeys.fName] = value }
    if let value = userRole { dictionary[SerializationKeys.userRole] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.mobileNo = aDecoder.decodeObject(forKey: SerializationKeys.mobileNo) as? String
    self.email = aDecoder.decodeObject(forKey: SerializationKeys.email) as? String
    self.avtarUrl = aDecoder.decodeObject(forKey: SerializationKeys.avtarUrl) as? String
    self.userId = aDecoder.decodeObject(forKey: SerializationKeys.userId) as? String
    self.referralCode = aDecoder.decodeObject(forKey: SerializationKeys.referralCode) as? String
    self.lName = aDecoder.decodeObject(forKey: SerializationKeys.lName) as? String
    self.username = aDecoder.decodeObject(forKey: SerializationKeys.username) as? String
    self.fName = aDecoder.decodeObject(forKey: SerializationKeys.fName) as? String
    self.userRole = aDecoder.decodeObject(forKey: SerializationKeys.userRole) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(mobileNo, forKey: SerializationKeys.mobileNo)
    aCoder.encode(email, forKey: SerializationKeys.email)
    aCoder.encode(avtarUrl, forKey: SerializationKeys.avtarUrl)
    aCoder.encode(userId, forKey: SerializationKeys.userId)
    aCoder.encode(referralCode, forKey: SerializationKeys.referralCode)
    aCoder.encode(lName, forKey: SerializationKeys.lName)
    aCoder.encode(username, forKey: SerializationKeys.username)
    aCoder.encode(fName, forKey: SerializationKeys.fName)
    aCoder.encode(userRole, forKey: SerializationKeys.userRole)
  }

}
