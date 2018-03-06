//
//  Test.swift
//
//  Created by Vinod Kumar Sahu on 11/06/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DetailTest: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let instructions = "instructions"
    static let totalMarks = "total_marks"
    static let testType = "test_type"
    static let totalMarksLabel = "total_marks_label"
    static let totalDurations = "total_durations"
    static let attemptAfterDuedate = "attempt_after_duedate"
    static let duedateLabel = "duedate_label"
    static let markingLabel = "marking_label"
    static let isNegativeMarking = "is_negative_marking"
    static let negativeMarking = "negative_marking"
    static let totalDurationFormated = "total_duration_formated"
    static let id = "id"
    static let totalQuestionLabel = "total_question_label"
    static let durationText = "duration_text"
    static let passingMarksLabel = "passing_marks_label"
    static let passingMarks = "passing_marks"
    static let totalDurationLabel = "total_duration_label"
    static let totalQuestions = "total_questions"
  }

  // MARK: Properties
  public var instructions: String?
  public var totalMarks: String?
  public var testType: String?
  public var totalMarksLabel: String?
  public var totalDurations: Int?
  public var attemptAfterDuedate: String?
  public var duedateLabel: String?
  public var markingLabel: String?
  public var isNegativeMarking: String?
  public var negativeMarking: String?
  public var totalDurationFormated: String?
  public var id: String?
  public var totalQuestionLabel: String?
  public var durationText: String?
  public var passingMarksLabel: String?
  public var passingMarks: String?
  public var totalDurationLabel: String?
  public var totalQuestions: String?

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
    instructions = json[SerializationKeys.instructions].string
    totalMarks = json[SerializationKeys.totalMarks].string
    testType = json[SerializationKeys.testType].string
    totalMarksLabel = json[SerializationKeys.totalMarksLabel].string
    totalDurations = json[SerializationKeys.totalDurations].int
    attemptAfterDuedate = json[SerializationKeys.attemptAfterDuedate].string
    duedateLabel = json[SerializationKeys.duedateLabel].string
    markingLabel = json[SerializationKeys.markingLabel].string
    isNegativeMarking = json[SerializationKeys.isNegativeMarking].string
    negativeMarking = json[SerializationKeys.negativeMarking].string
    totalDurationFormated = json[SerializationKeys.totalDurationFormated].string
    id = json[SerializationKeys.id].string
    totalQuestionLabel = json[SerializationKeys.totalQuestionLabel].string
    durationText = json[SerializationKeys.durationText].string
    passingMarksLabel = json[SerializationKeys.passingMarksLabel].string
    passingMarks = json[SerializationKeys.passingMarks].string
    totalDurationLabel = json[SerializationKeys.totalDurationLabel].string
    totalQuestions = json[SerializationKeys.totalQuestions].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = instructions { dictionary[SerializationKeys.instructions] = value }
    if let value = totalMarks { dictionary[SerializationKeys.totalMarks] = value }
    if let value = testType { dictionary[SerializationKeys.testType] = value }
    if let value = totalMarksLabel { dictionary[SerializationKeys.totalMarksLabel] = value }
    if let value = totalDurations { dictionary[SerializationKeys.totalDurations] = value }
    if let value = attemptAfterDuedate { dictionary[SerializationKeys.attemptAfterDuedate] = value }
    if let value = duedateLabel { dictionary[SerializationKeys.duedateLabel] = value }
    if let value = markingLabel { dictionary[SerializationKeys.markingLabel] = value }
    if let value = isNegativeMarking { dictionary[SerializationKeys.isNegativeMarking] = value }
    if let value = negativeMarking { dictionary[SerializationKeys.negativeMarking] = value }
    if let value = totalDurationFormated { dictionary[SerializationKeys.totalDurationFormated] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = totalQuestionLabel { dictionary[SerializationKeys.totalQuestionLabel] = value }
    if let value = durationText { dictionary[SerializationKeys.durationText] = value }
    if let value = passingMarksLabel { dictionary[SerializationKeys.passingMarksLabel] = value }
    if let value = passingMarks { dictionary[SerializationKeys.passingMarks] = value }
    if let value = totalDurationLabel { dictionary[SerializationKeys.totalDurationLabel] = value }
    if let value = totalQuestions { dictionary[SerializationKeys.totalQuestions] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.instructions = aDecoder.decodeObject(forKey: SerializationKeys.instructions) as? String
    self.totalMarks = aDecoder.decodeObject(forKey: SerializationKeys.totalMarks) as? String
    self.testType = aDecoder.decodeObject(forKey: SerializationKeys.testType) as? String
    self.totalMarksLabel = aDecoder.decodeObject(forKey: SerializationKeys.totalMarksLabel) as? String
    self.totalDurations = aDecoder.decodeObject(forKey: SerializationKeys.totalDurations) as? Int
    self.attemptAfterDuedate = aDecoder.decodeObject(forKey: SerializationKeys.attemptAfterDuedate) as? String
    self.duedateLabel = aDecoder.decodeObject(forKey: SerializationKeys.duedateLabel) as? String
    self.markingLabel = aDecoder.decodeObject(forKey: SerializationKeys.markingLabel) as? String
    self.isNegativeMarking = aDecoder.decodeObject(forKey: SerializationKeys.isNegativeMarking) as? String
    self.negativeMarking = aDecoder.decodeObject(forKey: SerializationKeys.negativeMarking) as? String
    self.totalDurationFormated = aDecoder.decodeObject(forKey: SerializationKeys.totalDurationFormated) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.totalQuestionLabel = aDecoder.decodeObject(forKey: SerializationKeys.totalQuestionLabel) as? String
    self.durationText = aDecoder.decodeObject(forKey: SerializationKeys.durationText) as? String
    self.passingMarksLabel = aDecoder.decodeObject(forKey: SerializationKeys.passingMarksLabel) as? String
    self.passingMarks = aDecoder.decodeObject(forKey: SerializationKeys.passingMarks) as? String
    self.totalDurationLabel = aDecoder.decodeObject(forKey: SerializationKeys.totalDurationLabel) as? String
    self.totalQuestions = aDecoder.decodeObject(forKey: SerializationKeys.totalQuestions) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(instructions, forKey: SerializationKeys.instructions)
    aCoder.encode(totalMarks, forKey: SerializationKeys.totalMarks)
    aCoder.encode(testType, forKey: SerializationKeys.testType)
    aCoder.encode(totalMarksLabel, forKey: SerializationKeys.totalMarksLabel)
    aCoder.encode(totalDurations, forKey: SerializationKeys.totalDurations)
    aCoder.encode(attemptAfterDuedate, forKey: SerializationKeys.attemptAfterDuedate)
    aCoder.encode(duedateLabel, forKey: SerializationKeys.duedateLabel)
    aCoder.encode(markingLabel, forKey: SerializationKeys.markingLabel)
    aCoder.encode(isNegativeMarking, forKey: SerializationKeys.isNegativeMarking)
    aCoder.encode(negativeMarking, forKey: SerializationKeys.negativeMarking)
    aCoder.encode(totalDurationFormated, forKey: SerializationKeys.totalDurationFormated)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(totalQuestionLabel, forKey: SerializationKeys.totalQuestionLabel)
    aCoder.encode(durationText, forKey: SerializationKeys.durationText)
    aCoder.encode(passingMarksLabel, forKey: SerializationKeys.passingMarksLabel)
    aCoder.encode(passingMarks, forKey: SerializationKeys.passingMarks)
    aCoder.encode(totalDurationLabel, forKey: SerializationKeys.totalDurationLabel)
    aCoder.encode(totalQuestions, forKey: SerializationKeys.totalQuestions)
  }

}
