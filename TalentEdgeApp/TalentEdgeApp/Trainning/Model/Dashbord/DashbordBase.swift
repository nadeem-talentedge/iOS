//
//  DashbordBase.swift
//
//  Created by Vinod Kumar on 05/07/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DashbordBase: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let facultyOngoingCourse = "facultyOngoingCourse"
    static let ongoingCourse = "ongoingCourse"
    static let unreadNotification = "unread_notification"
    static let completedCourse = "completedCourse"
    static let facultyCompletedCourse = "facultyCompletedCourse"
    static let unreadMessages = "unread_messages"
    static let suggestedCourse = "suggestedCourse"
  }

  // MARK: Properties
  public var facultyOngoingCourse: [FacultyOngoingCourse]?
  public var ongoingCourse: [OngoingCourse]?
  public var unreadNotification: Int?
  public var completedCourse: [CompletedCourse]?
  public var facultyCompletedCourse: [FacultyCompletedCourse]?
  public var unreadMessages: Int?
  public var suggestedCourse: [SuggestedCourse]?

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
    if let items = json[SerializationKeys.facultyOngoingCourse].array { facultyOngoingCourse = items.map { FacultyOngoingCourse(json: $0)} }
    if let items = json[SerializationKeys.ongoingCourse].array { ongoingCourse = items.map { OngoingCourse(json: $0) } }
    unreadNotification = json[SerializationKeys.unreadNotification].int
    if let items = json[SerializationKeys.completedCourse].array { completedCourse = items.map { CompletedCourse(json: $0)} }
    if let items = json[SerializationKeys.facultyCompletedCourse].array { facultyCompletedCourse = items.map { FacultyCompletedCourse(json: $0)} }
    unreadMessages = json[SerializationKeys.unreadMessages].int
    if let items = json[SerializationKeys.suggestedCourse].array { suggestedCourse = items.map { SuggestedCourse(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = facultyOngoingCourse { dictionary[SerializationKeys.facultyOngoingCourse] = value }
    if let value = ongoingCourse { dictionary[SerializationKeys.ongoingCourse] = value.map { $0.dictionaryRepresentation() } }
    if let value = unreadNotification { dictionary[SerializationKeys.unreadNotification] = value }
    if let value = completedCourse { dictionary[SerializationKeys.completedCourse] = value }
    if let value = facultyCompletedCourse { dictionary[SerializationKeys.facultyCompletedCourse] = value }
    if let value = unreadMessages { dictionary[SerializationKeys.unreadMessages] = value }
    if let value = suggestedCourse { dictionary[SerializationKeys.suggestedCourse] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.facultyOngoingCourse = aDecoder.decodeObject(forKey: SerializationKeys.facultyOngoingCourse) as? [FacultyOngoingCourse]
    self.ongoingCourse = aDecoder.decodeObject(forKey: SerializationKeys.ongoingCourse) as? [OngoingCourse]
    self.unreadNotification = aDecoder.decodeObject(forKey: SerializationKeys.unreadNotification) as? Int
    self.completedCourse = aDecoder.decodeObject(forKey: SerializationKeys.completedCourse) as? [CompletedCourse]
    self.facultyCompletedCourse = aDecoder.decodeObject(forKey: SerializationKeys.facultyCompletedCourse) as? [FacultyCompletedCourse]
    self.unreadMessages = aDecoder.decodeObject(forKey: SerializationKeys.unreadMessages) as? Int
    self.suggestedCourse = aDecoder.decodeObject(forKey: SerializationKeys.suggestedCourse) as? [SuggestedCourse]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(facultyOngoingCourse, forKey: SerializationKeys.facultyOngoingCourse)
    aCoder.encode(ongoingCourse, forKey: SerializationKeys.ongoingCourse)
    aCoder.encode(unreadNotification, forKey: SerializationKeys.unreadNotification)
    aCoder.encode(completedCourse, forKey: SerializationKeys.completedCourse)
    aCoder.encode(facultyCompletedCourse, forKey: SerializationKeys.facultyCompletedCourse)
    aCoder.encode(unreadMessages, forKey: SerializationKeys.unreadMessages)
    aCoder.encode(suggestedCourse, forKey: SerializationKeys.suggestedCourse)
  }

}
