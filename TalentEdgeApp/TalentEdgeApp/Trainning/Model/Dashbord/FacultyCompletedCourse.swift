//
//  FacultyCompletedCourse.swift
//
//  Created by Vinod Kumar Sahu on 21/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class FacultyCompletedCourse: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let learner = "learner"
    static let classParticipationPercentage = "class_participation_percentage"
    static let notStartedPercentage = "not_started_percentage"
    static let completedOn = "completed_on"
    static let averageBatchRating = "average_batch_rating"
    static let testimonials = "Testimonials"
    static let id = "id"
    static let completed = "completed"
    static let courseDuration = "course_duration"
    static let liveClass = "live_class"
    static let completionPercentage = "completion_percentage"
    static let startedOn = "started_on"
    static let logo = "logo"
    static let instituteName = "institute_name"
    static let totalUnreadMessageAndDoubt = "total_unread_message_and_doubt"
    static let name = "name"
    static let assignment = "assignment"
    static let shareUrl = "share_url"
    static let testimonial = "testimonial"
    static let courseName = "course_name"
    static let totalModules = "total_modules"
    static let assessment = "assessment"
    static let pendingPercentage = "pending_percentage"
    static let averageRatingInCourse = "average_rating_in_course"
    static let draft = "draft"
    static let discussion = "discussion"
  }

  // MARK: Properties
  public var learner: String?
  public var classParticipationPercentage: Int?
  public var notStartedPercentage: Int?
  public var completedOn: String?
  public var averageBatchRating: Int?
  public var testimonials: [Testimonials]?
  public var id: String?
  public var completed: String?
  public var courseDuration: String?
  public var liveClass: String?
  public var completionPercentage: Int?
  public var startedOn: String?
  public var logo: String?
  public var instituteName: String?
  public var totalUnreadMessageAndDoubt: Int?
  public var name: String?
  public var assignment: String?
  public var shareUrl: String?
  public var testimonial: String?
  public var courseName: String?
  public var totalModules: Int?
  public var assessment: String?
  public var pendingPercentage: Int?
  public var averageRatingInCourse: Int?
  public var draft: Int?
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
    classParticipationPercentage = json[SerializationKeys.classParticipationPercentage].int
    notStartedPercentage = json[SerializationKeys.notStartedPercentage].int
    completedOn = json[SerializationKeys.completedOn].string
    averageBatchRating = json[SerializationKeys.averageBatchRating].int
    if let items = json[SerializationKeys.testimonials].array { testimonials = items.map { Testimonials(json: $0) } }
    id = json[SerializationKeys.id].string
    completed = json[SerializationKeys.completed].string
    courseDuration = json[SerializationKeys.courseDuration].string
    liveClass = json[SerializationKeys.liveClass].string
    completionPercentage = json[SerializationKeys.completionPercentage].int
    startedOn = json[SerializationKeys.startedOn].string
    logo = json[SerializationKeys.logo].string
    instituteName = json[SerializationKeys.instituteName].string
    totalUnreadMessageAndDoubt = json[SerializationKeys.totalUnreadMessageAndDoubt].int
    name = json[SerializationKeys.name].string
    assignment = json[SerializationKeys.assignment].string
    shareUrl = json[SerializationKeys.shareUrl].string
    testimonial = json[SerializationKeys.testimonial].string
    courseName = json[SerializationKeys.courseName].string
    totalModules = json[SerializationKeys.totalModules].int
    assessment = json[SerializationKeys.assessment].string
    pendingPercentage = json[SerializationKeys.pendingPercentage].int
    averageRatingInCourse = json[SerializationKeys.averageRatingInCourse].int
    draft = json[SerializationKeys.draft].int
    discussion = json[SerializationKeys.discussion].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = learner { dictionary[SerializationKeys.learner] = value }
    if let value = classParticipationPercentage { dictionary[SerializationKeys.classParticipationPercentage] = value }
    if let value = notStartedPercentage { dictionary[SerializationKeys.notStartedPercentage] = value }
    if let value = completedOn { dictionary[SerializationKeys.completedOn] = value }
    if let value = averageBatchRating { dictionary[SerializationKeys.averageBatchRating] = value }
    if let value = testimonials { dictionary[SerializationKeys.testimonials] = value.map { $0.dictionaryRepresentation() } }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = completed { dictionary[SerializationKeys.completed] = value }
    if let value = courseDuration { dictionary[SerializationKeys.courseDuration] = value }
    if let value = liveClass { dictionary[SerializationKeys.liveClass] = value }
    if let value = completionPercentage { dictionary[SerializationKeys.completionPercentage] = value }
    if let value = startedOn { dictionary[SerializationKeys.startedOn] = value }
    if let value = logo { dictionary[SerializationKeys.logo] = value }
    if let value = instituteName { dictionary[SerializationKeys.instituteName] = value }
    if let value = totalUnreadMessageAndDoubt { dictionary[SerializationKeys.totalUnreadMessageAndDoubt] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = assignment { dictionary[SerializationKeys.assignment] = value }
    if let value = shareUrl { dictionary[SerializationKeys.shareUrl] = value }
    if let value = testimonial { dictionary[SerializationKeys.testimonial] = value }
    if let value = courseName { dictionary[SerializationKeys.courseName] = value }
    if let value = totalModules { dictionary[SerializationKeys.totalModules] = value }
    if let value = assessment { dictionary[SerializationKeys.assessment] = value }
    if let value = pendingPercentage { dictionary[SerializationKeys.pendingPercentage] = value }
    if let value = averageRatingInCourse { dictionary[SerializationKeys.averageRatingInCourse] = value }
    if let value = draft { dictionary[SerializationKeys.draft] = value }
    if let value = discussion { dictionary[SerializationKeys.discussion] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.learner = aDecoder.decodeObject(forKey: SerializationKeys.learner) as? String
    self.classParticipationPercentage = aDecoder.decodeObject(forKey: SerializationKeys.classParticipationPercentage) as? Int
    self.notStartedPercentage = aDecoder.decodeObject(forKey: SerializationKeys.notStartedPercentage) as? Int
    self.completedOn = aDecoder.decodeObject(forKey: SerializationKeys.completedOn) as? String
    self.averageBatchRating = aDecoder.decodeObject(forKey: SerializationKeys.averageBatchRating) as? Int
    self.testimonials = aDecoder.decodeObject(forKey: SerializationKeys.testimonials) as? [Testimonials]
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.completed = aDecoder.decodeObject(forKey: SerializationKeys.completed) as? String
    self.courseDuration = aDecoder.decodeObject(forKey: SerializationKeys.courseDuration) as? String
    self.liveClass = aDecoder.decodeObject(forKey: SerializationKeys.liveClass) as? String
    self.completionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.completionPercentage) as? Int
    self.startedOn = aDecoder.decodeObject(forKey: SerializationKeys.startedOn) as? String
    self.logo = aDecoder.decodeObject(forKey: SerializationKeys.logo) as? String
    self.instituteName = aDecoder.decodeObject(forKey: SerializationKeys.instituteName) as? String
    self.totalUnreadMessageAndDoubt = aDecoder.decodeObject(forKey: SerializationKeys.totalUnreadMessageAndDoubt) as? Int
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.assignment = aDecoder.decodeObject(forKey: SerializationKeys.assignment) as? String
    self.shareUrl = aDecoder.decodeObject(forKey: SerializationKeys.shareUrl) as? String
    self.testimonial = aDecoder.decodeObject(forKey: SerializationKeys.testimonial) as? String
    self.courseName = aDecoder.decodeObject(forKey: SerializationKeys.courseName) as? String
    self.totalModules = aDecoder.decodeObject(forKey: SerializationKeys.totalModules) as? Int
    self.assessment = aDecoder.decodeObject(forKey: SerializationKeys.assessment) as? String
    self.pendingPercentage = aDecoder.decodeObject(forKey: SerializationKeys.pendingPercentage) as? Int
    self.averageRatingInCourse = aDecoder.decodeObject(forKey: SerializationKeys.averageRatingInCourse) as? Int
    self.draft = aDecoder.decodeObject(forKey: SerializationKeys.draft) as? Int
    self.discussion = aDecoder.decodeObject(forKey: SerializationKeys.discussion) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(learner, forKey: SerializationKeys.learner)
    aCoder.encode(classParticipationPercentage, forKey: SerializationKeys.classParticipationPercentage)
    aCoder.encode(notStartedPercentage, forKey: SerializationKeys.notStartedPercentage)
    aCoder.encode(completedOn, forKey: SerializationKeys.completedOn)
    aCoder.encode(averageBatchRating, forKey: SerializationKeys.averageBatchRating)
    aCoder.encode(testimonials, forKey: SerializationKeys.testimonials)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(completed, forKey: SerializationKeys.completed)
    aCoder.encode(courseDuration, forKey: SerializationKeys.courseDuration)
    aCoder.encode(liveClass, forKey: SerializationKeys.liveClass)
    aCoder.encode(completionPercentage, forKey: SerializationKeys.completionPercentage)
    aCoder.encode(startedOn, forKey: SerializationKeys.startedOn)
    aCoder.encode(logo, forKey: SerializationKeys.logo)
    aCoder.encode(instituteName, forKey: SerializationKeys.instituteName)
    aCoder.encode(totalUnreadMessageAndDoubt, forKey: SerializationKeys.totalUnreadMessageAndDoubt)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(assignment, forKey: SerializationKeys.assignment)
    aCoder.encode(shareUrl, forKey: SerializationKeys.shareUrl)
    aCoder.encode(testimonial, forKey: SerializationKeys.testimonial)
    aCoder.encode(courseName, forKey: SerializationKeys.courseName)
    aCoder.encode(totalModules, forKey: SerializationKeys.totalModules)
    aCoder.encode(assessment, forKey: SerializationKeys.assessment)
    aCoder.encode(pendingPercentage, forKey: SerializationKeys.pendingPercentage)
    aCoder.encode(averageRatingInCourse, forKey: SerializationKeys.averageRatingInCourse)
    aCoder.encode(draft, forKey: SerializationKeys.draft)
    aCoder.encode(discussion, forKey: SerializationKeys.discussion)
  }

}
