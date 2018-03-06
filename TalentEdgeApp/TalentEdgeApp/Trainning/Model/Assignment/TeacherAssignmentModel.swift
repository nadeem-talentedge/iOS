//
//  TeacherAssignmentModel.swift
//
//  Created by Vinod Kumar Sahu on 23/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TeacherAssignmentModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let isGradingDone = "is_grading_done"
    static let isGraded = "is_graded"
    static let startDate = "start_date"
    static let passingMarks = "passing_marks"
    static let endDate = "end_date"
    static let startDateFormatted = "start_date_formatted"
    static let descriptionValue = "description"
    static let endDateFormatted = "end_date_formatted"
    static let cntNotSubmitted = "cnt_not_submitted"
    static let moduleName = "module_name"
    static let id = "id"
    static let allowedMultiple = "allowed_multiple"
    static let title = "title"
    static let avgCompletionPercentage = "avg_completion_percentage"
    static let cntSubmitted = "cnt_submitted"
    static let submissionMode = "submission_mode"
    static let totalMarks = "total_marks"
  }

  // MARK: Properties
  public var isGradingDone: String?
  public var isGraded: String?
  public var startDate: String?
  public var passingMarks: String?
  public var endDate: String?
  public var startDateFormatted: String?
  public var descriptionValue: String?
  public var endDateFormatted: String?
  public var cntNotSubmitted: String?
  public var moduleName: String?
  public var id: String?
  public var allowedMultiple: String?
  public var title: String?
  public var avgCompletionPercentage: String?
  public var cntSubmitted: String?
  public var submissionMode: String?
  public var totalMarks: String?

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
    isGradingDone = json[SerializationKeys.isGradingDone].string
    isGraded = json[SerializationKeys.isGraded].string
    startDate = json[SerializationKeys.startDate].string
    passingMarks = json[SerializationKeys.passingMarks].string
    endDate = json[SerializationKeys.endDate].string
    startDateFormatted = json[SerializationKeys.startDateFormatted].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    endDateFormatted = json[SerializationKeys.endDateFormatted].string
    cntNotSubmitted = json[SerializationKeys.cntNotSubmitted].string
    moduleName = json[SerializationKeys.moduleName].string
    id = json[SerializationKeys.id].string
    allowedMultiple = json[SerializationKeys.allowedMultiple].string
    title = json[SerializationKeys.title].string
    avgCompletionPercentage = json[SerializationKeys.avgCompletionPercentage].string
    cntSubmitted = json[SerializationKeys.cntSubmitted].string
    submissionMode = json[SerializationKeys.submissionMode].string
    totalMarks = json[SerializationKeys.totalMarks].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = isGradingDone { dictionary[SerializationKeys.isGradingDone] = value }
    if let value = isGraded { dictionary[SerializationKeys.isGraded] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = passingMarks { dictionary[SerializationKeys.passingMarks] = value }
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    if let value = startDateFormatted { dictionary[SerializationKeys.startDateFormatted] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = endDateFormatted { dictionary[SerializationKeys.endDateFormatted] = value }
    if let value = cntNotSubmitted { dictionary[SerializationKeys.cntNotSubmitted] = value }
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = allowedMultiple { dictionary[SerializationKeys.allowedMultiple] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = avgCompletionPercentage { dictionary[SerializationKeys.avgCompletionPercentage] = value }
    if let value = cntSubmitted { dictionary[SerializationKeys.cntSubmitted] = value }
    if let value = submissionMode { dictionary[SerializationKeys.submissionMode] = value }
    if let value = totalMarks { dictionary[SerializationKeys.totalMarks] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.isGradingDone = aDecoder.decodeObject(forKey: SerializationKeys.isGradingDone) as? String
    self.isGraded = aDecoder.decodeObject(forKey: SerializationKeys.isGraded) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.passingMarks = aDecoder.decodeObject(forKey: SerializationKeys.passingMarks) as? String
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
    self.startDateFormatted = aDecoder.decodeObject(forKey: SerializationKeys.startDateFormatted) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.endDateFormatted = aDecoder.decodeObject(forKey: SerializationKeys.endDateFormatted) as? String
    self.cntNotSubmitted = aDecoder.decodeObject(forKey: SerializationKeys.cntNotSubmitted) as? String
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.allowedMultiple = aDecoder.decodeObject(forKey: SerializationKeys.allowedMultiple) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.avgCompletionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.avgCompletionPercentage) as? String
    self.cntSubmitted = aDecoder.decodeObject(forKey: SerializationKeys.cntSubmitted) as? String
    self.submissionMode = aDecoder.decodeObject(forKey: SerializationKeys.submissionMode) as? String
    self.totalMarks = aDecoder.decodeObject(forKey: SerializationKeys.totalMarks) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(isGradingDone, forKey: SerializationKeys.isGradingDone)
    aCoder.encode(isGraded, forKey: SerializationKeys.isGraded)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(passingMarks, forKey: SerializationKeys.passingMarks)
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
    aCoder.encode(startDateFormatted, forKey: SerializationKeys.startDateFormatted)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(endDateFormatted, forKey: SerializationKeys.endDateFormatted)
    aCoder.encode(cntNotSubmitted, forKey: SerializationKeys.cntNotSubmitted)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(allowedMultiple, forKey: SerializationKeys.allowedMultiple)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(avgCompletionPercentage, forKey: SerializationKeys.avgCompletionPercentage)
    aCoder.encode(cntSubmitted, forKey: SerializationKeys.cntSubmitted)
    aCoder.encode(submissionMode, forKey: SerializationKeys.submissionMode)
    aCoder.encode(totalMarks, forKey: SerializationKeys.totalMarks)
  }

}
