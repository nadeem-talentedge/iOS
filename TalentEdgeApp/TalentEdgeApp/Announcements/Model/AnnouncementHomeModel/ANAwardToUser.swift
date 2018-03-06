//
//  ANAwardToUser.swift
//
//  Created by Vinod Kumar on 02/07/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ANAwardToUser: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let department = "department"
    static let pic = "pic"
    static let fname = "fname"
    static let lname = "lname"
    static let designation = "designation"
  }

  // MARK: Properties
  public var department: String?
  public var pic: String?
  public var fname: String?
  public var lname: String?
  public var designation: String?

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
    department = json[SerializationKeys.department].string
    pic = json[SerializationKeys.pic].string
    fname = json[SerializationKeys.fname].string
    lname = json[SerializationKeys.lname].string
    designation = json[SerializationKeys.designation].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = department { dictionary[SerializationKeys.department] = value }
    if let value = pic { dictionary[SerializationKeys.pic] = value }
    if let value = fname { dictionary[SerializationKeys.fname] = value }
    if let value = lname { dictionary[SerializationKeys.lname] = value }
    if let value = designation { dictionary[SerializationKeys.designation] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.department = aDecoder.decodeObject(forKey: SerializationKeys.department) as? String
    self.pic = aDecoder.decodeObject(forKey: SerializationKeys.pic) as? String
    self.fname = aDecoder.decodeObject(forKey: SerializationKeys.fname) as? String
    self.lname = aDecoder.decodeObject(forKey: SerializationKeys.lname) as? String
    self.designation = aDecoder.decodeObject(forKey: SerializationKeys.designation) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(department, forKey: SerializationKeys.department)
    aCoder.encode(pic, forKey: SerializationKeys.pic)
    aCoder.encode(fname, forKey: SerializationKeys.fname)
    aCoder.encode(lname, forKey: SerializationKeys.lname)
    aCoder.encode(designation, forKey: SerializationKeys.designation)
  }

}
