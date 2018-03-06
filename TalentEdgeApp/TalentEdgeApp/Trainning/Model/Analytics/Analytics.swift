//
//  Analytics.swift
//
//  Created by Vinod Kumar Sahu on 14/11/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Analytics: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let avgNotesCompPercent = "avg_notes_comp_percent"
    static let totalLiveclassMinutes = "total_liveclass_minutes"
    static let totalVideo = "total_video"
    static let avgLcCompPercentRecorded = "avg_lc_comp_percent_recorded"
    static let avgAssignmentCompPercent = "avg_assignment_comp_percent"
    static let totalNotes = "total_notes"
    static let totalLiveClass = "total_live_class"
    static let totalNotesPages = "total_notes_pages"
    static let avgVideoCompPercent = "avg_video_comp_percent"
    static let totalAssignment = "total_assignment"
    static let avgMplannerCompPercent = "avg_mplanner_comp_percent"
    static let avgLcCompPercentLive = "avg_lc_comp_percent_live"
    static let avgLcCompPercent = "avg_lc_comp_percent"
    static let assignmentStudentsCount = "assignment_students_count"
    static let assessmentStudentsCount = "assessment_students_count"
    static let avgIntvideoCompPercent = "avg_intvideo_comp_percent"
    static let totalVideoMinutes = "total_video_minutes"
    static let totalAssessment = "total_assessment"
    static let avgAssessmentCompPercent = "avg_assessment_comp_percent"
  }

  // MARK: Properties
  public var avgNotesCompPercent: String?
  public var totalLiveclassMinutes: String?
  public var totalVideo: String?
  public var avgLcCompPercentRecorded: String?
  public var avgAssignmentCompPercent: String?
  public var totalNotes: String?
  public var totalLiveClass: String?
  public var totalNotesPages: String?
  public var avgVideoCompPercent: String?
  public var totalAssignment: String?
  public var avgMplannerCompPercent: String?
  public var avgLcCompPercentLive: String?
  public var avgLcCompPercent: String?
  public var assignmentStudentsCount: String?
  public var assessmentStudentsCount: String?
  public var avgIntvideoCompPercent: String?
  public var totalVideoMinutes: String?
  public var totalAssessment: String?
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
    avgNotesCompPercent = json[SerializationKeys.avgNotesCompPercent].string
    totalLiveclassMinutes = json[SerializationKeys.totalLiveclassMinutes].string
    totalVideo = json[SerializationKeys.totalVideo].string
    avgLcCompPercentRecorded = json[SerializationKeys.avgLcCompPercentRecorded].string
    avgAssignmentCompPercent = json[SerializationKeys.avgAssignmentCompPercent].string
    totalNotes = json[SerializationKeys.totalNotes].string
    totalLiveClass = json[SerializationKeys.totalLiveClass].string
    totalNotesPages = json[SerializationKeys.totalNotesPages].string
    avgVideoCompPercent = json[SerializationKeys.avgVideoCompPercent].string
    totalAssignment = json[SerializationKeys.totalAssignment].string
    avgMplannerCompPercent = json[SerializationKeys.avgMplannerCompPercent].string
    avgLcCompPercentLive = json[SerializationKeys.avgLcCompPercentLive].string
    avgLcCompPercent = json[SerializationKeys.avgLcCompPercent].string
    assignmentStudentsCount = json[SerializationKeys.assignmentStudentsCount].string
    assessmentStudentsCount = json[SerializationKeys.assessmentStudentsCount].string
    avgIntvideoCompPercent = json[SerializationKeys.avgIntvideoCompPercent].string
    totalVideoMinutes = json[SerializationKeys.totalVideoMinutes].string
    totalAssessment = json[SerializationKeys.totalAssessment].string
    avgAssessmentCompPercent = json[SerializationKeys.avgAssessmentCompPercent].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = avgNotesCompPercent { dictionary[SerializationKeys.avgNotesCompPercent] = value }
    if let value = totalLiveclassMinutes { dictionary[SerializationKeys.totalLiveclassMinutes] = value }
    if let value = totalVideo { dictionary[SerializationKeys.totalVideo] = value }
    if let value = avgLcCompPercentRecorded { dictionary[SerializationKeys.avgLcCompPercentRecorded] = value }
    if let value = avgAssignmentCompPercent { dictionary[SerializationKeys.avgAssignmentCompPercent] = value }
    if let value = totalNotes { dictionary[SerializationKeys.totalNotes] = value }
    if let value = totalLiveClass { dictionary[SerializationKeys.totalLiveClass] = value }
    if let value = totalNotesPages { dictionary[SerializationKeys.totalNotesPages] = value }
    if let value = avgVideoCompPercent { dictionary[SerializationKeys.avgVideoCompPercent] = value }
    if let value = totalAssignment { dictionary[SerializationKeys.totalAssignment] = value }
    if let value = avgMplannerCompPercent { dictionary[SerializationKeys.avgMplannerCompPercent] = value }
    if let value = avgLcCompPercentLive { dictionary[SerializationKeys.avgLcCompPercentLive] = value }
    if let value = avgLcCompPercent { dictionary[SerializationKeys.avgLcCompPercent] = value }
    if let value = assignmentStudentsCount { dictionary[SerializationKeys.assignmentStudentsCount] = value }
    if let value = assessmentStudentsCount { dictionary[SerializationKeys.assessmentStudentsCount] = value }
    if let value = avgIntvideoCompPercent { dictionary[SerializationKeys.avgIntvideoCompPercent] = value }
    if let value = totalVideoMinutes { dictionary[SerializationKeys.totalVideoMinutes] = value }
    if let value = totalAssessment { dictionary[SerializationKeys.totalAssessment] = value }
    if let value = avgAssessmentCompPercent { dictionary[SerializationKeys.avgAssessmentCompPercent] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.avgNotesCompPercent = aDecoder.decodeObject(forKey: SerializationKeys.avgNotesCompPercent) as? String
    self.totalLiveclassMinutes = aDecoder.decodeObject(forKey: SerializationKeys.totalLiveclassMinutes) as? String
    self.totalVideo = aDecoder.decodeObject(forKey: SerializationKeys.totalVideo) as? String
    self.avgLcCompPercentRecorded = aDecoder.decodeObject(forKey: SerializationKeys.avgLcCompPercentRecorded) as? String
    self.avgAssignmentCompPercent = aDecoder.decodeObject(forKey: SerializationKeys.avgAssignmentCompPercent) as? String
    self.totalNotes = aDecoder.decodeObject(forKey: SerializationKeys.totalNotes) as? String
    self.totalLiveClass = aDecoder.decodeObject(forKey: SerializationKeys.totalLiveClass) as? String
    self.totalNotesPages = aDecoder.decodeObject(forKey: SerializationKeys.totalNotesPages) as? String
    self.avgVideoCompPercent = aDecoder.decodeObject(forKey: SerializationKeys.avgVideoCompPercent) as? String
    self.totalAssignment = aDecoder.decodeObject(forKey: SerializationKeys.totalAssignment) as? String
    self.avgMplannerCompPercent = aDecoder.decodeObject(forKey: SerializationKeys.avgMplannerCompPercent) as? String
    self.avgLcCompPercentLive = aDecoder.decodeObject(forKey: SerializationKeys.avgLcCompPercentLive) as? String
    self.avgLcCompPercent = aDecoder.decodeObject(forKey: SerializationKeys.avgLcCompPercent) as? String
    self.assignmentStudentsCount = aDecoder.decodeObject(forKey: SerializationKeys.assignmentStudentsCount) as? String
    self.assessmentStudentsCount = aDecoder.decodeObject(forKey: SerializationKeys.assessmentStudentsCount) as? String
    self.avgIntvideoCompPercent = aDecoder.decodeObject(forKey: SerializationKeys.avgIntvideoCompPercent) as? String
    self.totalVideoMinutes = aDecoder.decodeObject(forKey: SerializationKeys.totalVideoMinutes) as? String
    self.totalAssessment = aDecoder.decodeObject(forKey: SerializationKeys.totalAssessment) as? String
    self.avgAssessmentCompPercent = aDecoder.decodeObject(forKey: SerializationKeys.avgAssessmentCompPercent) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(avgNotesCompPercent, forKey: SerializationKeys.avgNotesCompPercent)
    aCoder.encode(totalLiveclassMinutes, forKey: SerializationKeys.totalLiveclassMinutes)
    aCoder.encode(totalVideo, forKey: SerializationKeys.totalVideo)
    aCoder.encode(avgLcCompPercentRecorded, forKey: SerializationKeys.avgLcCompPercentRecorded)
    aCoder.encode(avgAssignmentCompPercent, forKey: SerializationKeys.avgAssignmentCompPercent)
    aCoder.encode(totalNotes, forKey: SerializationKeys.totalNotes)
    aCoder.encode(totalLiveClass, forKey: SerializationKeys.totalLiveClass)
    aCoder.encode(totalNotesPages, forKey: SerializationKeys.totalNotesPages)
    aCoder.encode(avgVideoCompPercent, forKey: SerializationKeys.avgVideoCompPercent)
    aCoder.encode(totalAssignment, forKey: SerializationKeys.totalAssignment)
    aCoder.encode(avgMplannerCompPercent, forKey: SerializationKeys.avgMplannerCompPercent)
    aCoder.encode(avgLcCompPercentLive, forKey: SerializationKeys.avgLcCompPercentLive)
    aCoder.encode(avgLcCompPercent, forKey: SerializationKeys.avgLcCompPercent)
    aCoder.encode(assignmentStudentsCount, forKey: SerializationKeys.assignmentStudentsCount)
    aCoder.encode(assessmentStudentsCount, forKey: SerializationKeys.assessmentStudentsCount)
    aCoder.encode(avgIntvideoCompPercent, forKey: SerializationKeys.avgIntvideoCompPercent)
    aCoder.encode(totalVideoMinutes, forKey: SerializationKeys.totalVideoMinutes)
    aCoder.encode(totalAssessment, forKey: SerializationKeys.totalAssessment)
    aCoder.encode(avgAssessmentCompPercent, forKey: SerializationKeys.avgAssessmentCompPercent)
  }

}
