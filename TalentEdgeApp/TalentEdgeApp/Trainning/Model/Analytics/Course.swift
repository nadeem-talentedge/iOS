//
//  Course.swift
//
//  Created by Vinod Kumar Sahu on 14/11/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Course: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let name = "name"
    static let instituteId = "institute_id"
  }

  // MARK: Properties
  public var id: String?
  public var name: String?
  public var instituteId: String?

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
    id = json[SerializationKeys.id].string
    name = json[SerializationKeys.name].string
    instituteId = json[SerializationKeys.instituteId].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = instituteId { dictionary[SerializationKeys.instituteId] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.instituteId = aDecoder.decodeObject(forKey: SerializationKeys.instituteId) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(instituteId, forKey: SerializationKeys.instituteId)
  }

}
