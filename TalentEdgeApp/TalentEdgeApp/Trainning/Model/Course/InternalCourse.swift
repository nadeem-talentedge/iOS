//
//  InternalCourse.swift
//
//  Created by Vinod Kumar Sahu on 19/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class InternalCourse: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let instituteDescription = "institute_description"
    static let sessionStartDate = "session_start_date"
    static let studentCount = "student_count"
    static let courseName = "course_name"
    static let semesterCount = "semester_count"
    static let semester = "semester"
    static let sessionEndDate = "session_end_date"
    static let instituteId = "institute_id"
    static let courseDescription = "course_description"
    static let courseId = "course_id"
    static let sessionId = "session_id"
    static let instituteLogo = "institute_logo"
    static let sessionName = "session_name"
    static let sessionLogo = "session_logo"
    static let instituteName = "institute_name"
  }

  // MARK: Properties
  public var instituteDescription: String?
  public var sessionStartDate: String?
  public var studentCount: Int?
  public var courseName: String?
  public var semesterCount: Int?
  public var semester: [Semester]?
  public var sessionEndDate: String?
  public var instituteId: String?
  public var courseDescription: String?
  public var courseId: String?
  public var sessionId: String?
  public var instituteLogo: String?
  public var sessionName: String?
  public var sessionLogo: String?
  public var instituteName: String?

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
    instituteDescription = json[SerializationKeys.instituteDescription].string
    sessionStartDate = json[SerializationKeys.sessionStartDate].string
    studentCount = json[SerializationKeys.studentCount].int
    courseName = json[SerializationKeys.courseName].string
    semesterCount = json[SerializationKeys.semesterCount].int
    if let items = json[SerializationKeys.semester].array { semester = items.map { Semester(json: $0) } }
    sessionEndDate = json[SerializationKeys.sessionEndDate].string
    instituteId = json[SerializationKeys.instituteId].string
    courseDescription = json[SerializationKeys.courseDescription].string
    courseId = json[SerializationKeys.courseId].string
    sessionId = json[SerializationKeys.sessionId].string
    instituteLogo = json[SerializationKeys.instituteLogo].string
    sessionName = json[SerializationKeys.sessionName].string
    sessionLogo = json[SerializationKeys.sessionLogo].string
    instituteName = json[SerializationKeys.instituteName].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = instituteDescription { dictionary[SerializationKeys.instituteDescription] = value }
    if let value = sessionStartDate { dictionary[SerializationKeys.sessionStartDate] = value }
    if let value = studentCount { dictionary[SerializationKeys.studentCount] = value }
    if let value = courseName { dictionary[SerializationKeys.courseName] = value }
    if let value = semesterCount { dictionary[SerializationKeys.semesterCount] = value }
    if let value = semester { dictionary[SerializationKeys.semester] = value.map { $0.dictionaryRepresentation() } }
    if let value = sessionEndDate { dictionary[SerializationKeys.sessionEndDate] = value }
    if let value = instituteId { dictionary[SerializationKeys.instituteId] = value }
    if let value = courseDescription { dictionary[SerializationKeys.courseDescription] = value }
    if let value = courseId { dictionary[SerializationKeys.courseId] = value }
    if let value = sessionId { dictionary[SerializationKeys.sessionId] = value }
    if let value = instituteLogo { dictionary[SerializationKeys.instituteLogo] = value }
    if let value = sessionName { dictionary[SerializationKeys.sessionName] = value }
    if let value = sessionLogo { dictionary[SerializationKeys.sessionLogo] = value }
    if let value = instituteName { dictionary[SerializationKeys.instituteName] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.instituteDescription = aDecoder.decodeObject(forKey: SerializationKeys.instituteDescription) as? String
    self.sessionStartDate = aDecoder.decodeObject(forKey: SerializationKeys.sessionStartDate) as? String
    self.studentCount = aDecoder.decodeObject(forKey: SerializationKeys.studentCount) as? Int
    self.courseName = aDecoder.decodeObject(forKey: SerializationKeys.courseName) as? String
    self.semesterCount = aDecoder.decodeObject(forKey: SerializationKeys.semesterCount) as? Int
    self.semester = aDecoder.decodeObject(forKey: SerializationKeys.semester) as? [Semester]
    self.sessionEndDate = aDecoder.decodeObject(forKey: SerializationKeys.sessionEndDate) as? String
    self.instituteId = aDecoder.decodeObject(forKey: SerializationKeys.instituteId) as? String
    self.courseDescription = aDecoder.decodeObject(forKey: SerializationKeys.courseDescription) as? String
    self.courseId = aDecoder.decodeObject(forKey: SerializationKeys.courseId) as? String
    self.sessionId = aDecoder.decodeObject(forKey: SerializationKeys.sessionId) as? String
    self.instituteLogo = aDecoder.decodeObject(forKey: SerializationKeys.instituteLogo) as? String
    self.sessionName = aDecoder.decodeObject(forKey: SerializationKeys.sessionName) as? String
    self.sessionLogo = aDecoder.decodeObject(forKey: SerializationKeys.sessionLogo) as? String
    self.instituteName = aDecoder.decodeObject(forKey: SerializationKeys.instituteName) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(instituteDescription, forKey: SerializationKeys.instituteDescription)
    aCoder.encode(sessionStartDate, forKey: SerializationKeys.sessionStartDate)
    aCoder.encode(studentCount, forKey: SerializationKeys.studentCount)
    aCoder.encode(courseName, forKey: SerializationKeys.courseName)
    aCoder.encode(semesterCount, forKey: SerializationKeys.semesterCount)
    aCoder.encode(semester, forKey: SerializationKeys.semester)
    aCoder.encode(sessionEndDate, forKey: SerializationKeys.sessionEndDate)
    aCoder.encode(instituteId, forKey: SerializationKeys.instituteId)
    aCoder.encode(courseDescription, forKey: SerializationKeys.courseDescription)
    aCoder.encode(courseId, forKey: SerializationKeys.courseId)
    aCoder.encode(sessionId, forKey: SerializationKeys.sessionId)
    aCoder.encode(instituteLogo, forKey: SerializationKeys.instituteLogo)
    aCoder.encode(sessionName, forKey: SerializationKeys.sessionName)
    aCoder.encode(sessionLogo, forKey: SerializationKeys.sessionLogo)
    aCoder.encode(instituteName, forKey: SerializationKeys.instituteName)
  }

}
