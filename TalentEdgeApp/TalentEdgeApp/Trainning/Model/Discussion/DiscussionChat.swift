//
//  DiscussionChat.swift
//
//  Created by Temp  on 11/06/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DiscussionChat: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let avgRating = "avg_rating"
    static let createdBy = "created_by"
    static let descriptionValue = "description"
    static let title = "title"
    static let pic = "pic"
    static let userRole = "user_role"
    static let startDate = "start_date"
  }

  // MARK: Properties
  public var avgRating: String?
  public var createdBy: String?
  public var descriptionValue: String?
  public var title: String?
  public var pic: String?
  public var userRole: String?
  public var startDate: String?

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
    avgRating = json[SerializationKeys.avgRating].string
    createdBy = json[SerializationKeys.createdBy].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    title = json[SerializationKeys.title].string
    pic = json[SerializationKeys.pic].string
    userRole = json[SerializationKeys.userRole].string
    startDate = json[SerializationKeys.startDate].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = avgRating { dictionary[SerializationKeys.avgRating] = value }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = pic { dictionary[SerializationKeys.pic] = value }
    if let value = userRole { dictionary[SerializationKeys.userRole] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.avgRating = aDecoder.decodeObject(forKey: SerializationKeys.avgRating) as? String
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.pic = aDecoder.decodeObject(forKey: SerializationKeys.pic) as? String
    self.userRole = aDecoder.decodeObject(forKey: SerializationKeys.userRole) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(avgRating, forKey: SerializationKeys.avgRating)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(pic, forKey: SerializationKeys.pic)
    aCoder.encode(userRole, forKey: SerializationKeys.userRole)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
  }

}
