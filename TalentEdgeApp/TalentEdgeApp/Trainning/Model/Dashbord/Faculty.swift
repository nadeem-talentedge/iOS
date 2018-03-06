//
//  Faculty.swift
//
//  Created by Vinod Kumar on 05/07/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Faculty: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let fname = "fname"
    static let id = "id"
    static let lname = "lname"
    static let qualification = "qualification"
  }

  // MARK: Properties
  public var fname: String?
  public var id: String?
  public var lname: String?
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
    fname = json[SerializationKeys.fname].string
    id = json[SerializationKeys.id].string
    lname = json[SerializationKeys.lname].string
    qualification = json[SerializationKeys.qualification].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = fname { dictionary[SerializationKeys.fname] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = lname { dictionary[SerializationKeys.lname] = value }
    if let value = qualification { dictionary[SerializationKeys.qualification] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.fname = aDecoder.decodeObject(forKey: SerializationKeys.fname) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.lname = aDecoder.decodeObject(forKey: SerializationKeys.lname) as? String
    self.qualification = aDecoder.decodeObject(forKey: SerializationKeys.qualification) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(fname, forKey: SerializationKeys.fname)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(lname, forKey: SerializationKeys.lname)
    aCoder.encode(qualification, forKey: SerializationKeys.qualification)
  }

}
