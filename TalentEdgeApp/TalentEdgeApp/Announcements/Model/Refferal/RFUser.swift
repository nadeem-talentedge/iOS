//
//  RFUser.swift
//
//  Created by Vinod Kumar Sahu on 16/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class RFUser: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let pic = "pic"
    static let fname = "fname"
    static let lname = "lname"
    static let uid = "uid"
  }

  // MARK: Properties
  public var pic: String?
  public var fname: String?
  public var lname: String?
  public var uid: String?

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
    pic = json[SerializationKeys.pic].string
    fname = json[SerializationKeys.fname].string
    lname = json[SerializationKeys.lname].string
    uid = json[SerializationKeys.uid].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = pic { dictionary[SerializationKeys.pic] = value }
    if let value = fname { dictionary[SerializationKeys.fname] = value }
    if let value = lname { dictionary[SerializationKeys.lname] = value }
    if let value = uid { dictionary[SerializationKeys.uid] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.pic = aDecoder.decodeObject(forKey: SerializationKeys.pic) as? String
    self.fname = aDecoder.decodeObject(forKey: SerializationKeys.fname) as? String
    self.lname = aDecoder.decodeObject(forKey: SerializationKeys.lname) as? String
    self.uid = aDecoder.decodeObject(forKey: SerializationKeys.uid) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(pic, forKey: SerializationKeys.pic)
    aCoder.encode(fname, forKey: SerializationKeys.fname)
    aCoder.encode(lname, forKey: SerializationKeys.lname)
    aCoder.encode(uid, forKey: SerializationKeys.uid)
  }

}
