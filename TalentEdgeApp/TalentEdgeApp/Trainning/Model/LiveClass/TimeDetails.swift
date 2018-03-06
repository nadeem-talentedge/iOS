//
//  TimeDetails.swift
//
//  Created by Vinod Kumar Sahu on 24/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TimeDetails: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let inTime = "in_time"
    static let outTime = "out_time"
  }

  // MARK: Properties
  public var inTime: String?
  public var outTime: String?

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
    inTime = json[SerializationKeys.inTime].string
    outTime = json[SerializationKeys.outTime].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = inTime { dictionary[SerializationKeys.inTime] = value }
    if let value = outTime { dictionary[SerializationKeys.outTime] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.inTime = aDecoder.decodeObject(forKey: SerializationKeys.inTime) as? String
    self.outTime = aDecoder.decodeObject(forKey: SerializationKeys.outTime) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(inTime, forKey: SerializationKeys.inTime)
    aCoder.encode(outTime, forKey: SerializationKeys.outTime)
  }

}
