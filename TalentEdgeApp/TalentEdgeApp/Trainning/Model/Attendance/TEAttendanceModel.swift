//
//  TEAttendanceModel.swift
//
//  Created by Temp  on 15/06/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TEAttendanceModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let totalAttendanceCount = "total_attendance_count"
    static let totalClassCount = "total_class_count"
    static let ownAttendacnePercentage = "own_attendacne_percentage"
    static let liveSessionAttendance = "live_session_attendance"
  }

  // MARK: Properties
  public var totalAttendanceCount: Int?
  public var totalClassCount: Int?
  public var ownAttendacnePercentage: Int?
  public var liveSessionAttendance: [LiveSessionAttendance]?

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
    totalAttendanceCount = json[SerializationKeys.totalAttendanceCount].int
    totalClassCount = json[SerializationKeys.totalClassCount].int
    ownAttendacnePercentage = json[SerializationKeys.ownAttendacnePercentage].int
    if let items = json[SerializationKeys.liveSessionAttendance].array { liveSessionAttendance = items.map { LiveSessionAttendance(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = totalAttendanceCount { dictionary[SerializationKeys.totalAttendanceCount] = value }
    if let value = totalClassCount { dictionary[SerializationKeys.totalClassCount] = value }
    if let value = ownAttendacnePercentage { dictionary[SerializationKeys.ownAttendacnePercentage] = value }
    if let value = liveSessionAttendance { dictionary[SerializationKeys.liveSessionAttendance] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.totalAttendanceCount = aDecoder.decodeObject(forKey: SerializationKeys.totalAttendanceCount) as? Int
    self.totalClassCount = aDecoder.decodeObject(forKey: SerializationKeys.totalClassCount) as? Int
    self.ownAttendacnePercentage = aDecoder.decodeObject(forKey: SerializationKeys.ownAttendacnePercentage) as? Int
    self.liveSessionAttendance = aDecoder.decodeObject(forKey: SerializationKeys.liveSessionAttendance) as? [LiveSessionAttendance]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(totalAttendanceCount, forKey: SerializationKeys.totalAttendanceCount)
    aCoder.encode(totalClassCount, forKey: SerializationKeys.totalClassCount)
    aCoder.encode(ownAttendacnePercentage, forKey: SerializationKeys.ownAttendacnePercentage)
    aCoder.encode(liveSessionAttendance, forKey: SerializationKeys.liveSessionAttendance)
  }

}
