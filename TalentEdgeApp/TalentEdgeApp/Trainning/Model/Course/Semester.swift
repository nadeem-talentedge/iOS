//
//  Semester.swift
//
//  Created by Vinod Kumar Sahu on 19/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Semester: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let semesterName = "semester_name"
    static let completionPercentage = "completion_percentage"
    static let semesterStatus = "semester_status"
    static let semesterId = "semester_id"
    static let semester = "semester"
  }

  // MARK: Properties
  public var semesterName: String?
  public var completionPercentage: Float?
  public var semesterStatus: Bool? = false
  public var semesterId: String?
  public var semester: String?

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
    semesterName = json[SerializationKeys.semesterName].string
    completionPercentage = json[SerializationKeys.completionPercentage].float
    semesterStatus = json[SerializationKeys.semesterStatus].boolValue
    semesterId = json[SerializationKeys.semesterId].string
    semester = json[SerializationKeys.semester].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = semesterName { dictionary[SerializationKeys.semesterName] = value }
    if let value = completionPercentage { dictionary[SerializationKeys.completionPercentage] = value }
    dictionary[SerializationKeys.semesterStatus] = semesterStatus
    if let value = semesterId { dictionary[SerializationKeys.semesterId] = value }
    if let value = semester { dictionary[SerializationKeys.semester] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.semesterName = aDecoder.decodeObject(forKey: SerializationKeys.semesterName) as? String
    self.completionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.completionPercentage) as? Float
    self.semesterStatus = aDecoder.decodeBool(forKey: SerializationKeys.semesterStatus)
    self.semesterId = aDecoder.decodeObject(forKey: SerializationKeys.semesterId) as? String
    self.semester = aDecoder.decodeObject(forKey: SerializationKeys.semester) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(semesterName, forKey: SerializationKeys.semesterName)
    aCoder.encode(completionPercentage, forKey: SerializationKeys.completionPercentage)
    aCoder.encode(semesterStatus, forKey: SerializationKeys.semesterStatus)
    aCoder.encode(semesterId, forKey: SerializationKeys.semesterId)
    aCoder.encode(semester, forKey: SerializationKeys.semester)
  }

}
