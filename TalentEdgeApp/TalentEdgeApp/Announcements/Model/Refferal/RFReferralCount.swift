//
//  RFReferralCount.swift
//
//  Created by Vinod Kumar Sahu on 16/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class RFReferralCount: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let earned = "earned"
    static let statusCount = "status_count"
  }

  // MARK: Properties
  public var earned: Int?
  public var statusCount: RFStatusCount?

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
    earned = json[SerializationKeys.earned].int
    statusCount = RFStatusCount(json: json[SerializationKeys.statusCount])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = earned { dictionary[SerializationKeys.earned] = value }
    if let value = statusCount { dictionary[SerializationKeys.statusCount] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.earned = aDecoder.decodeObject(forKey: SerializationKeys.earned) as? Int
    self.statusCount = aDecoder.decodeObject(forKey: SerializationKeys.statusCount) as? RFStatusCount
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(earned, forKey: SerializationKeys.earned)
    aCoder.encode(statusCount, forKey: SerializationKeys.statusCount)
  }

}
