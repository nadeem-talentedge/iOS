//
//  RWQuestion.swift
//
//  Created by Vinod Kumar on 30/06/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class RWQuestion: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let isStudentCorrect = "is_student_correct"
    static let questionTypeId = "question_type_id"
    static let difficultyLevel = "difficulty_level"
    static let selectedOptionId = "selected_option_id"
    static let isQuestionbank = "is_questionbank"
    static let marksObtain = "marks_obtain"
    static let difficultyLevelId = "difficulty_level_id"
    static let id = "id"
    static let createdBy = "created_by"
    static let marksLabel = "marks_label"
    static let questionType = "question_type"
    static let marks = "marks"
    static let batchId = "batch_id"
    static let moduleId = "module_id"
    static let statement = "statement"
    static let isAttempt = "is_attempt"
  }

  // MARK: Properties
  public var isStudentCorrect: String?
  public var questionTypeId: String?
  public var difficultyLevel: String?
  public var selectedOptionId: [String]?
  public var isQuestionbank: String?
  public var marksObtain: String?
  public var difficultyLevelId: String?
  public var id: String?
  public var createdBy: String?
  public var marksLabel: String?
  public var questionType: String?
  public var marks: String?
  public var batchId: String?
  public var moduleId: String?
  public var statement: String?
  public var isAttempt: String?

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
    isStudentCorrect = json[SerializationKeys.isStudentCorrect].string
    questionTypeId = json[SerializationKeys.questionTypeId].string
    difficultyLevel = json[SerializationKeys.difficultyLevel].string
    if let items = json[SerializationKeys.selectedOptionId].array { selectedOptionId = items.map { $0.stringValue } }
    isQuestionbank = json[SerializationKeys.isQuestionbank].string
    marksObtain = json[SerializationKeys.marksObtain].string
    difficultyLevelId = json[SerializationKeys.difficultyLevelId].string
    id = json[SerializationKeys.id].string
    createdBy = json[SerializationKeys.createdBy].string
    marksLabel = json[SerializationKeys.marksLabel].string
    questionType = json[SerializationKeys.questionType].string
    marks = json[SerializationKeys.marks].string
    batchId = json[SerializationKeys.batchId].string
    moduleId = json[SerializationKeys.moduleId].string
    statement = json[SerializationKeys.statement].string
    isAttempt = json[SerializationKeys.isAttempt].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = isStudentCorrect { dictionary[SerializationKeys.isStudentCorrect] = value }
    if let value = questionTypeId { dictionary[SerializationKeys.questionTypeId] = value }
    if let value = difficultyLevel { dictionary[SerializationKeys.difficultyLevel] = value }
    if let value = selectedOptionId { dictionary[SerializationKeys.selectedOptionId] = value }
    if let value = isQuestionbank { dictionary[SerializationKeys.isQuestionbank] = value }
    if let value = marksObtain { dictionary[SerializationKeys.marksObtain] = value }
    if let value = difficultyLevelId { dictionary[SerializationKeys.difficultyLevelId] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    if let value = marksLabel { dictionary[SerializationKeys.marksLabel] = value }
    if let value = questionType { dictionary[SerializationKeys.questionType] = value }
    if let value = marks { dictionary[SerializationKeys.marks] = value }
    if let value = batchId { dictionary[SerializationKeys.batchId] = value }
    if let value = moduleId { dictionary[SerializationKeys.moduleId] = value }
    if let value = statement { dictionary[SerializationKeys.statement] = value }
    if let value = isAttempt { dictionary[SerializationKeys.isAttempt] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.isStudentCorrect = aDecoder.decodeObject(forKey: SerializationKeys.isStudentCorrect) as? String
    self.questionTypeId = aDecoder.decodeObject(forKey: SerializationKeys.questionTypeId) as? String
    self.difficultyLevel = aDecoder.decodeObject(forKey: SerializationKeys.difficultyLevel) as? String
    self.selectedOptionId = aDecoder.decodeObject(forKey: SerializationKeys.selectedOptionId) as? [String]
    self.isQuestionbank = aDecoder.decodeObject(forKey: SerializationKeys.isQuestionbank) as? String
    self.marksObtain = aDecoder.decodeObject(forKey: SerializationKeys.marksObtain) as? String
    self.difficultyLevelId = aDecoder.decodeObject(forKey: SerializationKeys.difficultyLevelId) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? String
    self.marksLabel = aDecoder.decodeObject(forKey: SerializationKeys.marksLabel) as? String
    self.questionType = aDecoder.decodeObject(forKey: SerializationKeys.questionType) as? String
    self.marks = aDecoder.decodeObject(forKey: SerializationKeys.marks) as? String
    self.batchId = aDecoder.decodeObject(forKey: SerializationKeys.batchId) as? String
    self.moduleId = aDecoder.decodeObject(forKey: SerializationKeys.moduleId) as? String
    self.statement = aDecoder.decodeObject(forKey: SerializationKeys.statement) as? String
    self.isAttempt = aDecoder.decodeObject(forKey: SerializationKeys.isAttempt) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(isStudentCorrect, forKey: SerializationKeys.isStudentCorrect)
    aCoder.encode(questionTypeId, forKey: SerializationKeys.questionTypeId)
    aCoder.encode(difficultyLevel, forKey: SerializationKeys.difficultyLevel)
    aCoder.encode(selectedOptionId, forKey: SerializationKeys.selectedOptionId)
    aCoder.encode(isQuestionbank, forKey: SerializationKeys.isQuestionbank)
    aCoder.encode(marksObtain, forKey: SerializationKeys.marksObtain)
    aCoder.encode(difficultyLevelId, forKey: SerializationKeys.difficultyLevelId)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
    aCoder.encode(marksLabel, forKey: SerializationKeys.marksLabel)
    aCoder.encode(questionType, forKey: SerializationKeys.questionType)
    aCoder.encode(marks, forKey: SerializationKeys.marks)
    aCoder.encode(batchId, forKey: SerializationKeys.batchId)
    aCoder.encode(moduleId, forKey: SerializationKeys.moduleId)
    aCoder.encode(statement, forKey: SerializationKeys.statement)
    aCoder.encode(isAttempt, forKey: SerializationKeys.isAttempt)
  }

}
