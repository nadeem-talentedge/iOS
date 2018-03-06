//
//  RWAttemptDetails.swift
//
//  Created by Vinod Kumar on 30/06/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class RWAttemptDetails: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let isLatest = "is_latest"
    static let duration = "duration"
    static let durationLabel = "duration_label"
  }

  // MARK: Properties
  public var isLatest: String?
  public var duration: String?
  public var durationLabel: String?

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
    isLatest = json[SerializationKeys.isLatest].string
    duration = json[SerializationKeys.duration].string
    durationLabel = json[SerializationKeys.durationLabel].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = isLatest { dictionary[SerializationKeys.isLatest] = value }
    if let value = duration { dictionary[SerializationKeys.duration] = value }
    if let value = durationLabel { dictionary[SerializationKeys.durationLabel] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.isLatest = aDecoder.decodeObject(forKey: SerializationKeys.isLatest) as? String
    self.duration = aDecoder.decodeObject(forKey: SerializationKeys.duration) as? String
    self.durationLabel = aDecoder.decodeObject(forKey: SerializationKeys.durationLabel) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(isLatest, forKey: SerializationKeys.isLatest)
    aCoder.encode(duration, forKey: SerializationKeys.duration)
    aCoder.encode(durationLabel, forKey: SerializationKeys.durationLabel)
  }

}
