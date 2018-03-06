//
//  Assignment.swift
//
//  Created by Vinod Kumar on 09/06/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Assignment: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let instructions = "instructions"
    static let isGraded = "is_graded"
    static let id = "id"
    static let allowedMultiple = "allowed_multiple"
    static let multipleSubmissionLabel = "multiple_submission_label"
    static let duedateLabel = "duedate_label"
    static let submissionLabel = "submission_label"
    static let attemptAfterDuedate = "attempt_after_duedate"
    static let gradedLabel = "graded_label"
    static let submissionMode = "submission_mode"
    static let passingMarks = "passing_marks"
    static let totalMarks = "total_marks"
    
  }

  // MARK: Properties
  public var instructions: String?
  public var isGraded: String?
  public var id: String?
  public var allowedMultiple: String?
  public var multipleSubmissionLabel: String?
  public var duedateLabel: String?
  public var submissionLabel: String?
  public var attemptAfterDuedate: String?
  public var gradedLabel: String?
  public var submissionMode: String?
  public var passingMarks: String?
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
    instructions = json[SerializationKeys.instructions].string
    isGraded = json[SerializationKeys.isGraded].string
    id = json[SerializationKeys.id].string
    allowedMultiple = json[SerializationKeys.allowedMultiple].string
    multipleSubmissionLabel = json[SerializationKeys.multipleSubmissionLabel].string
    duedateLabel = json[SerializationKeys.duedateLabel].string
    submissionLabel = json[SerializationKeys.submissionLabel].string
    attemptAfterDuedate = json[SerializationKeys.attemptAfterDuedate].string
    gradedLabel = json[SerializationKeys.gradedLabel].string
    submissionMode = json[SerializationKeys.submissionMode].string
    passingMarks = json[SerializationKeys.passingMarks].string
    totalMarks = json[SerializationKeys.totalMarks].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = instructions { dictionary[SerializationKeys.instructions] = value }
    if let value = isGraded { dictionary[SerializationKeys.isGraded] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = allowedMultiple { dictionary[SerializationKeys.allowedMultiple] = value }
    if let value = multipleSubmissionLabel { dictionary[SerializationKeys.multipleSubmissionLabel] = value }
    if let value = duedateLabel { dictionary[SerializationKeys.duedateLabel] = value }
    if let value = submissionLabel { dictionary[SerializationKeys.submissionLabel] = value }
    if let value = attemptAfterDuedate { dictionary[SerializationKeys.attemptAfterDuedate] = value }
    if let value = gradedLabel { dictionary[SerializationKeys.gradedLabel] = value }
    if let value = submissionMode { dictionary[SerializationKeys.submissionMode] = value }
    if let value = passingMarks { dictionary[SerializationKeys.passingMarks] = value }
    if let value = totalMarks { dictionary[SerializationKeys.totalMarks] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.instructions = aDecoder.decodeObject(forKey: SerializationKeys.instructions) as? String
    self.isGraded = aDecoder.decodeObject(forKey: SerializationKeys.isGraded) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.allowedMultiple = aDecoder.decodeObject(forKey: SerializationKeys.allowedMultiple) as? String
    self.multipleSubmissionLabel = aDecoder.decodeObject(forKey: SerializationKeys.multipleSubmissionLabel) as? String
    self.duedateLabel = aDecoder.decodeObject(forKey: SerializationKeys.duedateLabel) as? String
    self.submissionLabel = aDecoder.decodeObject(forKey: SerializationKeys.submissionLabel) as? String
    self.attemptAfterDuedate = aDecoder.decodeObject(forKey: SerializationKeys.attemptAfterDuedate) as? String
    self.gradedLabel = aDecoder.decodeObject(forKey: SerializationKeys.gradedLabel) as? String
    self.submissionMode = aDecoder.decodeObject(forKey: SerializationKeys.submissionMode) as? String
    self.passingMarks = aDecoder.decodeObject(forKey: SerializationKeys.passingMarks) as? String
    self.totalMarks = aDecoder.decodeObject(forKey: SerializationKeys.totalMarks) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(instructions, forKey: SerializationKeys.instructions)
    aCoder.encode(isGraded, forKey: SerializationKeys.isGraded)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(allowedMultiple, forKey: SerializationKeys.allowedMultiple)
    aCoder.encode(multipleSubmissionLabel, forKey: SerializationKeys.multipleSubmissionLabel)
    aCoder.encode(duedateLabel, forKey: SerializationKeys.duedateLabel)
    aCoder.encode(submissionLabel, forKey: SerializationKeys.submissionLabel)
    aCoder.encode(attemptAfterDuedate, forKey: SerializationKeys.attemptAfterDuedate)
    aCoder.encode(gradedLabel, forKey: SerializationKeys.gradedLabel)
    aCoder.encode(submissionMode, forKey: SerializationKeys.submissionMode)
    aCoder.encode(passingMarks, forKey: SerializationKeys.passingMarks)
    aCoder.encode(totalMarks, forKey: SerializationKeys.totalMarks)
  }

}
