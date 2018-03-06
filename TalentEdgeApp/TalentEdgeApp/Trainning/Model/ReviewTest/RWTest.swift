//
//  RWTest.swift
//
//  Created by Vinod Kumar on 30/06/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class RWTest: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let testType = "test_type"
    static let id = "id"
    static let totalDurations = "total_durations"
    static let durationText = "duration_text"
    static let totalQuestionLabel = "total_question_label"
    static let duedateLabel = "duedate_label"
    static let attemptAfterDuedate = "attempt_after_duedate"
    static let totalDurationLabel = "total_duration_label"
    static let totalQuestions = "total_questions"
  }

  // MARK: Properties
  public var testType: String?
  public var id: String?
  public var totalDurations: Int?
  public var durationText: String?
  public var totalQuestionLabel: String?
  public var duedateLabel: String?
  public var attemptAfterDuedate: String?
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
    testType = json[SerializationKeys.testType].string
    id = json[SerializationKeys.id].string
    totalDurations = json[SerializationKeys.totalDurations].int
    durationText = json[SerializationKeys.durationText].string
    totalQuestionLabel = json[SerializationKeys.totalQuestionLabel].string
    duedateLabel = json[SerializationKeys.duedateLabel].string
    attemptAfterDuedate = json[SerializationKeys.attemptAfterDuedate].string
    totalDurationLabel = json[SerializationKeys.totalDurationLabel].string
    totalQuestions = json[SerializationKeys.totalQuestions].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = testType { dictionary[SerializationKeys.testType] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = totalDurations { dictionary[SerializationKeys.totalDurations] = value }
    if let value = durationText { dictionary[SerializationKeys.durationText] = value }
    if let value = totalQuestionLabel { dictionary[SerializationKeys.totalQuestionLabel] = value }
    if let value = duedateLabel { dictionary[SerializationKeys.duedateLabel] = value }
    if let value = attemptAfterDuedate { dictionary[SerializationKeys.attemptAfterDuedate] = value }
    if let value = totalDurationLabel { dictionary[SerializationKeys.totalDurationLabel] = value }
    if let value = totalQuestions { dictionary[SerializationKeys.totalQuestions] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.testType = aDecoder.decodeObject(forKey: SerializationKeys.testType) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.totalDurations = aDecoder.decodeObject(forKey: SerializationKeys.totalDurations) as? Int
    self.durationText = aDecoder.decodeObject(forKey: SerializationKeys.durationText) as? String
    self.totalQuestionLabel = aDecoder.decodeObject(forKey: SerializationKeys.totalQuestionLabel) as? String
    self.duedateLabel = aDecoder.decodeObject(forKey: SerializationKeys.duedateLabel) as? String
    self.attemptAfterDuedate = aDecoder.decodeObject(forKey: SerializationKeys.attemptAfterDuedate) as? String
    self.totalDurationLabel = aDecoder.decodeObject(forKey: SerializationKeys.totalDurationLabel) as? String
    self.totalQuestions = aDecoder.decodeObject(forKey: SerializationKeys.totalQuestions) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(testType, forKey: SerializationKeys.testType)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(totalDurations, forKey: SerializationKeys.totalDurations)
    aCoder.encode(durationText, forKey: SerializationKeys.durationText)
    aCoder.encode(totalQuestionLabel, forKey: SerializationKeys.totalQuestionLabel)
    aCoder.encode(duedateLabel, forKey: SerializationKeys.duedateLabel)
    aCoder.encode(attemptAfterDuedate, forKey: SerializationKeys.attemptAfterDuedate)
    aCoder.encode(totalDurationLabel, forKey: SerializationKeys.totalDurationLabel)
    aCoder.encode(totalQuestions, forKey: SerializationKeys.totalQuestions)
  }

}
