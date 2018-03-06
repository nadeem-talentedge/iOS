//
//  CompletedCourse.swift
//
//  Created by Vinod Kumar Sahu on 21/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CompletedCourse: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let learner = "learner"
    static let name = "name"
    static let shareUrl = "share_url"
    static let testimonial = "testimonial"
    static let courseName = "course_name"
    static let completedOn = "completed_on"
    static let totalModules = "total_modules"
    static let averageBatchRating = "average_batch_rating"
    static let testimonials = "Testimonials"
    static let averageRatingInCourse = "average_rating_in_course"
    static let faculty = "faculty"
    static let id = "id"
    static let bannerUrl = "banner_url"
    static let courseDuration = "course_duration"
    static let liveClass = "live_class"
    static let logo = "logo"
    static let startedOn = "started_on"
    static let instituteName = "institute_name"
    static let attendancePercentage = "attendance_percentage"
  }

  // MARK: Properties
  public var learner: Int?
  public var name: String?
  public var shareUrl: String?
  public var testimonial: String?
  public var courseName: String?
  public var completedOn: String?
  public var totalModules: String?
  public var averageBatchRating: Int?
  public var testimonials: [Any]?
  public var averageRatingInCourse: Int?
  public var faculty: [Any]?
  public var id: String?
  public var bannerUrl: String?
  public var courseDuration: String?
  public var liveClass: Int?
  public var logo: String?
  public var startedOn: String?
  public var instituteName: String?
  public var attendancePercentage: Int?

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
    name = json[SerializationKeys.name].string
    shareUrl = json[SerializationKeys.shareUrl].string
    testimonial = json[SerializationKeys.testimonial].string
    courseName = json[SerializationKeys.courseName].string
    completedOn = json[SerializationKeys.completedOn].string
    totalModules = json[SerializationKeys.totalModules].string
    averageBatchRating = json[SerializationKeys.averageBatchRating].int
    if let items = json[SerializationKeys.testimonials].array { testimonials = items.map { $0.object} }
    averageRatingInCourse = json[SerializationKeys.averageRatingInCourse].int
    if let items = json[SerializationKeys.faculty].array { faculty = items.map { $0.object} }
    id = json[SerializationKeys.id].string
    bannerUrl = json[SerializationKeys.bannerUrl].string
    courseDuration = json[SerializationKeys.courseDuration].string
    liveClass = json[SerializationKeys.liveClass].int
    logo = json[SerializationKeys.logo].string
    startedOn = json[SerializationKeys.startedOn].string
    instituteName = json[SerializationKeys.instituteName].string
    attendancePercentage = json[SerializationKeys.attendancePercentage].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = learner { dictionary[SerializationKeys.learner] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = shareUrl { dictionary[SerializationKeys.shareUrl] = value }
    if let value = testimonial { dictionary[SerializationKeys.testimonial] = value }
    if let value = courseName { dictionary[SerializationKeys.courseName] = value }
    if let value = completedOn { dictionary[SerializationKeys.completedOn] = value }
    if let value = totalModules { dictionary[SerializationKeys.totalModules] = value }
    if let value = averageBatchRating { dictionary[SerializationKeys.averageBatchRating] = value }
    if let value = testimonials { dictionary[SerializationKeys.testimonials] = value }
    if let value = averageRatingInCourse { dictionary[SerializationKeys.averageRatingInCourse] = value }
    if let value = faculty { dictionary[SerializationKeys.faculty] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = bannerUrl { dictionary[SerializationKeys.bannerUrl] = value }
    if let value = courseDuration { dictionary[SerializationKeys.courseDuration] = value }
    if let value = liveClass { dictionary[SerializationKeys.liveClass] = value }
    if let value = logo { dictionary[SerializationKeys.logo] = value }
    if let value = startedOn { dictionary[SerializationKeys.startedOn] = value }
    if let value = instituteName { dictionary[SerializationKeys.instituteName] = value }
    if let value = attendancePercentage { dictionary[SerializationKeys.attendancePercentage] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.learner = aDecoder.decodeObject(forKey: SerializationKeys.learner) as? Int
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.shareUrl = aDecoder.decodeObject(forKey: SerializationKeys.shareUrl) as? String
    self.testimonial = aDecoder.decodeObject(forKey: SerializationKeys.testimonial) as? String
    self.courseName = aDecoder.decodeObject(forKey: SerializationKeys.courseName) as? String
    self.completedOn = aDecoder.decodeObject(forKey: SerializationKeys.completedOn) as? String
    self.totalModules = aDecoder.decodeObject(forKey: SerializationKeys.totalModules) as? String
    self.averageBatchRating = aDecoder.decodeObject(forKey: SerializationKeys.averageBatchRating) as? Int
    self.testimonials = aDecoder.decodeObject(forKey: SerializationKeys.testimonials) as? [Any]
    self.averageRatingInCourse = aDecoder.decodeObject(forKey: SerializationKeys.averageRatingInCourse) as? Int
    self.faculty = aDecoder.decodeObject(forKey: SerializationKeys.faculty) as? [Any]
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.bannerUrl = aDecoder.decodeObject(forKey: SerializationKeys.bannerUrl) as? String
    self.courseDuration = aDecoder.decodeObject(forKey: SerializationKeys.courseDuration) as? String
    self.liveClass = aDecoder.decodeObject(forKey: SerializationKeys.liveClass) as? Int
    self.logo = aDecoder.decodeObject(forKey: SerializationKeys.logo) as? String
    self.startedOn = aDecoder.decodeObject(forKey: SerializationKeys.startedOn) as? String
    self.instituteName = aDecoder.decodeObject(forKey: SerializationKeys.instituteName) as? String
    self.attendancePercentage = aDecoder.decodeObject(forKey: SerializationKeys.attendancePercentage) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(learner, forKey: SerializationKeys.learner)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(shareUrl, forKey: SerializationKeys.shareUrl)
    aCoder.encode(testimonial, forKey: SerializationKeys.testimonial)
    aCoder.encode(courseName, forKey: SerializationKeys.courseName)
    aCoder.encode(completedOn, forKey: SerializationKeys.completedOn)
    aCoder.encode(totalModules, forKey: SerializationKeys.totalModules)
    aCoder.encode(averageBatchRating, forKey: SerializationKeys.averageBatchRating)
    aCoder.encode(testimonials, forKey: SerializationKeys.testimonials)
    aCoder.encode(averageRatingInCourse, forKey: SerializationKeys.averageRatingInCourse)
    aCoder.encode(faculty, forKey: SerializationKeys.faculty)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(bannerUrl, forKey: SerializationKeys.bannerUrl)
    aCoder.encode(courseDuration, forKey: SerializationKeys.courseDuration)
    aCoder.encode(liveClass, forKey: SerializationKeys.liveClass)
    aCoder.encode(logo, forKey: SerializationKeys.logo)
    aCoder.encode(startedOn, forKey: SerializationKeys.startedOn)
    aCoder.encode(instituteName, forKey: SerializationKeys.instituteName)
    aCoder.encode(attendancePercentage, forKey: SerializationKeys.attendancePercentage)
  }

}
