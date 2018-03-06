//
//  Question.swift
//
//  Created by Vinod Kumar Sahu on 11/06/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Question: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let questionTypeId = "question_type_id"
    static let isQuestionbank = "is_questionbank"
    static let difficultyLevelId = "difficulty_level_id"
    static let id = "id"
    static let modifiedOn = "modified_on"
    static let createdBy = "created_by"
    static let isDeleted = "is_deleted"
    static let isPractice = "is_practice"
    static let createdOn = "created_on"
    static let marks = "marks"
    static let batchId = "batch_id"
    static let moduleId = "module_id"
    static let statement = "statement"
  }

  // MARK: Properties
  public var questionTypeId: String?
  public var isQuestionbank: String?
  public var difficultyLevelId: String?
  public var id: String?
  public var modifiedOn: String?
  public var createdBy: String?
  public var isDeleted: Bool? = false
  public var isPractice: Bool? = false
  public var createdOn: String?
  public var marks: String?
  public var batchId: String?
  public var moduleId: String?
  public var statement: String?

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
    questionTypeId = json[SerializationKeys.questionTypeId].string
    isQuestionbank = json[SerializationKeys.isQuestionbank].string
    difficultyLevelId = json[SerializationKeys.difficultyLevelId].string
    id = json[SerializationKeys.id].string
    modifiedOn = json[SerializationKeys.modifiedOn].string
    createdBy = json[SerializationKeys.createdBy].string
    isDeleted = json[SerializationKeys.isDeleted].boolValue
    isPractice = json[SerializationKeys.isPractice].boolValue
    createdOn = json[SerializationKeys.createdOn].string
    marks = json[SerializationKeys.marks].string
    batchId = json[SerializationKeys.batchId].string
    moduleId = json[SerializationKeys.moduleId].string
    statement = json[SerializationKeys.statement].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = questionTypeId { dictionary[SerializationKeys.questionTypeId] = value }
    if let value = isQuestionbank { dictionary[SerializationKeys.isQuestionbank] = value }
    if let value = difficultyLevelId { dictionary[SerializationKeys.difficultyLevelId] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = modifiedOn { dictionary[SerializationKeys.modifiedOn] = value }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    dictionary[SerializationKeys.isDeleted] = isDeleted
    dictionary[SerializationKeys.isPractice] = isPractice
    if let value = createdOn { dictionary[SerializationKeys.createdOn] = value }
    if let value = marks { dictionary[SerializationKeys.marks] = value }
    if let value = batchId { dictionary[SerializationKeys.batchId] = value }
    if let value = moduleId { dictionary[SerializationKeys.moduleId] = value }
    if let value = statement { dictionary[SerializationKeys.statement] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.questionTypeId = aDecoder.decodeObject(forKey: SerializationKeys.questionTypeId) as? String
    self.isQuestionbank = aDecoder.decodeObject(forKey: SerializationKeys.isQuestionbank) as? String
    self.difficultyLevelId = aDecoder.decodeObject(forKey: SerializationKeys.difficultyLevelId) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.modifiedOn = aDecoder.decodeObject(forKey: SerializationKeys.modifiedOn) as? String
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? String
    self.isDeleted = aDecoder.decodeBool(forKey: SerializationKeys.isDeleted)
    self.isPractice = aDecoder.decodeBool(forKey: SerializationKeys.isPractice)
    self.createdOn = aDecoder.decodeObject(forKey: SerializationKeys.createdOn) as? String
    self.marks = aDecoder.decodeObject(forKey: SerializationKeys.marks) as? String
    self.batchId = aDecoder.decodeObject(forKey: SerializationKeys.batchId) as? String
    self.moduleId = aDecoder.decodeObject(forKey: SerializationKeys.moduleId) as? String
    self.statement = aDecoder.decodeObject(forKey: SerializationKeys.statement) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(questionTypeId, forKey: SerializationKeys.questionTypeId)
    aCoder.encode(isQuestionbank, forKey: SerializationKeys.isQuestionbank)
    aCoder.encode(difficultyLevelId, forKey: SerializationKeys.difficultyLevelId)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(modifiedOn, forKey: SerializationKeys.modifiedOn)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
    aCoder.encode(isDeleted, forKey: SerializationKeys.isDeleted)
    aCoder.encode(isPractice, forKey: SerializationKeys.isPractice)
    aCoder.encode(createdOn, forKey: SerializationKeys.createdOn)
    aCoder.encode(marks, forKey: SerializationKeys.marks)
    aCoder.encode(batchId, forKey: SerializationKeys.batchId)
    aCoder.encode(moduleId, forKey: SerializationKeys.moduleId)
    aCoder.encode(statement, forKey: SerializationKeys.statement)
  }

}
