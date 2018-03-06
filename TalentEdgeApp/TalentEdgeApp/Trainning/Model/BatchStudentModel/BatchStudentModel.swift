//
//  BatchStudentModel.swift
//
//  Created by Vinod Kumar on 30/06/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class BatchStudentModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let country = "country"
    static let city = "city"
    static let name = "name"
    static let id = "id"
    static let image = "image"
    static let isSelf = "self"
    static let lastActive = "last_active"
    static let qualification = "qualification"
  }

  // MARK: Properties
  public var country: String?
  public var city: String?
  public var name: String?
  public var id: String?
  public var image: String?
  public var isSelf: Int?
  public var lastActive: String?
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
    country = json[SerializationKeys.country].string
    city = json[SerializationKeys.city].string
    name = json[SerializationKeys.name].string
    id = json[SerializationKeys.id].string
    image = json[SerializationKeys.image].string
    isSelf = json[SerializationKeys.isSelf].int
    lastActive = json[SerializationKeys.lastActive].string
    qualification = json[SerializationKeys.qualification].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = country { dictionary[SerializationKeys.country] = value }
    if let value = city { dictionary[SerializationKeys.city] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = isSelf { dictionary[SerializationKeys.isSelf] = value }
    if let value = lastActive { dictionary[SerializationKeys.lastActive] = value }
    if let value = qualification { dictionary[SerializationKeys.qualification] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.country = aDecoder.decodeObject(forKey: SerializationKeys.country) as? String
    self.city = aDecoder.decodeObject(forKey: SerializationKeys.city) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    self.isSelf = aDecoder.decodeObject(forKey: SerializationKeys.isSelf) as? Int
    self.lastActive = aDecoder.decodeObject(forKey: SerializationKeys.lastActive) as? String
    self.qualification = aDecoder.decodeObject(forKey: SerializationKeys.qualification) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(country, forKey: SerializationKeys.country)
    aCoder.encode(city, forKey: SerializationKeys.city)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(image, forKey: SerializationKeys.image)
    aCoder.encode(isSelf, forKey: SerializationKeys.isSelf)
    aCoder.encode(lastActive, forKey: SerializationKeys.lastActive)
    aCoder.encode(qualification, forKey: SerializationKeys.qualification)
  }

}
