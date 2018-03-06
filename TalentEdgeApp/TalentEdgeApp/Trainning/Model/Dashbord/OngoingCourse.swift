//
//  OngoingCourse.swift
//
//  Created by Vinod Kumar on 05/07/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class OngoingCourse: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let learner = "learner"
    static let totalBatchRating = "total_batch_rating"
    static let notStartedPercentage = "not_started_percentage"
    static let completedOn = "completed_on"
    static let modules = "modules"
    static let id = "id"
    static let bannerUrl = "banner_url"
    static let completed = "completed"
    static let courseDuration = "course_duration"
    static let liveClassDetails = "live_class_details"
    static let liveClass = "live_class"
    static let completionPercentage = "completion_percentage"
    static let availableContents = "available_contents"
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
    static let faculty = "faculty"
    static let discussion = "discussion"
  }

  // MARK: Properties
  public var learner: Int?
  public var totalBatchRating: Int?
  public var notStartedPercentage: Int?
  public var completedOn: String?
  public var modules: Modules?
  public var id: String?
  public var bannerUrl: String?
  public var completed: Int?
  public var courseDuration: String?
  public var liveClassDetails: [LiveClassDetails]?
  public var liveClass: String?
  public var completionPercentage: Int?
  public var availableContents: String?
  public var startedOn: String?
  public var logo: String?
  public var instituteName: String?
  public var attendancePercentage: Int?
  public var name: String?
  public var assignment: String?
  public var shareUrl: String?
  public var courseName: String?
  public var totalModules: String?
  public var assessment: String?
  public var pendingPercentage: Int?
  public var descriptionValue: String?
  public var averageRatingInCourse: Int?
  public var faculty: [Faculty]?
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
    learner = json[SerializationKeys.learner].int
    totalBatchRating = json[SerializationKeys.totalBatchRating].int
    notStartedPercentage = json[SerializationKeys.notStartedPercentage].int
    completedOn = json[SerializationKeys.completedOn].string
    modules = Modules(json: json[SerializationKeys.modules])
    id = json[SerializationKeys.id].string
    bannerUrl = json[SerializationKeys.bannerUrl].string
    completed = json[SerializationKeys.completed].int
    courseDuration = json[SerializationKeys.courseDuration].string
    if let items = json[SerializationKeys.liveClassDetails].array { liveClassDetails = items.map { LiveClassDetails(json: $0) } }
    liveClass = json[SerializationKeys.liveClass].string
    completionPercentage = json[SerializationKeys.completionPercentage].int
    availableContents = json[SerializationKeys.availableContents].string
    startedOn = json[SerializationKeys.startedOn].string
    logo = json[SerializationKeys.logo].string
    instituteName = json[SerializationKeys.instituteName].string
    attendancePercentage = json[SerializationKeys.attendancePercentage].int
    name = json[SerializationKeys.name].string
    assignment = json[SerializationKeys.assignment].string
    shareUrl = json[SerializationKeys.shareUrl].string
    courseName = json[SerializationKeys.courseName].string
    totalModules = json[SerializationKeys.totalModules].string
    assessment = json[SerializationKeys.assessment].string
    pendingPercentage = json[SerializationKeys.pendingPercentage].int
    descriptionValue = json[SerializationKeys.descriptionValue].string
    averageRatingInCourse = json[SerializationKeys.averageRatingInCourse].int
    if let items = json[SerializationKeys.faculty].array { faculty = items.map { Faculty(json: $0) } }
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
    if let value = modules { dictionary[SerializationKeys.modules] = value.dictionaryRepresentation() }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = bannerUrl { dictionary[SerializationKeys.bannerUrl] = value }
    if let value = completed { dictionary[SerializationKeys.completed] = value }
    if let value = courseDuration { dictionary[SerializationKeys.courseDuration] = value }
    if let value = liveClassDetails { dictionary[SerializationKeys.liveClassDetails] = value.map { $0.dictionaryRepresentation() } }
    if let value = liveClass { dictionary[SerializationKeys.liveClass] = value }
    if let value = completionPercentage { dictionary[SerializationKeys.completionPercentage] = value }
    if let value = availableContents { dictionary[SerializationKeys.availableContents] = value }
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
    if let value = faculty { dictionary[SerializationKeys.faculty] = value.map { $0.dictionaryRepresentation() } }
    if let value = discussion { dictionary[SerializationKeys.discussion] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.learner = aDecoder.decodeObject(forKey: SerializationKeys.learner) as? Int
    self.totalBatchRating = aDecoder.decodeObject(forKey: SerializationKeys.totalBatchRating) as? Int
    self.notStartedPercentage = aDecoder.decodeObject(forKey: SerializationKeys.notStartedPercentage) as? Int
    self.completedOn = aDecoder.decodeObject(forKey: SerializationKeys.completedOn) as? String
    self.modules = aDecoder.decodeObject(forKey: SerializationKeys.modules) as? Modules
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.bannerUrl = aDecoder.decodeObject(forKey: SerializationKeys.bannerUrl) as? String
    self.completed = aDecoder.decodeObject(forKey: SerializationKeys.completed) as? Int
    self.courseDuration = aDecoder.decodeObject(forKey: SerializationKeys.courseDuration) as? String
    self.liveClassDetails = aDecoder.decodeObject(forKey: SerializationKeys.liveClassDetails) as? [LiveClassDetails]
    self.liveClass = aDecoder.decodeObject(forKey: SerializationKeys.liveClass) as? String
    self.completionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.completionPercentage) as? Int
    self.availableContents = aDecoder.decodeObject(forKey: SerializationKeys.availableContents) as? String
    self.startedOn = aDecoder.decodeObject(forKey: SerializationKeys.startedOn) as? String
    self.logo = aDecoder.decodeObject(forKey: SerializationKeys.logo) as? String
    self.instituteName = aDecoder.decodeObject(forKey: SerializationKeys.instituteName) as? String
    self.attendancePercentage = aDecoder.decodeObject(forKey: SerializationKeys.attendancePercentage) as? Int
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.assignment = aDecoder.decodeObject(forKey: SerializationKeys.assignment) as? String
    self.shareUrl = aDecoder.decodeObject(forKey: SerializationKeys.shareUrl) as? String
    self.courseName = aDecoder.decodeObject(forKey: SerializationKeys.courseName) as? String
    self.totalModules = aDecoder.decodeObject(forKey: SerializationKeys.totalModules) as? String
    self.assessment = aDecoder.decodeObject(forKey: SerializationKeys.assessment) as? String
    self.pendingPercentage = aDecoder.decodeObject(forKey: SerializationKeys.pendingPercentage) as? Int
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.averageRatingInCourse = aDecoder.decodeObject(forKey: SerializationKeys.averageRatingInCourse) as? Int
    self.faculty = aDecoder.decodeObject(forKey: SerializationKeys.faculty) as? [Faculty]
    self.discussion = aDecoder.decodeObject(forKey: SerializationKeys.discussion) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(learner, forKey: SerializationKeys.learner)
    aCoder.encode(totalBatchRating, forKey: SerializationKeys.totalBatchRating)
    aCoder.encode(notStartedPercentage, forKey: SerializationKeys.notStartedPercentage)
    aCoder.encode(completedOn, forKey: SerializationKeys.completedOn)
    aCoder.encode(modules, forKey: SerializationKeys.modules)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(bannerUrl, forKey: SerializationKeys.bannerUrl)
    aCoder.encode(completed, forKey: SerializationKeys.completed)
    aCoder.encode(courseDuration, forKey: SerializationKeys.courseDuration)
    aCoder.encode(liveClassDetails, forKey: SerializationKeys.liveClassDetails)
    aCoder.encode(liveClass, forKey: SerializationKeys.liveClass)
    aCoder.encode(completionPercentage, forKey: SerializationKeys.completionPercentage)
    aCoder.encode(availableContents, forKey: SerializationKeys.availableContents)
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
    aCoder.encode(faculty, forKey: SerializationKeys.faculty)
    aCoder.encode(discussion, forKey: SerializationKeys.discussion)
  }

}
