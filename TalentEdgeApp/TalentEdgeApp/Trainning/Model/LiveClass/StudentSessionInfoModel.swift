//
//  StudentSessionInfoModel.swift
//
//  Created by Vinod Kumar Sahu on 24/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class StudentSessionInfoModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let mobileNo = "mobile_no"
    static let totalDuration = "total_duration"
    static let email = "email"
    static let id = "id"
    static let lname = "lname"
    static let timeDetails = "time_details"
    static let totalVisits = "total_visits"
    static let pic = "pic"
    static let fname = "fname"
    static let sessionType = "session_type"
  }

  // MARK: Properties
  public var mobileNo: String?
  public var totalDuration: Int?
  public var email: String?
  public var id: String?
  public var lname: String?
  public var timeDetails: [TimeDetails]?
  public var totalVisits: Int?
  public var pic: String?
  public var fname: String?
  public var sessionType: String?

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
    mobileNo = json[SerializationKeys.mobileNo].string
    totalDuration = json[SerializationKeys.totalDuration].int
    email = json[SerializationKeys.email].string
    id = json[SerializationKeys.id].string
    lname = json[SerializationKeys.lname].string
    if let items = json[SerializationKeys.timeDetails].array { timeDetails = items.map { TimeDetails(json: $0) } }
    totalVisits = json[SerializationKeys.totalVisits].int
    pic = json[SerializationKeys.pic].string
    fname = json[SerializationKeys.fname].string
    sessionType = json[SerializationKeys.sessionType].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = mobileNo { dictionary[SerializationKeys.mobileNo] = value }
    if let value = totalDuration { dictionary[SerializationKeys.totalDuration] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = lname { dictionary[SerializationKeys.lname] = value }
    if let value = timeDetails { dictionary[SerializationKeys.timeDetails] = value.map { $0.dictionaryRepresentation() } }
    if let value = totalVisits { dictionary[SerializationKeys.totalVisits] = value }
    if let value = pic { dictionary[SerializationKeys.pic] = value }
    if let value = fname { dictionary[SerializationKeys.fname] = value }
    if let value = sessionType { dictionary[SerializationKeys.sessionType] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.mobileNo = aDecoder.decodeObject(forKey: SerializationKeys.mobileNo) as? String
    self.totalDuration = aDecoder.decodeObject(forKey: SerializationKeys.totalDuration) as? Int
    self.email = aDecoder.decodeObject(forKey: SerializationKeys.email) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.lname = aDecoder.decodeObject(forKey: SerializationKeys.lname) as? String
    self.timeDetails = aDecoder.decodeObject(forKey: SerializationKeys.timeDetails) as? [TimeDetails]
    self.totalVisits = aDecoder.decodeObject(forKey: SerializationKeys.totalVisits) as? Int
    self.pic = aDecoder.decodeObject(forKey: SerializationKeys.pic) as? String
    self.fname = aDecoder.decodeObject(forKey: SerializationKeys.fname) as? String
    self.sessionType = aDecoder.decodeObject(forKey: SerializationKeys.sessionType) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(mobileNo, forKey: SerializationKeys.mobileNo)
    aCoder.encode(totalDuration, forKey: SerializationKeys.totalDuration)
    aCoder.encode(email, forKey: SerializationKeys.email)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(lname, forKey: SerializationKeys.lname)
    aCoder.encode(timeDetails, forKey: SerializationKeys.timeDetails)
    aCoder.encode(totalVisits, forKey: SerializationKeys.totalVisits)
    aCoder.encode(pic, forKey: SerializationKeys.pic)
    aCoder.encode(fname, forKey: SerializationKeys.fname)
    aCoder.encode(sessionType, forKey: SerializationKeys.sessionType)
  }

}
