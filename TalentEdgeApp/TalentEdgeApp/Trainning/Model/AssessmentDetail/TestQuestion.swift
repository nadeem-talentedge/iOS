//
//  TestQuestion.swift
//
//  Created by Vinod Kumar Sahu on 11/06/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TestQuestion: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let question = "Question"
    static let questionId = "question_id"
    static let id = "id"
    static let testId = "test_id"
    static let contentId = "content_id"
  }

  // MARK: Properties
  public var question: Question?
  public var questionId: String?
  public var id: String?
  public var testId: String?
  public var contentId: String?

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
    question = Question(json: json[SerializationKeys.question])
    questionId = json[SerializationKeys.questionId].string
    id = json[SerializationKeys.id].string
    testId = json[SerializationKeys.testId].string
    contentId = json[SerializationKeys.contentId].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = question { dictionary[SerializationKeys.question] = value.dictionaryRepresentation() }
    if let value = questionId { dictionary[SerializationKeys.questionId] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = testId { dictionary[SerializationKeys.testId] = value }
    if let value = contentId { dictionary[SerializationKeys.contentId] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.question = aDecoder.decodeObject(forKey: SerializationKeys.question) as? Question
    self.questionId = aDecoder.decodeObject(forKey: SerializationKeys.questionId) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.testId = aDecoder.decodeObject(forKey: SerializationKeys.testId) as? String
    self.contentId = aDecoder.decodeObject(forKey: SerializationKeys.contentId) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(question, forKey: SerializationKeys.question)
    aCoder.encode(questionId, forKey: SerializationKeys.questionId)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(testId, forKey: SerializationKeys.testId)
    aCoder.encode(contentId, forKey: SerializationKeys.contentId)
  }

}
