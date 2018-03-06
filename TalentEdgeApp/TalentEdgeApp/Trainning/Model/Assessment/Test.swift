//
//  Test.swift
//
//  Created by Rohit on 29/05/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Test: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let totalQuestions = "total_questions"
    static let totalDurationLabel = "total_duration_label"
    static let testType = "test_type"
    static let totalMarksLabel = "total_marks_label"
    static let attemptAfterDuedate = "attempt_after_duedate"
    static let reviewAfterAttempt = "review_after_attempt"
    static let plateformId = "plateform_id"
    static let difficultyLevelId = "difficulty_level_id"
    static let totalDuration = "total_duration"
    static let id = "id"
    static let testTypeLabel = "test_type_label"
    static let allowedMultiple = "allowed_multiple"
    static let passingMarksLabel = "passing_marks_label"
    static let passingMarks = "passing_marks"
    static let totalQuestionsLabel = "total_questions_label"
    static let totalMarks = "total_marks"
  }

  // MARK: Properties
  public var totalQuestions: String?
  public var totalDurationLabel: String?
  public var testType: String?
  public var totalMarksLabel: String?
  public var attemptAfterDuedate: String?
  public var reviewAfterAttempt: String?
  public var plateformId: String?
  public var difficultyLevelId: String?
  public var totalDuration: String?
  public var id: String?
  public var testTypeLabel: String?
  public var allowedMultiple: String?
  public var passingMarksLabel: String?
  public var passingMarks: String?
  public var totalQuestionsLabel: String?
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
    totalQuestions = json[SerializationKeys.totalQuestions].string
    totalDurationLabel = json[SerializationKeys.totalDurationLabel].string
    testType = json[SerializationKeys.testType].string
    totalMarksLabel = json[SerializationKeys.totalMarksLabel].string
    attemptAfterDuedate = json[SerializationKeys.attemptAfterDuedate].string
    reviewAfterAttempt = json[SerializationKeys.reviewAfterAttempt].string
    plateformId = json[SerializationKeys.plateformId].string
    difficultyLevelId = json[SerializationKeys.difficultyLevelId].string
    totalDuration = json[SerializationKeys.totalDuration].string
    id = json[SerializationKeys.id].string
    testTypeLabel = json[SerializationKeys.testTypeLabel].string
    allowedMultiple = json[SerializationKeys.allowedMultiple].string
    passingMarksLabel = json[SerializationKeys.passingMarksLabel].string
    passingMarks = json[SerializationKeys.passingMarks].string
    totalQuestionsLabel = json[SerializationKeys.totalQuestionsLabel].string
    totalMarks = json[SerializationKeys.totalMarks].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = totalQuestions { dictionary[SerializationKeys.totalQuestions] = value }
    if let value = totalDurationLabel { dictionary[SerializationKeys.totalDurationLabel] = value }
    if let value = testType { dictionary[SerializationKeys.testType] = value }
    if let value = totalMarksLabel { dictionary[SerializationKeys.totalMarksLabel] = value }
    if let value = attemptAfterDuedate { dictionary[SerializationKeys.attemptAfterDuedate] = value }
    if let value = reviewAfterAttempt { dictionary[SerializationKeys.reviewAfterAttempt] = value }
    if let value = plateformId { dictionary[SerializationKeys.plateformId] = value }
    if let value = difficultyLevelId { dictionary[SerializationKeys.difficultyLevelId] = value }
    if let value = totalDuration { dictionary[SerializationKeys.totalDuration] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = testTypeLabel { dictionary[SerializationKeys.testTypeLabel] = value }
    if let value = allowedMultiple { dictionary[SerializationKeys.allowedMultiple] = value }
    if let value = passingMarksLabel { dictionary[SerializationKeys.passingMarksLabel] = value }
    if let value = passingMarks { dictionary[SerializationKeys.passingMarks] = value }
    if let value = totalQuestionsLabel { dictionary[SerializationKeys.totalQuestionsLabel] = value }
    if let value = totalMarks { dictionary[SerializationKeys.totalMarks] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.totalQuestions = aDecoder.decodeObject(forKey: SerializationKeys.totalQuestions) as? String
    self.totalDurationLabel = aDecoder.decodeObject(forKey: SerializationKeys.totalDurationLabel) as? String
    self.testType = aDecoder.decodeObject(forKey: SerializationKeys.testType) as? String
    self.totalMarksLabel = aDecoder.decodeObject(forKey: SerializationKeys.totalMarksLabel) as? String
    self.attemptAfterDuedate = aDecoder.decodeObject(forKey: SerializationKeys.attemptAfterDuedate) as? String
    self.reviewAfterAttempt = aDecoder.decodeObject(forKey: SerializationKeys.reviewAfterAttempt) as? String
    self.plateformId = aDecoder.decodeObject(forKey: SerializationKeys.plateformId) as? String
    self.difficultyLevelId = aDecoder.decodeObject(forKey: SerializationKeys.difficultyLevelId) as? String
    self.totalDuration = aDecoder.decodeObject(forKey: SerializationKeys.totalDuration) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.testTypeLabel = aDecoder.decodeObject(forKey: SerializationKeys.testTypeLabel) as? String
    self.allowedMultiple = aDecoder.decodeObject(forKey: SerializationKeys.allowedMultiple) as? String
    self.passingMarksLabel = aDecoder.decodeObject(forKey: SerializationKeys.passingMarksLabel) as? String
    self.passingMarks = aDecoder.decodeObject(forKey: SerializationKeys.passingMarks) as? String
    self.totalQuestionsLabel = aDecoder.decodeObject(forKey: SerializationKeys.totalQuestionsLabel) as? String
    self.totalMarks = aDecoder.decodeObject(forKey: SerializationKeys.totalMarks) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(totalQuestions, forKey: SerializationKeys.totalQuestions)
    aCoder.encode(totalDurationLabel, forKey: SerializationKeys.totalDurationLabel)
    aCoder.encode(testType, forKey: SerializationKeys.testType)
    aCoder.encode(totalMarksLabel, forKey: SerializationKeys.totalMarksLabel)
    aCoder.encode(attemptAfterDuedate, forKey: SerializationKeys.attemptAfterDuedate)
    aCoder.encode(reviewAfterAttempt, forKey: SerializationKeys.reviewAfterAttempt)
    aCoder.encode(plateformId, forKey: SerializationKeys.plateformId)
    aCoder.encode(difficultyLevelId, forKey: SerializationKeys.difficultyLevelId)
    aCoder.encode(totalDuration, forKey: SerializationKeys.totalDuration)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(testTypeLabel, forKey: SerializationKeys.testTypeLabel)
    aCoder.encode(allowedMultiple, forKey: SerializationKeys.allowedMultiple)
    aCoder.encode(passingMarksLabel, forKey: SerializationKeys.passingMarksLabel)
    aCoder.encode(passingMarks, forKey: SerializationKeys.passingMarks)
    aCoder.encode(totalQuestionsLabel, forKey: SerializationKeys.totalQuestionsLabel)
    aCoder.encode(totalMarks, forKey: SerializationKeys.totalMarks)
  }

}
