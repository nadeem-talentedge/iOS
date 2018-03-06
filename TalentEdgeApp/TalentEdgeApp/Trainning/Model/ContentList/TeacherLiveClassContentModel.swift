//
//  TeacherLiveClassContentModel.swift
//
//  Created by Vinod Kumar on 01/10/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TeacherLiveClassContentModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let totalInviteesAttendedInLiveClass = "total_invitees_attended_in_live_class"
    static let action = "action"
    static let totalInviteesInLiveClass = "total_invitees_in_live_class"
    static let dateValue = "date_value"
    static let contentDurationFormated = "content_duration_formated"
    static let attendanceInRecordedSession = "attendance_in_recorded_session"
    static let startDateFormatted = "start_date_formatted"
    static let endDateFormatted = "end_date_formatted"
    static let contentTypeId = "content_type_id"
    static let canView = "can_view"
    static let publishedByLabel = "published_by_label"
    static let contentDuration = "content_duration"
    static let id = "id"
    static let allowEdit = "allow_edit"
    static let title = "title"
    static let participationPercentageInLiveClass = "participation_percentage_in_live_class"
    static let moduleId = "module_id"
    static let startDate = "start_date"
    static let endDate = "end_date"
    static let publishedByValue = "published_by_value"
    static let dateLabel = "date_label"
    static let allowView = "allow_view"
    static let liveClassType = "live_class_type"
    static let descriptionValue = "description"
    static let participationPercentageInRecordedClass = "participation_percentage_in_recorded_class"
    static let moduleName = "module_name"
    static let totalInviteesAttendedInRecordedClass = "total_invitees_attended_in_recorded_class"
  }

  // MARK: Properties
  public var totalInviteesAttendedInLiveClass: String?
  public var action: String?
  public var totalInviteesInLiveClass: String?
  public var dateValue: String?
  public var contentDurationFormated: String?
  public var attendanceInRecordedSession: String?
  public var startDateFormatted: String?
  public var endDateFormatted: String?
  public var contentTypeId: String?
  public var canView: Int?
  public var publishedByLabel: String?
  public var contentDuration: String?
  public var id: String?
  public var allowEdit: Int?
  public var title: String?
  public var participationPercentageInLiveClass: String?
  public var moduleId: String?
  public var startDate: String?
  public var endDate: String?
  public var publishedByValue: String?
  public var dateLabel: String?
  public var allowView: Int?
  public var liveClassType: String?
  public var descriptionValue: String?
  public var participationPercentageInRecordedClass: String?
  public var moduleName: String?
  public var totalInviteesAttendedInRecordedClass: String?

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
    action = json[SerializationKeys.action].string
    totalInviteesInLiveClass = json[SerializationKeys.totalInviteesInLiveClass].string
    dateValue = json[SerializationKeys.dateValue].string
    contentDurationFormated = json[SerializationKeys.contentDurationFormated].string
    attendanceInRecordedSession = json[SerializationKeys.attendanceInRecordedSession].string
    startDateFormatted = json[SerializationKeys.startDateFormatted].string
    endDateFormatted = json[SerializationKeys.endDateFormatted].string
    contentTypeId = json[SerializationKeys.contentTypeId].string
    canView = json[SerializationKeys.canView].int
    publishedByLabel = json[SerializationKeys.publishedByLabel].string
    contentDuration = json[SerializationKeys.contentDuration].string
    id = json[SerializationKeys.id].string
    allowEdit = json[SerializationKeys.allowEdit].int
    title = json[SerializationKeys.title].string
    participationPercentageInLiveClass = json[SerializationKeys.participationPercentageInLiveClass].string
    moduleId = json[SerializationKeys.moduleId].string
    startDate = json[SerializationKeys.startDate].string
    endDate = json[SerializationKeys.endDate].string
    publishedByValue = json[SerializationKeys.publishedByValue].string
    dateLabel = json[SerializationKeys.dateLabel].string
    allowView = json[SerializationKeys.allowView].int
    liveClassType = json[SerializationKeys.liveClassType].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    participationPercentageInRecordedClass = json[SerializationKeys.participationPercentageInRecordedClass].string
    moduleName = json[SerializationKeys.moduleName].string
    totalInviteesAttendedInRecordedClass = json[SerializationKeys.totalInviteesAttendedInRecordedClass].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = totalInviteesAttendedInLiveClass { dictionary[SerializationKeys.totalInviteesAttendedInLiveClass] = value }
    if let value = action { dictionary[SerializationKeys.action] = value }
    if let value = totalInviteesInLiveClass { dictionary[SerializationKeys.totalInviteesInLiveClass] = value }
    if let value = dateValue { dictionary[SerializationKeys.dateValue] = value }
    if let value = contentDurationFormated { dictionary[SerializationKeys.contentDurationFormated] = value }
    if let value = attendanceInRecordedSession { dictionary[SerializationKeys.attendanceInRecordedSession] = value }
    if let value = startDateFormatted { dictionary[SerializationKeys.startDateFormatted] = value }
    if let value = endDateFormatted { dictionary[SerializationKeys.endDateFormatted] = value }
    if let value = contentTypeId { dictionary[SerializationKeys.contentTypeId] = value }
    if let value = canView { dictionary[SerializationKeys.canView] = value }
    if let value = publishedByLabel { dictionary[SerializationKeys.publishedByLabel] = value }
    if let value = contentDuration { dictionary[SerializationKeys.contentDuration] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = allowEdit { dictionary[SerializationKeys.allowEdit] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = participationPercentageInLiveClass { dictionary[SerializationKeys.participationPercentageInLiveClass] = value }
    if let value = moduleId { dictionary[SerializationKeys.moduleId] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    if let value = publishedByValue { dictionary[SerializationKeys.publishedByValue] = value }
    if let value = dateLabel { dictionary[SerializationKeys.dateLabel] = value }
    if let value = allowView { dictionary[SerializationKeys.allowView] = value }
    if let value = liveClassType { dictionary[SerializationKeys.liveClassType] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = participationPercentageInRecordedClass { dictionary[SerializationKeys.participationPercentageInRecordedClass] = value }
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = totalInviteesAttendedInRecordedClass { dictionary[SerializationKeys.totalInviteesAttendedInRecordedClass] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.totalInviteesAttendedInLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.totalInviteesAttendedInLiveClass) as? String
    self.action = aDecoder.decodeObject(forKey: SerializationKeys.action) as? String
    self.totalInviteesInLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.totalInviteesInLiveClass) as? String
    self.dateValue = aDecoder.decodeObject(forKey: SerializationKeys.dateValue) as? String
    self.contentDurationFormated = aDecoder.decodeObject(forKey: SerializationKeys.contentDurationFormated) as? String
    self.attendanceInRecordedSession = aDecoder.decodeObject(forKey: SerializationKeys.attendanceInRecordedSession) as? String
    self.startDateFormatted = aDecoder.decodeObject(forKey: SerializationKeys.startDateFormatted) as? String
    self.endDateFormatted = aDecoder.decodeObject(forKey: SerializationKeys.endDateFormatted) as? String
    self.contentTypeId = aDecoder.decodeObject(forKey: SerializationKeys.contentTypeId) as? String
    self.canView = aDecoder.decodeObject(forKey: SerializationKeys.canView) as? Int
    self.publishedByLabel = aDecoder.decodeObject(forKey: SerializationKeys.publishedByLabel) as? String
    self.contentDuration = aDecoder.decodeObject(forKey: SerializationKeys.contentDuration) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.allowEdit = aDecoder.decodeObject(forKey: SerializationKeys.allowEdit) as? Int
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.participationPercentageInLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.participationPercentageInLiveClass) as? String
    self.moduleId = aDecoder.decodeObject(forKey: SerializationKeys.moduleId) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
    self.publishedByValue = aDecoder.decodeObject(forKey: SerializationKeys.publishedByValue) as? String
    self.dateLabel = aDecoder.decodeObject(forKey: SerializationKeys.dateLabel) as? String
    self.allowView = aDecoder.decodeObject(forKey: SerializationKeys.allowView) as? Int
    self.liveClassType = aDecoder.decodeObject(forKey: SerializationKeys.liveClassType) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.participationPercentageInRecordedClass = aDecoder.decodeObject(forKey: SerializationKeys.participationPercentageInRecordedClass) as? String
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.totalInviteesAttendedInRecordedClass = aDecoder.decodeObject(forKey: SerializationKeys.totalInviteesAttendedInRecordedClass) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(totalInviteesAttendedInLiveClass, forKey: SerializationKeys.totalInviteesAttendedInLiveClass)
    aCoder.encode(action, forKey: SerializationKeys.action)
    aCoder.encode(totalInviteesInLiveClass, forKey: SerializationKeys.totalInviteesInLiveClass)
    aCoder.encode(dateValue, forKey: SerializationKeys.dateValue)
    aCoder.encode(contentDurationFormated, forKey: SerializationKeys.contentDurationFormated)
    aCoder.encode(attendanceInRecordedSession, forKey: SerializationKeys.attendanceInRecordedSession)
    aCoder.encode(startDateFormatted, forKey: SerializationKeys.startDateFormatted)
    aCoder.encode(endDateFormatted, forKey: SerializationKeys.endDateFormatted)
    aCoder.encode(contentTypeId, forKey: SerializationKeys.contentTypeId)
    aCoder.encode(canView, forKey: SerializationKeys.canView)
    aCoder.encode(publishedByLabel, forKey: SerializationKeys.publishedByLabel)
    aCoder.encode(contentDuration, forKey: SerializationKeys.contentDuration)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(allowEdit, forKey: SerializationKeys.allowEdit)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(participationPercentageInLiveClass, forKey: SerializationKeys.participationPercentageInLiveClass)
    aCoder.encode(moduleId, forKey: SerializationKeys.moduleId)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
    aCoder.encode(publishedByValue, forKey: SerializationKeys.publishedByValue)
    aCoder.encode(dateLabel, forKey: SerializationKeys.dateLabel)
    aCoder.encode(allowView, forKey: SerializationKeys.allowView)
    aCoder.encode(liveClassType, forKey: SerializationKeys.liveClassType)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(participationPercentageInRecordedClass, forKey: SerializationKeys.participationPercentageInRecordedClass)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(totalInviteesAttendedInRecordedClass, forKey: SerializationKeys.totalInviteesAttendedInRecordedClass)
  }

}
