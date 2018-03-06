//
//  TeacherAttendenceModel.swift
//
//  Created by Vinod Kumar Sahu on 23/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TeacherAttendenceModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let totalInviteesAttendedInLiveClass = "total_invitees_attended_in_live_class"
    static let totalInviteesInLiveClass = "total_invitees_in_live_class"
    static let contentDurationFormated = "content_duration_formated"
    static let attendanceInRecordedSession = "attendance_in_recorded_session"
    static let participationPercentageInRecordedClass = "participation_percentage_in_recorded_class"
    static let startDateFormated = "start_date_formated"
    static let contentDuration = "content_duration"
    static let moduleName = "module_name"
    static let id = "id"
    static let totalInviteesAttendedInRecordedClass = "total_invitees_attended_in_recorded_class"
    static let participationPercentageInLiveClass = "participation_percentage_in_live_class"
    static let title = "title"
    static let averagePercentageInLiveClass = "average_percentage_in_live_class"
    static let recordedSessionAttendeeInfoSection = "recorded_session_attendee_info_section"
    static let startDate = "start_date"
    static let endDate = "end_date"
  }

  // MARK: Properties
  public var totalInviteesAttendedInLiveClass: String?
  public var totalInviteesInLiveClass: String?
  public var contentDurationFormated: String?
  public var attendanceInRecordedSession: Bool? = false
  public var participationPercentageInRecordedClass: String?
  public var startDateFormated: String?
  public var contentDuration: String?
  public var moduleName: String?
  public var id: String?
  public var totalInviteesAttendedInRecordedClass: String?
  public var participationPercentageInLiveClass: String?
  public var title: String?
  public var averagePercentageInLiveClass: Int?
  public var recordedSessionAttendeeInfoSection: String?
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
    totalInviteesAttendedInLiveClass = json[SerializationKeys.totalInviteesAttendedInLiveClass].string
    totalInviteesInLiveClass = json[SerializationKeys.totalInviteesInLiveClass].string
    contentDurationFormated = json[SerializationKeys.contentDurationFormated].string
    attendanceInRecordedSession = json[SerializationKeys.attendanceInRecordedSession].boolValue
    participationPercentageInRecordedClass = json[SerializationKeys.participationPercentageInRecordedClass].string
    startDateFormated = json[SerializationKeys.startDateFormated].string
    contentDuration = json[SerializationKeys.contentDuration].string
    moduleName = json[SerializationKeys.moduleName].string
    id = json[SerializationKeys.id].string
    totalInviteesAttendedInRecordedClass = json[SerializationKeys.totalInviteesAttendedInRecordedClass].string
    participationPercentageInLiveClass = json[SerializationKeys.participationPercentageInLiveClass].string
    title = json[SerializationKeys.title].string
    averagePercentageInLiveClass = json[SerializationKeys.averagePercentageInLiveClass].int
    recordedSessionAttendeeInfoSection = json[SerializationKeys.recordedSessionAttendeeInfoSection].string
    startDate = json[SerializationKeys.startDate].string
    endDate = json[SerializationKeys.endDate].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = totalInviteesAttendedInLiveClass { dictionary[SerializationKeys.totalInviteesAttendedInLiveClass] = value }
    if let value = totalInviteesInLiveClass { dictionary[SerializationKeys.totalInviteesInLiveClass] = value }
    if let value = contentDurationFormated { dictionary[SerializationKeys.contentDurationFormated] = value }
    dictionary[SerializationKeys.attendanceInRecordedSession] = attendanceInRecordedSession
    if let value = participationPercentageInRecordedClass { dictionary[SerializationKeys.participationPercentageInRecordedClass] = value }
    if let value = startDateFormated { dictionary[SerializationKeys.startDateFormated] = value }
    if let value = contentDuration { dictionary[SerializationKeys.contentDuration] = value }
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = totalInviteesAttendedInRecordedClass { dictionary[SerializationKeys.totalInviteesAttendedInRecordedClass] = value }
    if let value = participationPercentageInLiveClass { dictionary[SerializationKeys.participationPercentageInLiveClass] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = averagePercentageInLiveClass { dictionary[SerializationKeys.averagePercentageInLiveClass] = value }
    if let value = recordedSessionAttendeeInfoSection { dictionary[SerializationKeys.recordedSessionAttendeeInfoSection] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.totalInviteesAttendedInLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.totalInviteesAttendedInLiveClass) as? String
    self.totalInviteesInLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.totalInviteesInLiveClass) as? String
    self.contentDurationFormated = aDecoder.decodeObject(forKey: SerializationKeys.contentDurationFormated) as? String
    self.attendanceInRecordedSession = aDecoder.decodeBool(forKey: SerializationKeys.attendanceInRecordedSession)
    self.participationPercentageInRecordedClass = aDecoder.decodeObject(forKey: SerializationKeys.participationPercentageInRecordedClass) as? String
    self.startDateFormated = aDecoder.decodeObject(forKey: SerializationKeys.startDateFormated) as? String
    self.contentDuration = aDecoder.decodeObject(forKey: SerializationKeys.contentDuration) as? String
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.totalInviteesAttendedInRecordedClass = aDecoder.decodeObject(forKey: SerializationKeys.totalInviteesAttendedInRecordedClass) as? String
    self.participationPercentageInLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.participationPercentageInLiveClass) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.averagePercentageInLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.averagePercentageInLiveClass) as? Int
    self.recordedSessionAttendeeInfoSection = aDecoder.decodeObject(forKey: SerializationKeys.recordedSessionAttendeeInfoSection) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(totalInviteesAttendedInLiveClass, forKey: SerializationKeys.totalInviteesAttendedInLiveClass)
    aCoder.encode(totalInviteesInLiveClass, forKey: SerializationKeys.totalInviteesInLiveClass)
    aCoder.encode(contentDurationFormated, forKey: SerializationKeys.contentDurationFormated)
    aCoder.encode(attendanceInRecordedSession, forKey: SerializationKeys.attendanceInRecordedSession)
    aCoder.encode(participationPercentageInRecordedClass, forKey: SerializationKeys.participationPercentageInRecordedClass)
    aCoder.encode(startDateFormated, forKey: SerializationKeys.startDateFormated)
    aCoder.encode(contentDuration, forKey: SerializationKeys.contentDuration)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(totalInviteesAttendedInRecordedClass, forKey: SerializationKeys.totalInviteesAttendedInRecordedClass)
    aCoder.encode(participationPercentageInLiveClass, forKey: SerializationKeys.participationPercentageInLiveClass)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(averagePercentageInLiveClass, forKey: SerializationKeys.averagePercentageInLiveClass)
    aCoder.encode(recordedSessionAttendeeInfoSection, forKey: SerializationKeys.recordedSessionAttendeeInfoSection)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
  }

}
