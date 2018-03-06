//
//  Counsellor.swift
//
//  Created by Vinod Kumar Sahu on 25/11/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Counsellor:NSObject,NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let cityId = "city_id"
    static let mobileNo = "mobile_no"
    static let lastLogin = "last_login"
    static let email = "email"
    static let id = "id"
    static let name = "name"
    static let dob = "dob"
    static let countryId = "country_id"
    static let pic = "pic"
    static let batchId = "batch_id"
    static let qualification = "qualification"
  }

  // MARK: Properties
  public var cityId: String?
  public var mobileNo: String?
  public var lastLogin: String?
  public var email: String?
  public var id: String?
  public var name: String?
  public var dob: String?
  public var countryId: String?
  public var pic: String?
  public var batchId: Int?
  public var qualification: String?

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
    cityId = json[SerializationKeys.cityId].string
    mobileNo = json[SerializationKeys.mobileNo].string
    lastLogin = json[SerializationKeys.lastLogin].string
    email = json[SerializationKeys.email].string
    id = json[SerializationKeys.id].string
    name = json[SerializationKeys.name].string
    dob = json[SerializationKeys.dob].string
    countryId = json[SerializationKeys.countryId].string
    pic = json[SerializationKeys.pic].string
    batchId = json[SerializationKeys.batchId].int
    qualification = json[SerializationKeys.qualification].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = cityId { dictionary[SerializationKeys.cityId] = value }
    if let value = mobileNo { dictionary[SerializationKeys.mobileNo] = value }
    if let value = lastLogin { dictionary[SerializationKeys.lastLogin] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = dob { dictionary[SerializationKeys.dob] = value }
    if let value = countryId { dictionary[SerializationKeys.countryId] = value }
    if let value = pic { dictionary[SerializationKeys.pic] = value }
    if let value = batchId { dictionary[SerializationKeys.batchId] = value }
    if let value = qualification { dictionary[SerializationKeys.qualification] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.cityId = aDecoder.decodeObject(forKey: SerializationKeys.cityId) as? String
    self.mobileNo = aDecoder.decodeObject(forKey: SerializationKeys.mobileNo) as? String
    self.lastLogin = aDecoder.decodeObject(forKey: SerializationKeys.lastLogin) as? String
    self.email = aDecoder.decodeObject(forKey: SerializationKeys.email) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.dob = aDecoder.decodeObject(forKey: SerializationKeys.dob) as? String
    self.countryId = aDecoder.decodeObject(forKey: SerializationKeys.countryId) as? String
    self.pic = aDecoder.decodeObject(forKey: SerializationKeys.pic) as? String
    self.batchId = aDecoder.decodeObject(forKey: SerializationKeys.batchId) as? Int
    self.qualification = aDecoder.decodeObject(forKey: SerializationKeys.qualification) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(cityId, forKey: SerializationKeys.cityId)
    aCoder.encode(mobileNo, forKey: SerializationKeys.mobileNo)
    aCoder.encode(lastLogin, forKey: SerializationKeys.lastLogin)
    aCoder.encode(email, forKey: SerializationKeys.email)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(dob, forKey: SerializationKeys.dob)
    aCoder.encode(countryId, forKey: SerializationKeys.countryId)
    aCoder.encode(pic, forKey: SerializationKeys.pic)
    aCoder.encode(batchId, forKey: SerializationKeys.batchId)
    aCoder.encode(qualification, forKey: SerializationKeys.qualification)
  }

}
