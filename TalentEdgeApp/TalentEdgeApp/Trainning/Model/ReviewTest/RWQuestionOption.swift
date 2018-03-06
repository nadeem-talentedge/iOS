//
//  RWQuestionOption.swift
//
//  Created by Vinod Kumar on 30/06/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class RWQuestionOption: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let optionStatement = "option_statement"
    static let questionId = "question_id"
    static let id = "id"
    static let isCorrectOption = "is_correct_option"
    static let explanation = "explanation"
  }

  // MARK: Properties
  public var optionStatement: String?
  public var questionId: String?
  public var id: String?
  public var isCorrectOption: Bool? = false
  public var explanation: String?

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
    optionStatement = json[SerializationKeys.optionStatement].string
    questionId = json[SerializationKeys.questionId].string
    id = json[SerializationKeys.id].string
    isCorrectOption = json[SerializationKeys.isCorrectOption].boolValue
    explanation = json[SerializationKeys.explanation].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = optionStatement { dictionary[SerializationKeys.optionStatement] = value }
    if let value = questionId { dictionary[SerializationKeys.questionId] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    dictionary[SerializationKeys.isCorrectOption] = isCorrectOption
    if let value = explanation { dictionary[SerializationKeys.explanation] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.optionStatement = aDecoder.decodeObject(forKey: SerializationKeys.optionStatement) as? String
    self.questionId = aDecoder.decodeObject(forKey: SerializationKeys.questionId) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.isCorrectOption = aDecoder.decodeBool(forKey: SerializationKeys.isCorrectOption)
    self.explanation = aDecoder.decodeObject(forKey: SerializationKeys.explanation) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(optionStatement, forKey: SerializationKeys.optionStatement)
    aCoder.encode(questionId, forKey: SerializationKeys.questionId)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(isCorrectOption, forKey: SerializationKeys.isCorrectOption)
    aCoder.encode(explanation, forKey: SerializationKeys.explanation)
  }

}
