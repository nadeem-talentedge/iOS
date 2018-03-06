//
//  ANEventDetails.swift
//
//  Created by Vinod Kumar on 02/07/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ANEventDetails: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let venue = "venue"
    static let fromDateTime = "from_date_time"
    static let toDateTime = "to_date_time"
  }

  // MARK: Properties
  public var venue: String?
  public var fromDateTime: String?
  public var toDateTime: String?

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
    venue = json[SerializationKeys.venue].string
    fromDateTime = json[SerializationKeys.fromDateTime].string
    toDateTime = json[SerializationKeys.toDateTime].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = venue { dictionary[SerializationKeys.venue] = value }
    if let value = fromDateTime { dictionary[SerializationKeys.fromDateTime] = value }
    if let value = toDateTime { dictionary[SerializationKeys.toDateTime] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.venue = aDecoder.decodeObject(forKey: SerializationKeys.venue) as? String
    self.fromDateTime = aDecoder.decodeObject(forKey: SerializationKeys.fromDateTime) as? String
    self.toDateTime = aDecoder.decodeObject(forKey: SerializationKeys.toDateTime) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(venue, forKey: SerializationKeys.venue)
    aCoder.encode(fromDateTime, forKey: SerializationKeys.fromDateTime)
    aCoder.encode(toDateTime, forKey: SerializationKeys.toDateTime)
  }

}
