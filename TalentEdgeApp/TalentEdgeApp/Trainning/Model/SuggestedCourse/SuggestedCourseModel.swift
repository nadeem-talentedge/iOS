//
//  SuggestedCourseModel.swift
//
//  Created by Vinod Kumar Sahu on 17/11/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SuggestedCourseModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let courseStartDate = "course_start_date"
    static let viewUrl = "view_url"
    static let id = "id"
    static let courseImage = "course_image"
    static let postTitle = "post_title"
    static let keyPoints0 = "key_points_0"
    static let courseStartDateFomated = "course_start_date_fomated"
    static let keyPoints1 = "key_points_1"
    static let duration = "duration"
    static let courseInstitute = "course_institute"
  }

  // MARK: Properties
  public var courseStartDate: String?
  public var viewUrl: String?
  public var id: String?
  public var courseImage: String?
  public var postTitle: String?
  public var keyPoints0: String?
  public var courseStartDateFomated: String?
  public var keyPoints1: String?
  public var duration: String?
  public var courseInstitute: String?

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
    courseStartDate = json[SerializationKeys.courseStartDate].string
    viewUrl = json[SerializationKeys.viewUrl].string
    id = json[SerializationKeys.id].string
    courseImage = json[SerializationKeys.courseImage].string
    postTitle = json[SerializationKeys.postTitle].string
    keyPoints0 = json[SerializationKeys.keyPoints0].string
    courseStartDateFomated = json[SerializationKeys.courseStartDateFomated].string
    keyPoints1 = json[SerializationKeys.keyPoints1].string
    duration = json[SerializationKeys.duration].string
    courseInstitute = json[SerializationKeys.courseInstitute].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = courseStartDate { dictionary[SerializationKeys.courseStartDate] = value }
    if let value = viewUrl { dictionary[SerializationKeys.viewUrl] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = courseImage { dictionary[SerializationKeys.courseImage] = value }
    if let value = postTitle { dictionary[SerializationKeys.postTitle] = value }
    if let value = keyPoints0 { dictionary[SerializationKeys.keyPoints0] = value }
    if let value = courseStartDateFomated { dictionary[SerializationKeys.courseStartDateFomated] = value }
    if let value = keyPoints1 { dictionary[SerializationKeys.keyPoints1] = value }
    if let value = duration { dictionary[SerializationKeys.duration] = value }
    if let value = courseInstitute { dictionary[SerializationKeys.courseInstitute] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.courseStartDate = aDecoder.decodeObject(forKey: SerializationKeys.courseStartDate) as? String
    self.viewUrl = aDecoder.decodeObject(forKey: SerializationKeys.viewUrl) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.courseImage = aDecoder.decodeObject(forKey: SerializationKeys.courseImage) as? String
    self.postTitle = aDecoder.decodeObject(forKey: SerializationKeys.postTitle) as? String
    self.keyPoints0 = aDecoder.decodeObject(forKey: SerializationKeys.keyPoints0) as? String
    self.courseStartDateFomated = aDecoder.decodeObject(forKey: SerializationKeys.courseStartDateFomated) as? String
    self.keyPoints1 = aDecoder.decodeObject(forKey: SerializationKeys.keyPoints1) as? String
    self.duration = aDecoder.decodeObject(forKey: SerializationKeys.duration) as? String
    self.courseInstitute = aDecoder.decodeObject(forKey: SerializationKeys.courseInstitute) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(courseStartDate, forKey: SerializationKeys.courseStartDate)
    aCoder.encode(viewUrl, forKey: SerializationKeys.viewUrl)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(courseImage, forKey: SerializationKeys.courseImage)
    aCoder.encode(postTitle, forKey: SerializationKeys.postTitle)
    aCoder.encode(keyPoints0, forKey: SerializationKeys.keyPoints0)
    aCoder.encode(courseStartDateFomated, forKey: SerializationKeys.courseStartDateFomated)
    aCoder.encode(keyPoints1, forKey: SerializationKeys.keyPoints1)
    aCoder.encode(duration, forKey: SerializationKeys.duration)
    aCoder.encode(courseInstitute, forKey: SerializationKeys.courseInstitute)
  }

}
