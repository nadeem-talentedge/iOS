//
//  RWTestQuestion.swift
//
//  Created by Vinod Kumar on 30/06/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class RWTestQuestion: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let questionOption = "QuestionOption"
    static let question = "Question"
  }

  // MARK: Properties
  public var questionOption: [RWQuestionOption]?
  public var question: RWQuestion?

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
    if let items = json[SerializationKeys.questionOption].array { questionOption = items.map { RWQuestionOption(json: $0) } }
    question = RWQuestion(json: json[SerializationKeys.question])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = questionOption { dictionary[SerializationKeys.questionOption] = value.map { $0.dictionaryRepresentation() } }
    if let value = question { dictionary[SerializationKeys.question] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.questionOption = aDecoder.decodeObject(forKey: SerializationKeys.questionOption) as? [RWQuestionOption]
    self.question = aDecoder.decodeObject(forKey: SerializationKeys.question) as? RWQuestion
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(questionOption, forKey: SerializationKeys.questionOption)
    aCoder.encode(question, forKey: SerializationKeys.question)
  }

}
