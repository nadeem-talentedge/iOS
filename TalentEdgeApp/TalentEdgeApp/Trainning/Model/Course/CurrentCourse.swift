//
//  CurrentCourse.swift
//
//  Created by Vinod Kumar Sahu on 19/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CurrentCourse: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let learner = "learner"
    static let totalBatchRating = "total_batch_rating"
    static let notStartedPercentage = "not_started_percentage"
    static let completedOn = "completed_on"
    static let courseFaculty = "faculty"
    static let id = "id"
    static let bannerUrl = "banner_url"
    static let completed = "completed"
    static let courseDuration = "course_duration"
    static let availableContents = "available_contents"
    static let completionPercentage = "completion_percentage"
    static let startedOn = "started_on"
    static let logo = "logo"
    static let instituteName = "institute_name"
    static let attendancePercentage = "attendance_percentage"
    static let name = "name"
    static let assignment = "assignment"
    static let shareUrl = "share_url"
    static let courseName = "course_name"
    static let totalModules = "total_modules"
    static let assessment = "assessment"
    static let pendingPercentage = "pending_percentage"
    static let descriptionValue = "description"
    static let averageRatingInCourse = "average_rating_in_course"
    static let discussion = "discussion"
  }

  // MARK: Properties
  public var learner: String?
  public var totalBatchRating: String?
  public var notStartedPercentage: String?
  public var completedOn: String?
  public var courseFaculty: [CourseFaculty]?
  public var id: String?
  public var bannerUrl: String?
  public var completed: String?
  public var courseDuration: String?
  public var availableContents: String?
  public var completionPercentage: String?
  public var startedOn: String?
  public var logo: String?
  public var instituteName: String?
  public var attendancePercentage: String?
  public var name: String?
  public var assignment: String?
  public var shareUrl: String?
  public var courseName: String?
  public var totalModules: String?
  public var assessment: String?
  public var pendingPercentage: String?
  public var descriptionValue: String?
  public var averageRatingInCourse: String?
  public var discussion: String?

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
    learner = json[SerializationKeys.learner].string
    totalBatchRating = json[SerializationKeys.totalBatchRating].string
    notStartedPercentage = json[SerializationKeys.notStartedPercentage].string
    completedOn = json[SerializationKeys.completedOn].string
    if let items = json[SerializationKeys.courseFaculty].array { courseFaculty = items.map { CourseFaculty(json: $0) } }
    id = json[SerializationKeys.id].string
    bannerUrl = json[SerializationKeys.bannerUrl].string
    completed = json[SerializationKeys.completed].string
    courseDuration = json[SerializationKeys.courseDuration].string
    availableContents = json[SerializationKeys.availableContents].string
    completionPercentage = json[SerializationKeys.completionPercentage].string
    startedOn = json[SerializationKeys.startedOn].string
    logo = json[SerializationKeys.logo].string
    instituteName = json[SerializationKeys.instituteName].string
    attendancePercentage = json[SerializationKeys.attendancePercentage].string
    name = json[SerializationKeys.name].string
    assignment = json[SerializationKeys.assignment].string
    shareUrl = json[SerializationKeys.shareUrl].string
    courseName = json[SerializationKeys.courseName].string
    totalModules = json[SerializationKeys.totalModules].string
    assessment = json[SerializationKeys.assessment].string
    pendingPercentage = json[SerializationKeys.pendingPercentage].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    averageRatingInCourse = json[SerializationKeys.averageRatingInCourse].string
    discussion = json[SerializationKeys.discussion].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = learner { dictionary[SerializationKeys.learner] = value }
    if let value = totalBatchRating { dictionary[SerializationKeys.totalBatchRating] = value }
    if let value = notStartedPercentage { dictionary[SerializationKeys.notStartedPercentage] = value }
    if let value = completedOn { dictionary[SerializationKeys.completedOn] = value }
    if let value = courseFaculty { dictionary[SerializationKeys.courseFaculty] = value.map { $0.dictionaryRepresentation() } }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = bannerUrl { dictionary[SerializationKeys.bannerUrl] = value }
    if let value = completed { dictionary[SerializationKeys.completed] = value }
    if let value = courseDuration { dictionary[SerializationKeys.courseDuration] = value }
    if let value = availableContents { dictionary[SerializationKeys.availableContents] = value }
    if let value = completionPercentage { dictionary[SerializationKeys.completionPercentage] = value }
    if let value = startedOn { dictionary[SerializationKeys.startedOn] = value }
    if let value = logo { dictionary[SerializationKeys.logo] = value }
    if let value = instituteName { dictionary[SerializationKeys.instituteName] = value }
    if let value = attendancePercentage { dictionary[SerializationKeys.attendancePercentage] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = assignment { dictionary[SerializationKeys.assignment] = value }
    if let value = shareUrl { dictionary[SerializationKeys.shareUrl] = value }
    if let value = courseName { dictionary[SerializationKeys.courseName] = value }
    if let value = totalModules { dictionary[SerializationKeys.totalModules] = value }
    if let value = assessment { dictionary[SerializationKeys.assessment] = value }
    if let value = pendingPercentage { dictionary[SerializationKeys.pendingPercentage] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = averageRatingInCourse { dictionary[SerializationKeys.averageRatingInCourse] = value }
    if let value = discussion { dictionary[SerializationKeys.discussion] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.learner = aDecoder.decodeObject(forKey: SerializationKeys.learner) as? String
    self.totalBatchRating = aDecoder.decodeObject(forKey: SerializationKeys.totalBatchRating) as? String
    self.notStartedPercentage = aDecoder.decodeObject(forKey: SerializationKeys.notStartedPercentage) as? String
    self.completedOn = aDecoder.decodeObject(forKey: SerializationKeys.completedOn) as? String
    self.courseFaculty = aDecoder.decodeObject(forKey: SerializationKeys.courseFaculty) as? [CourseFaculty]
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.bannerUrl = aDecoder.decodeObject(forKey: SerializationKeys.bannerUrl) as? String
    self.completed = aDecoder.decodeObject(forKey: SerializationKeys.completed) as? String
    self.courseDuration = aDecoder.decodeObject(forKey: SerializationKeys.courseDuration) as? String
    self.availableContents = aDecoder.decodeObject(forKey: SerializationKeys.availableContents) as? String
    self.completionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.completionPercentage) as? String
    self.startedOn = aDecoder.decodeObject(forKey: SerializationKeys.startedOn) as? String
    self.logo = aDecoder.decodeObject(forKey: SerializationKeys.logo) as? String
    self.instituteName = aDecoder.decodeObject(forKey: SerializationKeys.instituteName) as? String
    self.attendancePercentage = aDecoder.decodeObject(forKey: SerializationKeys.attendancePercentage) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.assignment = aDecoder.decodeObject(forKey: SerializationKeys.assignment) as? String
    self.shareUrl = aDecoder.decodeObject(forKey: SerializationKeys.shareUrl) as? String
    self.courseName = aDecoder.decodeObject(forKey: SerializationKeys.courseName) as? String
    self.totalModules = aDecoder.decodeObject(forKey: SerializationKeys.totalModules) as? String
    self.assessment = aDecoder.decodeObject(forKey: SerializationKeys.assessment) as? String
    self.pendingPercentage = aDecoder.decodeObject(forKey: SerializationKeys.pendingPercentage) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.averageRatingInCourse = aDecoder.decodeObject(forKey: SerializationKeys.averageRatingInCourse) as? String
    self.discussion = aDecoder.decodeObject(forKey: SerializationKeys.discussion) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(learner, forKey: SerializationKeys.learner)
    aCoder.encode(totalBatchRating, forKey: SerializationKeys.totalBatchRating)
    aCoder.encode(notStartedPercentage, forKey: SerializationKeys.notStartedPercentage)
    aCoder.encode(completedOn, forKey: SerializationKeys.completedOn)
    aCoder.encode(courseFaculty, forKey: SerializationKeys.courseFaculty)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(bannerUrl, forKey: SerializationKeys.bannerUrl)
    aCoder.encode(completed, forKey: SerializationKeys.completed)
    aCoder.encode(courseDuration, forKey: SerializationKeys.courseDuration)
    aCoder.encode(availableContents, forKey: SerializationKeys.availableContents)
    aCoder.encode(completionPercentage, forKey: SerializationKeys.completionPercentage)
    aCoder.encode(startedOn, forKey: SerializationKeys.startedOn)
    aCoder.encode(logo, forKey: SerializationKeys.logo)
    aCoder.encode(instituteName, forKey: SerializationKeys.instituteName)
    aCoder.encode(attendancePercentage, forKey: SerializationKeys.attendancePercentage)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(assignment, forKey: SerializationKeys.assignment)
    aCoder.encode(shareUrl, forKey: SerializationKeys.shareUrl)
    aCoder.encode(courseName, forKey: SerializationKeys.courseName)
    aCoder.encode(totalModules, forKey: SerializationKeys.totalModules)
    aCoder.encode(assessment, forKey: SerializationKeys.assessment)
    aCoder.encode(pendingPercentage, forKey: SerializationKeys.pendingPercentage)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(averageRatingInCourse, forKey: SerializationKeys.averageRatingInCourse)
    aCoder.encode(discussion, forKey: SerializationKeys.discussion)
  }

}
