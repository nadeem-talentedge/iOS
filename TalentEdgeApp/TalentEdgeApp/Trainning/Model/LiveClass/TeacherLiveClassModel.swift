//
//  TeacherLiveClassModel.swift
//
//  Created by Vinod Kumar on 23/09/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TeacherLiveClassModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let totalInviteesAttendedInLiveClass = "total_invitees_attended_in_live_class"
    static let recordedSessionUrlSynced = "recorded_session_url_synced"
    static let totalInviteesInLiveClass = "total_invitees_in_live_class"
    static let attendanceInRecordedSession = "attendance_in_recorded_session"
    static let startDateFormatted = "start_date_formatted"
    static let endDateFormatted = "end_date_formatted"
    static let participationPercentageInRecordedClass = "participation_percentage_in_recorded_class"
    static let descriptionValue = "description"
    static let avgTimeLiveClassAttendedFormatted = "avg_time_live_class_attended_formatted"
    static let contentDuration = "content_duration"
    static let moduleName = "module_name"
    static let id = "id"
    static let totalInviteesAttendedInRecordedClass = "total_invitees_attended_in_recorded_class"
    static let participationPercentageInLiveClass = "participation_percentage_in_live_class"
    static let title = "title"
    static let contentDurationFormatted = "content_duration_formatted"
    static let isDemoLiveClass = "is_demo_live_class"
    static let startDate = "start_date"
    static let endDate = "end_date"
    static let avgTimeLiveClassAttended = "avg_time_live_class_attended"
  }

  // MARK: Properties
  public var totalInviteesAttendedInLiveClass: String?
  public var recordedSessionUrlSynced: String?
  public var totalInviteesInLiveClass: String?
  public var attendanceInRecordedSession: String?
  public var startDateFormatted: String?
  public var endDateFormatted: String?
  public var participationPercentageInRecordedClass: String?
  public var descriptionValue: String?
  public var avgTimeLiveClassAttendedFormatted: String?
  public var contentDuration: String?
  public var moduleName: String?
  public var id: String?
  public var totalInviteesAttendedInRecordedClass: String?
  public var participationPercentageInLiveClass: String?
  public var title: String?
  public var contentDurationFormatted: String?
  public var isDemoLiveClass: String?
  public var startDate: String?
  public var endDate: String?
  public var avgTimeLiveClassAttended: String?

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
    totalInviteesAttendedInLiveClass = json[SerializationKeys.totalInviteesAttendedInLiveClass].string
    recordedSessionUrlSynced = json[SerializationKeys.recordedSessionUrlSynced].string
    totalInviteesInLiveClass = json[SerializationKeys.totalInviteesInLiveClass].string
    attendanceInRecordedSession = json[SerializationKeys.attendanceInRecordedSession].string
    startDateFormatted = json[SerializationKeys.startDateFormatted].string
    endDateFormatted = json[SerializationKeys.endDateFormatted].string
    participationPercentageInRecordedClass = json[SerializationKeys.participationPercentageInRecordedClass].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    avgTimeLiveClassAttendedFormatted = json[SerializationKeys.avgTimeLiveClassAttendedFormatted].string
    contentDuration = json[SerializationKeys.contentDuration].string
    moduleName = json[SerializationKeys.moduleName].string
    id = json[SerializationKeys.id].string
    totalInviteesAttendedInRecordedClass = json[SerializationKeys.totalInviteesAttendedInRecordedClass].string
    participationPercentageInLiveClass = json[SerializationKeys.participationPercentageInLiveClass].string
    title = json[SerializationKeys.title].string
    contentDurationFormatted = json[SerializationKeys.contentDurationFormatted].string
    isDemoLiveClass = json[SerializationKeys.isDemoLiveClass].string
    startDate = json[SerializationKeys.startDate].string
    endDate = json[SerializationKeys.endDate].string
    avgTimeLiveClassAttended = json[SerializationKeys.avgTimeLiveClassAttended].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = totalInviteesAttendedInLiveClass { dictionary[SerializationKeys.totalInviteesAttendedInLiveClass] = value }
    if let value = recordedSessionUrlSynced { dictionary[SerializationKeys.recordedSessionUrlSynced] = value }
    if let value = totalInviteesInLiveClass { dictionary[SerializationKeys.totalInviteesInLiveClass] = value }
    if let value = attendanceInRecordedSession { dictionary[SerializationKeys.attendanceInRecordedSession] = value }
    if let value = startDateFormatted { dictionary[SerializationKeys.startDateFormatted] = value }
    if let value = endDateFormatted { dictionary[SerializationKeys.endDateFormatted] = value }
    if let value = participationPercentageInRecordedClass { dictionary[SerializationKeys.participationPercentageInRecordedClass] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = avgTimeLiveClassAttendedFormatted { dictionary[SerializationKeys.avgTimeLiveClassAttendedFormatted] = value }
    if let value = contentDuration { dictionary[SerializationKeys.contentDuration] = value }
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = totalInviteesAttendedInRecordedClass { dictionary[SerializationKeys.totalInviteesAttendedInRecordedClass] = value }
    if let value = participationPercentageInLiveClass { dictionary[SerializationKeys.participationPercentageInLiveClass] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = contentDurationFormatted { dictionary[SerializationKeys.contentDurationFormatted] = value }
    if let value = isDemoLiveClass { dictionary[SerializationKeys.isDemoLiveClass] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    if let value = avgTimeLiveClassAttended { dictionary[SerializationKeys.avgTimeLiveClassAttended] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.totalInviteesAttendedInLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.totalInviteesAttendedInLiveClass) as? String
    self.recordedSessionUrlSynced = aDecoder.decodeObject(forKey: SerializationKeys.recordedSessionUrlSynced) as? String
    self.totalInviteesInLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.totalInviteesInLiveClass) as? String
    self.attendanceInRecordedSession = aDecoder.decodeObject(forKey: SerializationKeys.attendanceInRecordedSession) as? String
    self.startDateFormatted = aDecoder.decodeObject(forKey: SerializationKeys.startDateFormatted) as? String
    self.endDateFormatted = aDecoder.decodeObject(forKey: SerializationKeys.endDateFormatted) as? String
    self.participationPercentageInRecordedClass = aDecoder.decodeObject(forKey: SerializationKeys.participationPercentageInRecordedClass) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.avgTimeLiveClassAttendedFormatted = aDecoder.decodeObject(forKey: SerializationKeys.avgTimeLiveClassAttendedFormatted) as? String
    self.contentDuration = aDecoder.decodeObject(forKey: SerializationKeys.contentDuration) as? String
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.totalInviteesAttendedInRecordedClass = aDecoder.decodeObject(forKey: SerializationKeys.totalInviteesAttendedInRecordedClass) as? String
    self.participationPercentageInLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.participationPercentageInLiveClass) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.contentDurationFormatted = aDecoder.decodeObject(forKey: SerializationKeys.contentDurationFormatted) as? String
    self.isDemoLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.isDemoLiveClass) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
    self.avgTimeLiveClassAttended = aDecoder.decodeObject(forKey: SerializationKeys.avgTimeLiveClassAttended) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(totalInviteesAttendedInLiveClass, forKey: SerializationKeys.totalInviteesAttendedInLiveClass)
    aCoder.encode(recordedSessionUrlSynced, forKey: SerializationKeys.recordedSessionUrlSynced)
    aCoder.encode(totalInviteesInLiveClass, forKey: SerializationKeys.totalInviteesInLiveClass)
    aCoder.encode(attendanceInRecordedSession, forKey: SerializationKeys.attendanceInRecordedSession)
    aCoder.encode(startDateFormatted, forKey: SerializationKeys.startDateFormatted)
    aCoder.encode(endDateFormatted, forKey: SerializationKeys.endDateFormatted)
    aCoder.encode(participationPercentageInRecordedClass, forKey: SerializationKeys.participationPercentageInRecordedClass)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(avgTimeLiveClassAttendedFormatted, forKey: SerializationKeys.avgTimeLiveClassAttendedFormatted)
    aCoder.encode(contentDuration, forKey: SerializationKeys.contentDuration)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(totalInviteesAttendedInRecordedClass, forKey: SerializationKeys.totalInviteesAttendedInRecordedClass)
    aCoder.encode(participationPercentageInLiveClass, forKey: SerializationKeys.participationPercentageInLiveClass)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(contentDurationFormatted, forKey: SerializationKeys.contentDurationFormatted)
    aCoder.encode(isDemoLiveClass, forKey: SerializationKeys.isDemoLiveClass)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
    aCoder.encode(avgTimeLiveClassAttended, forKey: SerializationKeys.avgTimeLiveClassAttended)
  }

}
