//
//  FacultyOngoingCourse.swift
//
//  Created by Vinod Kumar Sahu on 21/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class FacultyOngoingCourse: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let learner = "learner"
    static let totalUnreadMessageAndDoubt = "total_unread_message_and_doubt"
    static let classParticipationPercentage = "class_participation_percentage"
    static let name = "name"
    static let assignment = "assignment"
    static let shareUrl = "share_url"
    static let notStartedPercentage = "not_started_percentage"
    static let completedOn = "completed_on"
    static let courseName = "course_name"
    static let assessment = "assessment"
    static let totalModules = "total_modules"
    static let pendingPercentage = "pending_percentage"
    static let averageRatingInCourse = "average_rating_in_course"
    static let draft = "draft"
    static let id = "id"
    static let discussion = "discussion"
    static let completed = "completed"
    static let courseDuration = "course_duration"
    static let liveClassDetails = "live_class_details"
    static let completionPercentage = "completion_percentage"
    static let startedOn = "started_on"
    static let logo = "logo"
    static let instituteName = "institute_name"
  }

  // MARK: Properties
  public var learner: String?
  public var totalUnreadMessageAndDoubt: Int?
  public var classParticipationPercentage: Int?
  public var name: String?
  public var assignment: String?
  public var shareUrl: String?
  public var notStartedPercentage: Int?
  public var completedOn: String?
  public var courseName: String?
  public var assessment: String?
  public var totalModules: Int?
  public var pendingPercentage: Float?
  public var averageRatingInCourse: Int?
  public var draft: String?
  public var id: String?
  public var discussion: String?
  public var completed: String?
  public var courseDuration: String?
  public var liveClassDetails: [LiveClassDetails]?
  public var completionPercentage: Float?
  public var startedOn: String?
  public var logo: String?
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
    learner = json[SerializationKeys.learner].string
    totalUnreadMessageAndDoubt = json[SerializationKeys.totalUnreadMessageAndDoubt].int
    classParticipationPercentage = json[SerializationKeys.classParticipationPercentage].int
    name = json[SerializationKeys.name].string
    assignment = json[SerializationKeys.assignment].string
    shareUrl = json[SerializationKeys.shareUrl].string
    notStartedPercentage = json[SerializationKeys.notStartedPercentage].int
    completedOn = json[SerializationKeys.completedOn].string
    courseName = json[SerializationKeys.courseName].string
    assessment = json[SerializationKeys.assessment].string
    totalModules = json[SerializationKeys.totalModules].int
    pendingPercentage = json[SerializationKeys.pendingPercentage].float
    averageRatingInCourse = json[SerializationKeys.averageRatingInCourse].int
    draft = json[SerializationKeys.draft].string
    id = json[SerializationKeys.id].string
    discussion = json[SerializationKeys.discussion].string
    completed = json[SerializationKeys.completed].string
    courseDuration = json[SerializationKeys.courseDuration].string
    if let items = json[SerializationKeys.liveClassDetails].array { liveClassDetails = items.map { LiveClassDetails(json: $0) } }
    completionPercentage = json[SerializationKeys.completionPercentage].float
    startedOn = json[SerializationKeys.startedOn].string
    logo = json[SerializationKeys.logo].string
    instituteName = json[SerializationKeys.instituteName].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = learner { dictionary[SerializationKeys.learner] = value }
    if let value = totalUnreadMessageAndDoubt { dictionary[SerializationKeys.totalUnreadMessageAndDoubt] = value }
    if let value = classParticipationPercentage { dictionary[SerializationKeys.classParticipationPercentage] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = assignment { dictionary[SerializationKeys.assignment] = value }
    if let value = shareUrl { dictionary[SerializationKeys.shareUrl] = value }
    if let value = notStartedPercentage { dictionary[SerializationKeys.notStartedPercentage] = value }
    if let value = completedOn { dictionary[SerializationKeys.completedOn] = value }
    if let value = courseName { dictionary[SerializationKeys.courseName] = value }
    if let value = assessment { dictionary[SerializationKeys.assessment] = value }
    if let value = totalModules { dictionary[SerializationKeys.totalModules] = value }
    if let value = pendingPercentage { dictionary[SerializationKeys.pendingPercentage] = value }
    if let value = averageRatingInCourse { dictionary[SerializationKeys.averageRatingInCourse] = value }
    if let value = draft { dictionary[SerializationKeys.draft] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = discussion { dictionary[SerializationKeys.discussion] = value }
    if let value = completed { dictionary[SerializationKeys.completed] = value }
    if let value = courseDuration { dictionary[SerializationKeys.courseDuration] = value }
    if let value = liveClassDetails { dictionary[SerializationKeys.liveClassDetails] = value.map { $0.dictionaryRepresentation() } }
    if let value = completionPercentage { dictionary[SerializationKeys.completionPercentage] = value }
    if let value = startedOn { dictionary[SerializationKeys.startedOn] = value }
    if let value = logo { dictionary[SerializationKeys.logo] = value }
    if let value = instituteName { dictionary[SerializationKeys.instituteName] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.learner = aDecoder.decodeObject(forKey: SerializationKeys.learner) as? String
    self.totalUnreadMessageAndDoubt = aDecoder.decodeObject(forKey: SerializationKeys.totalUnreadMessageAndDoubt) as? Int
    self.classParticipationPercentage = aDecoder.decodeObject(forKey: SerializationKeys.classParticipationPercentage) as? Int
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.assignment = aDecoder.decodeObject(forKey: SerializationKeys.assignment) as? String
    self.shareUrl = aDecoder.decodeObject(forKey: SerializationKeys.shareUrl) as? String
    self.notStartedPercentage = aDecoder.decodeObject(forKey: SerializationKeys.notStartedPercentage) as? Int
    self.completedOn = aDecoder.decodeObject(forKey: SerializationKeys.completedOn) as? String
    self.courseName = aDecoder.decodeObject(forKey: SerializationKeys.courseName) as? String
    self.assessment = aDecoder.decodeObject(forKey: SerializationKeys.assessment) as? String
    self.totalModules = aDecoder.decodeObject(forKey: SerializationKeys.totalModules) as? Int
    self.pendingPercentage = aDecoder.decodeObject(forKey: SerializationKeys.pendingPercentage) as? Float
    self.averageRatingInCourse = aDecoder.decodeObject(forKey: SerializationKeys.averageRatingInCourse) as? Int
    self.draft = aDecoder.decodeObject(forKey: SerializationKeys.draft) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.discussion = aDecoder.decodeObject(forKey: SerializationKeys.discussion) as? String
    self.completed = aDecoder.decodeObject(forKey: SerializationKeys.completed) as? String
    self.courseDuration = aDecoder.decodeObject(forKey: SerializationKeys.courseDuration) as? String
    self.liveClassDetails = aDecoder.decodeObject(forKey: SerializationKeys.liveClassDetails) as? [LiveClassDetails]
    self.completionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.completionPercentage) as? Float
    self.startedOn = aDecoder.decodeObject(forKey: SerializationKeys.startedOn) as? String
    self.logo = aDecoder.decodeObject(forKey: SerializationKeys.logo) as? String
    self.instituteName = aDecoder.decodeObject(forKey: SerializationKeys.instituteName) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(learner, forKey: SerializationKeys.learner)
    aCoder.encode(totalUnreadMessageAndDoubt, forKey: SerializationKeys.totalUnreadMessageAndDoubt)
    aCoder.encode(classParticipationPercentage, forKey: SerializationKeys.classParticipationPercentage)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(assignment, forKey: SerializationKeys.assignment)
    aCoder.encode(shareUrl, forKey: SerializationKeys.shareUrl)
    aCoder.encode(notStartedPercentage, forKey: SerializationKeys.notStartedPercentage)
    aCoder.encode(completedOn, forKey: SerializationKeys.completedOn)
    aCoder.encode(courseName, forKey: SerializationKeys.courseName)
    aCoder.encode(assessment, forKey: SerializationKeys.assessment)
    aCoder.encode(totalModules, forKey: SerializationKeys.totalModules)
    aCoder.encode(pendingPercentage, forKey: SerializationKeys.pendingPercentage)
    aCoder.encode(averageRatingInCourse, forKey: SerializationKeys.averageRatingInCourse)
    aCoder.encode(draft, forKey: SerializationKeys.draft)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(discussion, forKey: SerializationKeys.discussion)
    aCoder.encode(completed, forKey: SerializationKeys.completed)
    aCoder.encode(courseDuration, forKey: SerializationKeys.courseDuration)
    aCoder.encode(liveClassDetails, forKey: SerializationKeys.liveClassDetails)
    aCoder.encode(completionPercentage, forKey: SerializationKeys.completionPercentage)
    aCoder.encode(startedOn, forKey: SerializationKeys.startedOn)
    aCoder.encode(logo, forKey: SerializationKeys.logo)
    aCoder.encode(instituteName, forKey: SerializationKeys.instituteName)
  }

}
