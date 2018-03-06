//
//  Batch.swift
//
//  Created by Vinod Kumar Sahu on 14/11/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Batch: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let totalTestimonial = "total_testimonial"
    static let avgNotesCompPercent = "avg_notes_comp_percent"
    static let totalModuleCompleted = "total_module_completed"
    static let totalVideo = "total_video"
    static let enrollEndDate = "enroll_end_date"
    static let batchState = "batch_state"
    static let totalInteractiveVideoMinutes = "total_interactive_video_minutes"
    static let avgAssignmentCompPercent = "avg_assignment_comp_percent"
    static let totalInteractiveVideo = "total_interactive_video"
    static let shortCode = "short_code"
    static let totalLiveclassMinutes = "total_liveclass_minutes"
    static let totalAssignment = "total_assignment"
    static let classParticipationPercentageInRecordedClass = "class_participation_percentage_in_recorded_class"
    static let totalNotes = "total_notes"
    static let avgMplannerCompPercent = "avg_mplanner_comp_percent"
    static let modified = "modified"
    static let totalAssessment = "total_assessment"
    static let id = "id"
    static let isDeleted = "is_deleted"
    static let avgIntvideoCompPercent = "avg_intvideo_comp_percent"
    static let courseId = "course_id"
    static let totalVideoMinutes = "total_video_minutes"
    static let studentReminder = "student_reminder"
    static let logo = "logo"
    static let completionPercentage = "completion_percentage"
    static let classParticipationPercentageInLiveClass = "class_participation_percentage_in_live_class"
    static let endDate = "end_date"
    static let totalModuleNotStarted = "total_module_not_started"
    static let startDate = "start_date"
    static let modifiedBy = "modified_by"
    static let name = "name"
    static let totalDiscussion = "total_discussion"
    static let totalModule = "total_module"
    static let shareUrl = "share_url"
    static let totalNotesPages = "total_notes_pages"
    static let totalLiveClass = "total_live_class"
    static let totalMplanner = "total_mplanner"
    static let banner = "banner"
    static let avgVideoCompPercent = "avg_video_comp_percent"
    static let averageRatingInCourse = "average_rating_in_course"
    static let status = "status"
    static let created = "created"
    static let totalModuleInDraft = "total_module_in_draft"
    static let enrollStartDate = "enroll_start_date"
    static let createdBy = "created_by"
    static let averageRatingCount = "average_rating_count"
    static let avgAssessmentCompPercent = "avg_assessment_comp_percent"
  }

  // MARK: Properties
  public var totalTestimonial: String?
  public var avgNotesCompPercent: String?
  public var totalModuleCompleted: String?
  public var totalVideo: String?
  public var enrollEndDate: String?
  public var batchState: String?
  public var totalInteractiveVideoMinutes: String?
  public var avgAssignmentCompPercent: String?
  public var totalInteractiveVideo: String?
  public var shortCode: String?
  public var totalLiveclassMinutes: String?
  public var totalAssignment: String?
  public var classParticipationPercentageInRecordedClass: String?
  public var totalNotes: String?
  public var avgMplannerCompPercent: String?
  public var modified: String?
  public var totalAssessment: String?
  public var id: String?
  public var isDeleted: Bool? = false
  public var avgIntvideoCompPercent: String?
  public var courseId: String?
  public var totalVideoMinutes: String?
  public var studentReminder: String?
  public var logo: String?
  public var completionPercentage: Float?
  public var classParticipationPercentageInLiveClass: String?
  public var endDate: String?
  public var totalModuleNotStarted: String?
  public var startDate: String?
  public var modifiedBy: String?
  public var name: String?
  public var totalDiscussion: String?
  public var totalModule: String?
  public var shareUrl: String?
  public var totalNotesPages: String?
  public var totalLiveClass: String?
  public var totalMplanner: String?
  public var banner: String?
  public var avgVideoCompPercent: String?
  public var averageRatingInCourse: String?
  public var status: Bool? = false
  public var created: String?
  public var totalModuleInDraft: String?
  public var enrollStartDate: String?
  public var createdBy: String?
  public var averageRatingCount: String?
  public var avgAssessmentCompPercent: String?

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
    totalTestimonial = json[SerializationKeys.totalTestimonial].string
    avgNotesCompPercent = json[SerializationKeys.avgNotesCompPercent].string
    totalModuleCompleted = json[SerializationKeys.totalModuleCompleted].string
    totalVideo = json[SerializationKeys.totalVideo].string
    enrollEndDate = json[SerializationKeys.enrollEndDate].string
    batchState = json[SerializationKeys.batchState].string
    totalInteractiveVideoMinutes = json[SerializationKeys.totalInteractiveVideoMinutes].string
    avgAssignmentCompPercent = json[SerializationKeys.avgAssignmentCompPercent].string
    totalInteractiveVideo = json[SerializationKeys.totalInteractiveVideo].string
    shortCode = json[SerializationKeys.shortCode].string
    totalLiveclassMinutes = json[SerializationKeys.totalLiveclassMinutes].string
    totalAssignment = json[SerializationKeys.totalAssignment].string
    classParticipationPercentageInRecordedClass = json[SerializationKeys.classParticipationPercentageInRecordedClass].string
    totalNotes = json[SerializationKeys.totalNotes].string
    avgMplannerCompPercent = json[SerializationKeys.avgMplannerCompPercent].string
    modified = json[SerializationKeys.modified].string
    totalAssessment = json[SerializationKeys.totalAssessment].string
    id = json[SerializationKeys.id].string
    isDeleted = json[SerializationKeys.isDeleted].boolValue
    avgIntvideoCompPercent = json[SerializationKeys.avgIntvideoCompPercent].string
    courseId = json[SerializationKeys.courseId].string
    totalVideoMinutes = json[SerializationKeys.totalVideoMinutes].string
    studentReminder = json[SerializationKeys.studentReminder].string
    logo = json[SerializationKeys.logo].string
    completionPercentage = json[SerializationKeys.completionPercentage].float
    classParticipationPercentageInLiveClass = json[SerializationKeys.classParticipationPercentageInLiveClass].string
    endDate = json[SerializationKeys.endDate].string
    totalModuleNotStarted = json[SerializationKeys.totalModuleNotStarted].string
    startDate = json[SerializationKeys.startDate].string
    modifiedBy = json[SerializationKeys.modifiedBy].string
    name = json[SerializationKeys.name].string
    totalDiscussion = json[SerializationKeys.totalDiscussion].string
    totalModule = json[SerializationKeys.totalModule].string
    shareUrl = json[SerializationKeys.shareUrl].string
    totalNotesPages = json[SerializationKeys.totalNotesPages].string
    totalLiveClass = json[SerializationKeys.totalLiveClass].string
    totalMplanner = json[SerializationKeys.totalMplanner].string
    banner = json[SerializationKeys.banner].string
    avgVideoCompPercent = json[SerializationKeys.avgVideoCompPercent].string
    averageRatingInCourse = json[SerializationKeys.averageRatingInCourse].string
    status = json[SerializationKeys.status].boolValue
    created = json[SerializationKeys.created].string
    totalModuleInDraft = json[SerializationKeys.totalModuleInDraft].string
    enrollStartDate = json[SerializationKeys.enrollStartDate].string
    createdBy = json[SerializationKeys.createdBy].string
    averageRatingCount = json[SerializationKeys.averageRatingCount].string
    avgAssessmentCompPercent = json[SerializationKeys.avgAssessmentCompPercent].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = totalTestimonial { dictionary[SerializationKeys.totalTestimonial] = value }
    if let value = avgNotesCompPercent { dictionary[SerializationKeys.avgNotesCompPercent] = value }
    if let value = totalModuleCompleted { dictionary[SerializationKeys.totalModuleCompleted] = value }
    if let value = totalVideo { dictionary[SerializationKeys.totalVideo] = value }
    if let value = enrollEndDate { dictionary[SerializationKeys.enrollEndDate] = value }
    if let value = batchState { dictionary[SerializationKeys.batchState] = value }
    if let value = totalInteractiveVideoMinutes { dictionary[SerializationKeys.totalInteractiveVideoMinutes] = value }
    if let value = avgAssignmentCompPercent { dictionary[SerializationKeys.avgAssignmentCompPercent] = value }
    if let value = totalInteractiveVideo { dictionary[SerializationKeys.totalInteractiveVideo] = value }
    if let value = shortCode { dictionary[SerializationKeys.shortCode] = value }
    if let value = totalLiveclassMinutes { dictionary[SerializationKeys.totalLiveclassMinutes] = value }
    if let value = totalAssignment { dictionary[SerializationKeys.totalAssignment] = value }
    if let value = classParticipationPercentageInRecordedClass { dictionary[SerializationKeys.classParticipationPercentageInRecordedClass] = value }
    if let value = totalNotes { dictionary[SerializationKeys.totalNotes] = value }
    if let value = avgMplannerCompPercent { dictionary[SerializationKeys.avgMplannerCompPercent] = value }
    if let value = modified { dictionary[SerializationKeys.modified] = value }
    if let value = totalAssessment { dictionary[SerializationKeys.totalAssessment] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    dictionary[SerializationKeys.isDeleted] = isDeleted
    if let value = avgIntvideoCompPercent { dictionary[SerializationKeys.avgIntvideoCompPercent] = value }
    if let value = courseId { dictionary[SerializationKeys.courseId] = value }
    if let value = totalVideoMinutes { dictionary[SerializationKeys.totalVideoMinutes] = value }
    if let value = studentReminder { dictionary[SerializationKeys.studentReminder] = value }
    if let value = logo { dictionary[SerializationKeys.logo] = value }
    if let value = completionPercentage { dictionary[SerializationKeys.completionPercentage] = value }
    if let value = classParticipationPercentageInLiveClass { dictionary[SerializationKeys.classParticipationPercentageInLiveClass] = value }
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    if let value = totalModuleNotStarted { dictionary[SerializationKeys.totalModuleNotStarted] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = modifiedBy { dictionary[SerializationKeys.modifiedBy] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = totalDiscussion { dictionary[SerializationKeys.totalDiscussion] = value }
    if let value = totalModule { dictionary[SerializationKeys.totalModule] = value }
    if let value = shareUrl { dictionary[SerializationKeys.shareUrl] = value }
    if let value = totalNotesPages { dictionary[SerializationKeys.totalNotesPages] = value }
    if let value = totalLiveClass { dictionary[SerializationKeys.totalLiveClass] = value }
    if let value = totalMplanner { dictionary[SerializationKeys.totalMplanner] = value }
    if let value = banner { dictionary[SerializationKeys.banner] = value }
    if let value = avgVideoCompPercent { dictionary[SerializationKeys.avgVideoCompPercent] = value }
    if let value = averageRatingInCourse { dictionary[SerializationKeys.averageRatingInCourse] = value }
    dictionary[SerializationKeys.status] = status
    if let value = created { dictionary[SerializationKeys.created] = value }
    if let value = totalModuleInDraft { dictionary[SerializationKeys.totalModuleInDraft] = value }
    if let value = enrollStartDate { dictionary[SerializationKeys.enrollStartDate] = value }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    if let value = averageRatingCount { dictionary[SerializationKeys.averageRatingCount] = value }
    if let value = avgAssessmentCompPercent { dictionary[SerializationKeys.avgAssessmentCompPercent] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.totalTestimonial = aDecoder.decodeObject(forKey: SerializationKeys.totalTestimonial) as? String
    self.avgNotesCompPercent = aDecoder.decodeObject(forKey: SerializationKeys.avgNotesCompPercent) as? String
    self.totalModuleCompleted = aDecoder.decodeObject(forKey: SerializationKeys.totalModuleCompleted) as? String
    self.totalVideo = aDecoder.decodeObject(forKey: SerializationKeys.totalVideo) as? String
    self.enrollEndDate = aDecoder.decodeObject(forKey: SerializationKeys.enrollEndDate) as? String
    self.batchState = aDecoder.decodeObject(forKey: SerializationKeys.batchState) as? String
    self.totalInteractiveVideoMinutes = aDecoder.decodeObject(forKey: SerializationKeys.totalInteractiveVideoMinutes) as? String
    self.avgAssignmentCompPercent = aDecoder.decodeObject(forKey: SerializationKeys.avgAssignmentCompPercent) as? String
    self.totalInteractiveVideo = aDecoder.decodeObject(forKey: SerializationKeys.totalInteractiveVideo) as? String
    self.shortCode = aDecoder.decodeObject(forKey: SerializationKeys.shortCode) as? String
    self.totalLiveclassMinutes = aDecoder.decodeObject(forKey: SerializationKeys.totalLiveclassMinutes) as? String
    self.totalAssignment = aDecoder.decodeObject(forKey: SerializationKeys.totalAssignment) as? String
    self.classParticipationPercentageInRecordedClass = aDecoder.decodeObject(forKey: SerializationKeys.classParticipationPercentageInRecordedClass) as? String
    self.totalNotes = aDecoder.decodeObject(forKey: SerializationKeys.totalNotes) as? String
    self.avgMplannerCompPercent = aDecoder.decodeObject(forKey: SerializationKeys.avgMplannerCompPercent) as? String
    self.modified = aDecoder.decodeObject(forKey: SerializationKeys.modified) as? String
    self.totalAssessment = aDecoder.decodeObject(forKey: SerializationKeys.totalAssessment) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.isDeleted = aDecoder.decodeBool(forKey: SerializationKeys.isDeleted)
    self.avgIntvideoCompPercent = aDecoder.decodeObject(forKey: SerializationKeys.avgIntvideoCompPercent) as? String
    self.courseId = aDecoder.decodeObject(forKey: SerializationKeys.courseId) as? String
    self.totalVideoMinutes = aDecoder.decodeObject(forKey: SerializationKeys.totalVideoMinutes) as? String
    self.studentReminder = aDecoder.decodeObject(forKey: SerializationKeys.studentReminder) as? String
    self.logo = aDecoder.decodeObject(forKey: SerializationKeys.logo) as? String
    self.completionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.completionPercentage) as? Float
    self.classParticipationPercentageInLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.classParticipationPercentageInLiveClass) as? String
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
    self.totalModuleNotStarted = aDecoder.decodeObject(forKey: SerializationKeys.totalModuleNotStarted) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.modifiedBy = aDecoder.decodeObject(forKey: SerializationKeys.modifiedBy) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.totalDiscussion = aDecoder.decodeObject(forKey: SerializationKeys.totalDiscussion) as? String
    self.totalModule = aDecoder.decodeObject(forKey: SerializationKeys.totalModule) as? String
    self.shareUrl = aDecoder.decodeObject(forKey: SerializationKeys.shareUrl) as? String
    self.totalNotesPages = aDecoder.decodeObject(forKey: SerializationKeys.totalNotesPages) as? String
    self.totalLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.totalLiveClass) as? String
    self.totalMplanner = aDecoder.decodeObject(forKey: SerializationKeys.totalMplanner) as? String
    self.banner = aDecoder.decodeObject(forKey: SerializationKeys.banner) as? String
    self.avgVideoCompPercent = aDecoder.decodeObject(forKey: SerializationKeys.avgVideoCompPercent) as? String
    self.averageRatingInCourse = aDecoder.decodeObject(forKey: SerializationKeys.averageRatingInCourse) as? String
    self.status = aDecoder.decodeBool(forKey: SerializationKeys.status)
    self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? String
    self.totalModuleInDraft = aDecoder.decodeObject(forKey: SerializationKeys.totalModuleInDraft) as? String
    self.enrollStartDate = aDecoder.decodeObject(forKey: SerializationKeys.enrollStartDate) as? String
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? String
    self.averageRatingCount = aDecoder.decodeObject(forKey: SerializationKeys.averageRatingCount) as? String
    self.avgAssessmentCompPercent = aDecoder.decodeObject(forKey: SerializationKeys.avgAssessmentCompPercent) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(totalTestimonial, forKey: SerializationKeys.totalTestimonial)
    aCoder.encode(avgNotesCompPercent, forKey: SerializationKeys.avgNotesCompPercent)
    aCoder.encode(totalModuleCompleted, forKey: SerializationKeys.totalModuleCompleted)
    aCoder.encode(totalVideo, forKey: SerializationKeys.totalVideo)
    aCoder.encode(enrollEndDate, forKey: SerializationKeys.enrollEndDate)
    aCoder.encode(batchState, forKey: SerializationKeys.batchState)
    aCoder.encode(totalInteractiveVideoMinutes, forKey: SerializationKeys.totalInteractiveVideoMinutes)
    aCoder.encode(avgAssignmentCompPercent, forKey: SerializationKeys.avgAssignmentCompPercent)
    aCoder.encode(totalInteractiveVideo, forKey: SerializationKeys.totalInteractiveVideo)
    aCoder.encode(shortCode, forKey: SerializationKeys.shortCode)
    aCoder.encode(totalLiveclassMinutes, forKey: SerializationKeys.totalLiveclassMinutes)
    aCoder.encode(totalAssignment, forKey: SerializationKeys.totalAssignment)
    aCoder.encode(classParticipationPercentageInRecordedClass, forKey: SerializationKeys.classParticipationPercentageInRecordedClass)
    aCoder.encode(totalNotes, forKey: SerializationKeys.totalNotes)
    aCoder.encode(avgMplannerCompPercent, forKey: SerializationKeys.avgMplannerCompPercent)
    aCoder.encode(modified, forKey: SerializationKeys.modified)
    aCoder.encode(totalAssessment, forKey: SerializationKeys.totalAssessment)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(isDeleted, forKey: SerializationKeys.isDeleted)
    aCoder.encode(avgIntvideoCompPercent, forKey: SerializationKeys.avgIntvideoCompPercent)
    aCoder.encode(courseId, forKey: SerializationKeys.courseId)
    aCoder.encode(totalVideoMinutes, forKey: SerializationKeys.totalVideoMinutes)
    aCoder.encode(studentReminder, forKey: SerializationKeys.studentReminder)
    aCoder.encode(logo, forKey: SerializationKeys.logo)
    aCoder.encode(completionPercentage, forKey: SerializationKeys.completionPercentage)
    aCoder.encode(classParticipationPercentageInLiveClass, forKey: SerializationKeys.classParticipationPercentageInLiveClass)
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
    aCoder.encode(totalModuleNotStarted, forKey: SerializationKeys.totalModuleNotStarted)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(modifiedBy, forKey: SerializationKeys.modifiedBy)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(totalDiscussion, forKey: SerializationKeys.totalDiscussion)
    aCoder.encode(totalModule, forKey: SerializationKeys.totalModule)
    aCoder.encode(shareUrl, forKey: SerializationKeys.shareUrl)
    aCoder.encode(totalNotesPages, forKey: SerializationKeys.totalNotesPages)
    aCoder.encode(totalLiveClass, forKey: SerializationKeys.totalLiveClass)
    aCoder.encode(totalMplanner, forKey: SerializationKeys.totalMplanner)
    aCoder.encode(banner, forKey: SerializationKeys.banner)
    aCoder.encode(avgVideoCompPercent, forKey: SerializationKeys.avgVideoCompPercent)
    aCoder.encode(averageRatingInCourse, forKey: SerializationKeys.averageRatingInCourse)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(created, forKey: SerializationKeys.created)
    aCoder.encode(totalModuleInDraft, forKey: SerializationKeys.totalModuleInDraft)
    aCoder.encode(enrollStartDate, forKey: SerializationKeys.enrollStartDate)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
    aCoder.encode(averageRatingCount, forKey: SerializationKeys.averageRatingCount)
    aCoder.encode(avgAssessmentCompPercent, forKey: SerializationKeys.avgAssessmentCompPercent)
  }

}
