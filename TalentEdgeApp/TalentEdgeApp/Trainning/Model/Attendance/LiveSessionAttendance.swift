//
//  LiveSessionAttendance.swift
//
//  Created by Temp  on 15/06/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class LiveSessionAttendance: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let attendanceInLiveClass = "attendance_in_live_class"
    static let endDateFormated = "end_date_formated"
    static let attendanceInRecordedSession = "attendance_in_recorded_session"
    static let descriptionValue = "description"
    static let publishedBy = "published_by"
    static let startDateFormated = "start_date_formated"
    static let attendanceText = "attendance_text"
    static let contentDuration = "content_duration"
    static let moduleName = "module_name"
    static let attendanceInRecordedClass = "attendance_in_recorded_class"
    static let title = "title"
    static let contentDurationFomated = "content_duration_fomated"
    static let isDemoLiveClass = "is_demo_live_class"
    static let startDate = "start_date"
    static let endDate = "end_date"
  }

  // MARK: Properties
  public var attendanceInLiveClass: String?
  public var endDateFormated: String?
  public var attendanceInRecordedSession: String?
  public var descriptionValue: String?
  public var publishedBy: String?
  public var startDateFormated: String?
  public var attendanceText: String?
  public var contentDuration: String?
  public var moduleName: String?
  public var attendanceInRecordedClass: String?
  public var title: String?
  public var contentDurationFomated: String?
  public var isDemoLiveClass: String?
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
    attendanceInLiveClass = json[SerializationKeys.attendanceInLiveClass].string
    endDateFormated = json[SerializationKeys.endDateFormated].string
    attendanceInRecordedSession = json[SerializationKeys.attendanceInRecordedSession].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    publishedBy = json[SerializationKeys.publishedBy].string
    startDateFormated = json[SerializationKeys.startDateFormated].string
    attendanceText = json[SerializationKeys.attendanceText].string
    contentDuration = json[SerializationKeys.contentDuration].string
    moduleName = json[SerializationKeys.moduleName].string
    attendanceInRecordedClass = json[SerializationKeys.attendanceInRecordedClass].string
    title = json[SerializationKeys.title].string
    contentDurationFomated = json[SerializationKeys.contentDurationFomated].string
    isDemoLiveClass = json[SerializationKeys.isDemoLiveClass].string
    startDate = json[SerializationKeys.startDate].string
    endDate = json[SerializationKeys.endDate].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = attendanceInLiveClass { dictionary[SerializationKeys.attendanceInLiveClass] = value }
    if let value = endDateFormated { dictionary[SerializationKeys.endDateFormated] = value }
    if let value = attendanceInRecordedSession { dictionary[SerializationKeys.attendanceInRecordedSession] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = publishedBy { dictionary[SerializationKeys.publishedBy] = value }
    if let value = startDateFormated { dictionary[SerializationKeys.startDateFormated] = value }
    if let value = attendanceText { dictionary[SerializationKeys.attendanceText] = value }
    if let value = contentDuration { dictionary[SerializationKeys.contentDuration] = value }
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = attendanceInRecordedClass { dictionary[SerializationKeys.attendanceInRecordedClass] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = contentDurationFomated { dictionary[SerializationKeys.contentDurationFomated] = value }
    if let value = isDemoLiveClass { dictionary[SerializationKeys.isDemoLiveClass] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.attendanceInLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.attendanceInLiveClass) as? String
    self.endDateFormated = aDecoder.decodeObject(forKey: SerializationKeys.endDateFormated) as? String
    self.attendanceInRecordedSession = aDecoder.decodeObject(forKey: SerializationKeys.attendanceInRecordedSession) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.publishedBy = aDecoder.decodeObject(forKey: SerializationKeys.publishedBy) as? String
    self.startDateFormated = aDecoder.decodeObject(forKey: SerializationKeys.startDateFormated) as? String
    self.attendanceText = aDecoder.decodeObject(forKey: SerializationKeys.attendanceText) as? String
    self.contentDuration = aDecoder.decodeObject(forKey: SerializationKeys.contentDuration) as? String
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.attendanceInRecordedClass = aDecoder.decodeObject(forKey: SerializationKeys.attendanceInRecordedClass) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.contentDurationFomated = aDecoder.decodeObject(forKey: SerializationKeys.contentDurationFomated) as? String
    self.isDemoLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.isDemoLiveClass) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(attendanceInLiveClass, forKey: SerializationKeys.attendanceInLiveClass)
    aCoder.encode(endDateFormated, forKey: SerializationKeys.endDateFormated)
    aCoder.encode(attendanceInRecordedSession, forKey: SerializationKeys.attendanceInRecordedSession)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(publishedBy, forKey: SerializationKeys.publishedBy)
    aCoder.encode(startDateFormated, forKey: SerializationKeys.startDateFormated)
    aCoder.encode(attendanceText, forKey: SerializationKeys.attendanceText)
    aCoder.encode(contentDuration, forKey: SerializationKeys.contentDuration)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(attendanceInRecordedClass, forKey: SerializationKeys.attendanceInRecordedClass)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(contentDurationFomated, forKey: SerializationKeys.contentDurationFomated)
    aCoder.encode(isDemoLiveClass, forKey: SerializationKeys.isDemoLiveClass)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
  }

}
