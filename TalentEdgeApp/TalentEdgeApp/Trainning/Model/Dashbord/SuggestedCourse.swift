//
//  SuggestedCourse.swift
//
//  Created by Vinod Kumar on 05/07/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SuggestedCourse: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let totalBatchRating = "total_batch_rating"
    static let courseName = "course_name"
    static let postTitle = "post_title"
    static let courseStartDateFomated = "course_start_date_fomated"
    static let averageBatchRating = "average_batch_rating"
    static let averageRatingInCourse = "average_rating_in_course"
    static let faculty = "faculty"
    static let id = "id"
    static let isApplied = "is_applied"
    static let courseImage = "course_image"
    static let courseEndDateFomated = "course_end_date_fomated"
    static let startDate = "start_date"
    static let endDate = "end_date"
  }

  // MARK: Properties
  public var totalBatchRating: Int?
  public var courseName: String?
  public var postTitle: String?
  public var courseStartDateFomated: String?
  public var averageBatchRating: Int?
  public var averageRatingInCourse: Int?
  public var faculty: [Faculty]?
  public var id: String?
  public var isApplied: Int?
  public var courseImage: String?
  public var courseEndDateFomated: String?
  public var startDate: String?
  public var endDate: String?

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
    totalBatchRating = json[SerializationKeys.totalBatchRating].int
    courseName = json[SerializationKeys.courseName].string
    postTitle = json[SerializationKeys.postTitle].string
    courseStartDateFomated = json[SerializationKeys.courseStartDateFomated].string
    averageBatchRating = json[SerializationKeys.averageBatchRating].int
    averageRatingInCourse = json[SerializationKeys.averageRatingInCourse].int
    if let items = json[SerializationKeys.faculty].array { faculty = items.map { Faculty(json: $0) } }
    id = json[SerializationKeys.id].string
    isApplied = json[SerializationKeys.isApplied].int
    courseImage = json[SerializationKeys.courseImage].string
    courseEndDateFomated = json[SerializationKeys.courseEndDateFomated].string
    startDate = json[SerializationKeys.startDate].string
    endDate = json[SerializationKeys.endDate].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = totalBatchRating { dictionary[SerializationKeys.totalBatchRating] = value }
    if let value = courseName { dictionary[SerializationKeys.courseName] = value }
    if let value = postTitle { dictionary[SerializationKeys.postTitle] = value }
    if let value = courseStartDateFomated { dictionary[SerializationKeys.courseStartDateFomated] = value }
    if let value = averageBatchRating { dictionary[SerializationKeys.averageBatchRating] = value }
    if let value = averageRatingInCourse { dictionary[SerializationKeys.averageRatingInCourse] = value }
    if let value = faculty { dictionary[SerializationKeys.faculty] = value.map { $0.dictionaryRepresentation() } }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = isApplied { dictionary[SerializationKeys.isApplied] = value }
    if let value = courseImage { dictionary[SerializationKeys.courseImage] = value }
    if let value = courseEndDateFomated { dictionary[SerializationKeys.courseEndDateFomated] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.totalBatchRating = aDecoder.decodeObject(forKey: SerializationKeys.totalBatchRating) as? Int
    self.courseName = aDecoder.decodeObject(forKey: SerializationKeys.courseName) as? String
    self.postTitle = aDecoder.decodeObject(forKey: SerializationKeys.postTitle) as? String
    self.courseStartDateFomated = aDecoder.decodeObject(forKey: SerializationKeys.courseStartDateFomated) as? String
    self.averageBatchRating = aDecoder.decodeObject(forKey: SerializationKeys.averageBatchRating) as? Int
    self.averageRatingInCourse = aDecoder.decodeObject(forKey: SerializationKeys.averageRatingInCourse) as? Int
    self.faculty = aDecoder.decodeObject(forKey: SerializationKeys.faculty) as? [Faculty]
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.isApplied = aDecoder.decodeObject(forKey: SerializationKeys.isApplied) as? Int
    self.courseImage = aDecoder.decodeObject(forKey: SerializationKeys.courseImage) as? String
    self.courseEndDateFomated = aDecoder.decodeObject(forKey: SerializationKeys.courseEndDateFomated) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(totalBatchRating, forKey: SerializationKeys.totalBatchRating)
    aCoder.encode(courseName, forKey: SerializationKeys.courseName)
    aCoder.encode(postTitle, forKey: SerializationKeys.postTitle)
    aCoder.encode(courseStartDateFomated, forKey: SerializationKeys.courseStartDateFomated)
    aCoder.encode(averageBatchRating, forKey: SerializationKeys.averageBatchRating)
    aCoder.encode(averageRatingInCourse, forKey: SerializationKeys.averageRatingInCourse)
    aCoder.encode(faculty, forKey: SerializationKeys.faculty)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(isApplied, forKey: SerializationKeys.isApplied)
    aCoder.encode(courseImage, forKey: SerializationKeys.courseImage)
    aCoder.encode(courseEndDateFomated, forKey: SerializationKeys.courseEndDateFomated)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
  }

}
