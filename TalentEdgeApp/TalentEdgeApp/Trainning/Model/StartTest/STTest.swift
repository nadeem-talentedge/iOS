//
//  Test.swift
//
//  Created by Vinod Kumar Sahu on 11/06/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class STTest: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let negativeMarking = "negative_marking"
    static let testType = "test_type"
    static let id = "id"
    static let totalDurations = "total_durations"
    static let durationText = "duration_text"
    static let totalQuestionLabel = "total_question_label"
    static let attemptAfterDuedate = "attempt_after_duedate"
    static let duedateLabel = "duedate_label"
    static let isNegativeMarking = "is_negative_marking"
    static let totalQuestions = "total_questions"
    static let totalDurationLabel = "total_duration_label"
  }

  // MARK: Properties
  public var negativeMarking: String?
  public var testType: String?
  public var id: String?
  public var totalDurations: Int?
  public var durationText: String?
  public var totalQuestionLabel: String?
  public var attemptAfterDuedate: String?
  public var duedateLabel: String?
  public var isNegativeMarking: String?
  public var totalQuestions: String?
  public var totalDurationLabel: String?

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
    negativeMarking = json[SerializationKeys.negativeMarking].string
    testType = json[SerializationKeys.testType].string
    id = json[SerializationKeys.id].string
    totalDurations = json[SerializationKeys.totalDurations].int
    durationText = json[SerializationKeys.durationText].string
    totalQuestionLabel = json[SerializationKeys.totalQuestionLabel].string
    attemptAfterDuedate = json[SerializationKeys.attemptAfterDuedate].string
    duedateLabel = json[SerializationKeys.duedateLabel].string
    isNegativeMarking = json[SerializationKeys.isNegativeMarking].string
    totalQuestions = json[SerializationKeys.totalQuestions].string
    totalDurationLabel = json[SerializationKeys.totalDurationLabel].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = negativeMarking { dictionary[SerializationKeys.negativeMarking] = value }
    if let value = testType { dictionary[SerializationKeys.testType] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = totalDurations { dictionary[SerializationKeys.totalDurations] = value }
    if let value = durationText { dictionary[SerializationKeys.durationText] = value }
    if let value = totalQuestionLabel { dictionary[SerializationKeys.totalQuestionLabel] = value }
    if let value = attemptAfterDuedate { dictionary[SerializationKeys.attemptAfterDuedate] = value }
    if let value = duedateLabel { dictionary[SerializationKeys.duedateLabel] = value }
    if let value = isNegativeMarking { dictionary[SerializationKeys.isNegativeMarking] = value }
    if let value = totalQuestions { dictionary[SerializationKeys.totalQuestions] = value }
    if let value = totalDurationLabel { dictionary[SerializationKeys.totalDurationLabel] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.negativeMarking = aDecoder.decodeObject(forKey: SerializationKeys.negativeMarking) as? String
    self.testType = aDecoder.decodeObject(forKey: SerializationKeys.testType) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.totalDurations = aDecoder.decodeObject(forKey: SerializationKeys.totalDurations) as? Int
    self.durationText = aDecoder.decodeObject(forKey: SerializationKeys.durationText) as? String
    self.totalQuestionLabel = aDecoder.decodeObject(forKey: SerializationKeys.totalQuestionLabel) as? String
    self.attemptAfterDuedate = aDecoder.decodeObject(forKey: SerializationKeys.attemptAfterDuedate) as? String
    self.duedateLabel = aDecoder.decodeObject(forKey: SerializationKeys.duedateLabel) as? String
    self.isNegativeMarking = aDecoder.decodeObject(forKey: SerializationKeys.isNegativeMarking) as? String
    self.totalQuestions = aDecoder.decodeObject(forKey: SerializationKeys.totalQuestions) as? String
    self.totalDurationLabel = aDecoder.decodeObject(forKey: SerializationKeys.totalDurationLabel) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(negativeMarking, forKey: SerializationKeys.negativeMarking)
    aCoder.encode(testType, forKey: SerializationKeys.testType)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(totalDurations, forKey: SerializationKeys.totalDurations)
    aCoder.encode(durationText, forKey: SerializationKeys.durationText)
    aCoder.encode(totalQuestionLabel, forKey: SerializationKeys.totalQuestionLabel)
    aCoder.encode(attemptAfterDuedate, forKey: SerializationKeys.attemptAfterDuedate)
    aCoder.encode(duedateLabel, forKey: SerializationKeys.duedateLabel)
    aCoder.encode(isNegativeMarking, forKey: SerializationKeys.isNegativeMarking)
    aCoder.encode(totalQuestions, forKey: SerializationKeys.totalQuestions)
    aCoder.encode(totalDurationLabel, forKey: SerializationKeys.totalDurationLabel)
  }

}
