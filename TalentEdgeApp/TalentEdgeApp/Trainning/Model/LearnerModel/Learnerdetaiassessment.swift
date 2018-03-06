//
//  Learnerdetaiassessment.swift
//
//  Created by Vinod Kumar on 30/09/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Learnerdetaiassessment: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let total = "total"
    static let completed = "completed"
  }

  // MARK: Properties
  public var total: Int?
  public var completed: Int?

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
    total = json[SerializationKeys.total].int
    completed = json[SerializationKeys.completed].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = completed { dictionary[SerializationKeys.completed] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.total = aDecoder.decodeObject(forKey: SerializationKeys.total) as? Int
    self.completed = aDecoder.decodeObject(forKey: SerializationKeys.completed) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(total, forKey: SerializationKeys.total)
    aCoder.encode(completed, forKey: SerializationKeys.completed)
  }

}
