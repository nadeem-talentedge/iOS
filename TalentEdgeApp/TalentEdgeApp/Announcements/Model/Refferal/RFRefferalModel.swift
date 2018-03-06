//
//  RFRefferalModel.swift
//
//  Created by Vinod Kumar Sahu on 16/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class RFRefferalModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let referralCount = "referral_count"
    static let referralInfo = "referral_info"
  }

  // MARK: Properties
  public var referralCount: RFReferralCount?
  public var referralInfo: [RFReferralInfo]?

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
    referralCount = RFReferralCount(json: json[SerializationKeys.referralCount])
    if let items = json[SerializationKeys.referralInfo].array { referralInfo = items.map { RFReferralInfo(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = referralCount { dictionary[SerializationKeys.referralCount] = value.dictionaryRepresentation() }
    if let value = referralInfo { dictionary[SerializationKeys.referralInfo] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.referralCount = aDecoder.decodeObject(forKey: SerializationKeys.referralCount) as? RFReferralCount
    self.referralInfo = aDecoder.decodeObject(forKey: SerializationKeys.referralInfo) as? [RFReferralInfo]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(referralCount, forKey: SerializationKeys.referralCount)
    aCoder.encode(referralInfo, forKey: SerializationKeys.referralInfo)
  }

}
