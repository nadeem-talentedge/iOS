//
//  AnalyticsBase.swift
//
//  Created by Vinod Kumar Sahu on 14/11/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class AnalyticsBase: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let queries = "queries"
    static let liveClasses = "live_classes"
    static let faculty = "faculty"
    static let course = "course"
    static let analytics = "analytics"
    static let video = "video"
    static let assessmentAnalytics = "assessment"
    static let assignmentAnalytics = "assignment"
    static let notesanAnalytics = "notes"
    static let batch = "batch"
    static let institute = "institute"
  }

  // MARK: Properties
  public var queries: Queries?
  public var liveClasses: [LiveClasses]?
  public var faculty: [String]?
  public var course: Course?
  public var analytics: Analytics?
  public var video: [Any]?
  public var assessmentAnalytics: [AssessmentAnalytics]?
  public var assignmentAnalytics: [AssignmentAnalytics]?
  public var notesanAnalytics: [NotesanAnalytics]?
  public var batch: Batch?
  public var institute: Institute?

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
    queries = Queries(json: json[SerializationKeys.queries])
    if let items = json[SerializationKeys.liveClasses].array { liveClasses = items.map { LiveClasses(json: $0) } }
    if let items = json[SerializationKeys.faculty].array { faculty = items.map { $0.stringValue } }
    course = Course(json: json[SerializationKeys.course])
    analytics = Analytics(json: json[SerializationKeys.analytics])
    if let items = json[SerializationKeys.video].array { video = items.map { $0.object} }
    if let items = json[SerializationKeys.assessmentAnalytics].array { assessmentAnalytics = items.map {AssessmentAnalytics(json: $0)} }
    if let items = json[SerializationKeys.assignmentAnalytics].array { assignmentAnalytics = items.map { AssignmentAnalytics(json: $0) } }
    if let items = json[SerializationKeys.notesanAnalytics].array { notesanAnalytics = items.map { NotesanAnalytics(json: $0) } }
    batch = Batch(json: json[SerializationKeys.batch])
    institute = Institute(json: json[SerializationKeys.institute])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = queries { dictionary[SerializationKeys.queries] = value.dictionaryRepresentation() }
    if let value = liveClasses { dictionary[SerializationKeys.liveClasses] = value.map { $0.dictionaryRepresentation() } }
    if let value = faculty { dictionary[SerializationKeys.faculty] = value }
    if let value = course { dictionary[SerializationKeys.course] = value.dictionaryRepresentation() }
    if let value = analytics { dictionary[SerializationKeys.analytics] = value.dictionaryRepresentation() }
    if let value = video { dictionary[SerializationKeys.video] = value }
    if let value = assessmentAnalytics { dictionary[SerializationKeys.assessmentAnalytics] = value }
    if let value = assignmentAnalytics { dictionary[SerializationKeys.assignmentAnalytics] = value.map { $0.dictionaryRepresentation() } }
    if let value = notesanAnalytics { dictionary[SerializationKeys.notesanAnalytics] = value.map { $0.dictionaryRepresentation() } }
    if let value = batch { dictionary[SerializationKeys.batch] = value.dictionaryRepresentation() }
    if let value = institute { dictionary[SerializationKeys.institute] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.queries = aDecoder.decodeObject(forKey: SerializationKeys.queries) as? Queries
    self.liveClasses = aDecoder.decodeObject(forKey: SerializationKeys.liveClasses) as? [LiveClasses]
    self.faculty = aDecoder.decodeObject(forKey: SerializationKeys.faculty) as? [String]
    self.course = aDecoder.decodeObject(forKey: SerializationKeys.course) as? Course
    self.analytics = aDecoder.decodeObject(forKey: SerializationKeys.analytics) as? Analytics
    self.video = aDecoder.decodeObject(forKey: SerializationKeys.video) as? [Any]
    self.assessmentAnalytics = aDecoder.decodeObject(forKey: SerializationKeys.assessmentAnalytics) as? [AssessmentAnalytics]
    self.assignmentAnalytics = aDecoder.decodeObject(forKey: SerializationKeys.assignmentAnalytics) as? [AssignmentAnalytics]
    self.notesanAnalytics = aDecoder.decodeObject(forKey: SerializationKeys.notesanAnalytics) as? [NotesanAnalytics]
    self.batch = aDecoder.decodeObject(forKey: SerializationKeys.batch) as? Batch
    self.institute = aDecoder.decodeObject(forKey: SerializationKeys.institute) as? Institute
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(queries, forKey: SerializationKeys.queries)
    aCoder.encode(liveClasses, forKey: SerializationKeys.liveClasses)
    aCoder.encode(faculty, forKey: SerializationKeys.faculty)
    aCoder.encode(course, forKey: SerializationKeys.course)
    aCoder.encode(analytics, forKey: SerializationKeys.analytics)
    aCoder.encode(video, forKey: SerializationKeys.video)
    aCoder.encode(assessmentAnalytics, forKey: SerializationKeys.assessmentAnalytics)
    aCoder.encode(assignmentAnalytics, forKey: SerializationKeys.assignmentAnalytics)
    aCoder.encode(notesanAnalytics, forKey: SerializationKeys.notesanAnalytics)
    aCoder.encode(batch, forKey: SerializationKeys.batch)
    aCoder.encode(institute, forKey: SerializationKeys.institute)
  }

}
