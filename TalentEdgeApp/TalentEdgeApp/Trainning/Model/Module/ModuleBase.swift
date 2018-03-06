//
//  ModuleBase.swift
//
//  Created by Vinod Kumar on 24/05/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ModuleBase: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let completionPercentage = "completion_percentage"
    static let id = "id"
    static let batchId = "batch_id"
    static let isDefaultOpen = "is_default_open"
    static let isBatchlevel = "is_batchlevel"
  }

  // MARK: Properties
  public var name: String?
  public var completionPercentage: String?
  public var id: String?
  public var batchId: String?
  public var isDefaultOpen: Int?
  public var isBatchlevel: Bool? = false

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
    name = json[SerializationKeys.name].string
    completionPercentage = json[SerializationKeys.completionPercentage].string
    id = json[SerializationKeys.id].string
    batchId = json[SerializationKeys.batchId].string
    isDefaultOpen = json[SerializationKeys.isDefaultOpen].int
    isBatchlevel = json[SerializationKeys.isBatchlevel].boolValue
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = completionPercentage { dictionary[SerializationKeys.completionPercentage] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = batchId { dictionary[SerializationKeys.batchId] = value }
    if let value = isDefaultOpen { dictionary[SerializationKeys.isDefaultOpen] = value }
    dictionary[SerializationKeys.isBatchlevel] = isBatchlevel
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.completionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.completionPercentage) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.batchId = aDecoder.decodeObject(forKey: SerializationKeys.batchId) as? String
    self.isDefaultOpen = aDecoder.decodeObject(forKey: SerializationKeys.isDefaultOpen) as? Int
    self.isBatchlevel = aDecoder.decodeBool(forKey: SerializationKeys.isBatchlevel)
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(completionPercentage, forKey: SerializationKeys.completionPercentage)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(batchId, forKey: SerializationKeys.batchId)
    aCoder.encode(isDefaultOpen, forKey: SerializationKeys.isDefaultOpen)
    aCoder.encode(isBatchlevel, forKey: SerializationKeys.isBatchlevel)
  }

}
