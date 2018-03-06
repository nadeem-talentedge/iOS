//
//  Contact.swift
//
//  Created by Vinod Kumar on 27/08/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Contact: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let mobileNo = "mobile_no"
    static let lastName = "last_name"
    static let email = "email"
    static let id = "id"
    static let department = "department"
    static let firstName = "first_name"
    static let pic = "pic"
    static let designation = "designation"
    static let qualification = "qualification"
  }

  // MARK: Properties
  public var mobileNo: String?
  public var lastName: String?
  public var email: String?
  public var id: String?
  public var department: String?
  public var firstName: String?
  public var pic: String?
  public var designation: String?
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
    mobileNo = json[SerializationKeys.mobileNo].string
    lastName = json[SerializationKeys.lastName].string
    email = json[SerializationKeys.email].string
    id = json[SerializationKeys.id].string
    department = json[SerializationKeys.department].string
    firstName = json[SerializationKeys.firstName].string
    pic = json[SerializationKeys.pic].string
    designation = json[SerializationKeys.designation].string
    qualification = json[SerializationKeys.qualification].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = mobileNo { dictionary[SerializationKeys.mobileNo] = value }
    if let value = lastName { dictionary[SerializationKeys.lastName] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = department { dictionary[SerializationKeys.department] = value }
    if let value = firstName { dictionary[SerializationKeys.firstName] = value }
    if let value = pic { dictionary[SerializationKeys.pic] = value }
    if let value = designation { dictionary[SerializationKeys.designation] = value }
    if let value = qualification { dictionary[SerializationKeys.qualification] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.mobileNo = aDecoder.decodeObject(forKey: SerializationKeys.mobileNo) as? String
    self.lastName = aDecoder.decodeObject(forKey: SerializationKeys.lastName) as? String
    self.email = aDecoder.decodeObject(forKey: SerializationKeys.email) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.department = aDecoder.decodeObject(forKey: SerializationKeys.department) as? String
    self.firstName = aDecoder.decodeObject(forKey: SerializationKeys.firstName) as? String
    self.pic = aDecoder.decodeObject(forKey: SerializationKeys.pic) as? String
    self.designation = aDecoder.decodeObject(forKey: SerializationKeys.designation) as? String
    self.qualification = aDecoder.decodeObject(forKey: SerializationKeys.qualification) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(mobileNo, forKey: SerializationKeys.mobileNo)
    aCoder.encode(lastName, forKey: SerializationKeys.lastName)
    aCoder.encode(email, forKey: SerializationKeys.email)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(department, forKey: SerializationKeys.department)
    aCoder.encode(firstName, forKey: SerializationKeys.firstName)
    aCoder.encode(pic, forKey: SerializationKeys.pic)
    aCoder.encode(designation, forKey: SerializationKeys.designation)
    aCoder.encode(qualification, forKey: SerializationKeys.qualification)
  }

}
