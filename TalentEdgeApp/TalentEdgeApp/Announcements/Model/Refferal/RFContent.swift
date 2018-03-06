//
//  RFContent.swift
//
//  Created by Vinod Kumar Sahu on 16/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class RFContent: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let myReferralCount = "my_referral_count"
    static let recruitmentStatus = "recruitment_status"
    static let rewardType = "reward_type"
    static let created = "created"
    static let cid = "cid"
    static let title = "title"
    static let refType = "ref_type"
    static let rewardAmount = "reward_amount"
  }

  // MARK: Properties
  public var myReferralCount: Int?
  public var recruitmentStatus: String?
  public var rewardType: String?
  public var created: String?
  public var cid: String?
  public var title: String?
  public var refType: String?
  public var rewardAmount: String?

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
    myReferralCount = json[SerializationKeys.myReferralCount].int
    recruitmentStatus = json[SerializationKeys.recruitmentStatus].string
    rewardType = json[SerializationKeys.rewardType].string
    created = json[SerializationKeys.created].string
    cid = json[SerializationKeys.cid].string
    title = json[SerializationKeys.title].string
    refType = json[SerializationKeys.refType].string
    rewardAmount = json[SerializationKeys.rewardAmount].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = myReferralCount { dictionary[SerializationKeys.myReferralCount] = value }
    if let value = recruitmentStatus { dictionary[SerializationKeys.recruitmentStatus] = value }
    if let value = rewardType { dictionary[SerializationKeys.rewardType] = value }
    if let value = created { dictionary[SerializationKeys.created] = value }
    if let value = cid { dictionary[SerializationKeys.cid] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = refType { dictionary[SerializationKeys.refType] = value }
    if let value = rewardAmount { dictionary[SerializationKeys.rewardAmount] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.myReferralCount = aDecoder.decodeObject(forKey: SerializationKeys.myReferralCount) as? Int
    self.recruitmentStatus = aDecoder.decodeObject(forKey: SerializationKeys.recruitmentStatus) as? String
    self.rewardType = aDecoder.decodeObject(forKey: SerializationKeys.rewardType) as? String
    self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? String
    self.cid = aDecoder.decodeObject(forKey: SerializationKeys.cid) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.refType = aDecoder.decodeObject(forKey: SerializationKeys.refType) as? String
    self.rewardAmount = aDecoder.decodeObject(forKey: SerializationKeys.rewardAmount) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(myReferralCount, forKey: SerializationKeys.myReferralCount)
    aCoder.encode(recruitmentStatus, forKey: SerializationKeys.recruitmentStatus)
    aCoder.encode(rewardType, forKey: SerializationKeys.rewardType)
    aCoder.encode(created, forKey: SerializationKeys.created)
    aCoder.encode(cid, forKey: SerializationKeys.cid)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(refType, forKey: SerializationKeys.refType)
    aCoder.encode(rewardAmount, forKey: SerializationKeys.rewardAmount)
  }

}
