//
//  CourseFaculty.swift
//
//  Created by Vinod Kumar Sahu on 19/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CourseFaculty: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let fname = "fname"
    static let lname = "lname"
  }

  // MARK: Properties
  public var id: Int?
  public var fname: String?
  public var lname: String?

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
    id = json[SerializationKeys.id].int
    fname = json[SerializationKeys.fname].string
    lname = json[SerializationKeys.lname].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = fname { dictionary[SerializationKeys.fname] = value }
    if let value = lname { dictionary[SerializationKeys.lname] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.fname = aDecoder.decodeObject(forKey: SerializationKeys.fname) as? String
    self.lname = aDecoder.decodeObject(forKey: SerializationKeys.lname) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(fname, forKey: SerializationKeys.fname)
    aCoder.encode(lname, forKey: SerializationKeys.lname)
  }

}
