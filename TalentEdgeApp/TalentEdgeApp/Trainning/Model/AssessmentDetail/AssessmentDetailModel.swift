//
//  AssessmentDetailModel.swift
//
//  Created by Vinod Kumar Sahu on 11/06/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class AssessmentDetailModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let content = "Content"
    static let isAlreadyAttempt = "is_already_attempt"
    static let testQuestion = "TestQuestion"
    static let test = "Test"
    static let module = "Module"
    static let eventDetail = "EventDetail"
    static let canAttempt = "canAttempt"
  }

  // MARK: Properties
  public var content: DetailContent?
  public var isAlreadyAttempt: Int?
  public var testQuestion: [TestQuestion]?
  public var test: DetailTest?
  public var module: DetailModule?
  public var eventDetail: [Any]?
  public var canAttempt: Int?

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
    content = DetailContent(json: json[SerializationKeys.content])
    isAlreadyAttempt = json[SerializationKeys.isAlreadyAttempt].int
    if let items = json[SerializationKeys.testQuestion].array { testQuestion = items.map { TestQuestion(json: $0) } }
    test = DetailTest(json: json[SerializationKeys.test])
    module = DetailModule(json: json[SerializationKeys.module])
    if let items = json[SerializationKeys.eventDetail].array { eventDetail = items.map { $0.object} }
    canAttempt = json[SerializationKeys.canAttempt].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = content { dictionary[SerializationKeys.content] = value.dictionaryRepresentation() }
    if let value = isAlreadyAttempt { dictionary[SerializationKeys.isAlreadyAttempt] = value }
    if let value = testQuestion { dictionary[SerializationKeys.testQuestion] = value.map { $0.dictionaryRepresentation() } }
    if let value = test { dictionary[SerializationKeys.test] = value.dictionaryRepresentation() }
    if let value = module { dictionary[SerializationKeys.module] = value.dictionaryRepresentation() }
    if let value = eventDetail { dictionary[SerializationKeys.eventDetail] = value }
    if let value = canAttempt { dictionary[SerializationKeys.canAttempt] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.content = aDecoder.decodeObject(forKey: SerializationKeys.content) as? DetailContent
    self.isAlreadyAttempt = aDecoder.decodeObject(forKey: SerializationKeys.isAlreadyAttempt) as? Int
    self.testQuestion = aDecoder.decodeObject(forKey: SerializationKeys.testQuestion) as? [TestQuestion]
    self.test = aDecoder.decodeObject(forKey: SerializationKeys.test) as? DetailTest
    self.module = aDecoder.decodeObject(forKey: SerializationKeys.module) as? DetailModule
    self.eventDetail = aDecoder.decodeObject(forKey: SerializationKeys.eventDetail) as? [Any]
    self.canAttempt = aDecoder.decodeObject(forKey: SerializationKeys.canAttempt) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(content, forKey: SerializationKeys.content)
    aCoder.encode(isAlreadyAttempt, forKey: SerializationKeys.isAlreadyAttempt)
    aCoder.encode(testQuestion, forKey: SerializationKeys.testQuestion)
    aCoder.encode(test, forKey: SerializationKeys.test)
    aCoder.encode(module, forKey: SerializationKeys.module)
    aCoder.encode(eventDetail, forKey: SerializationKeys.eventDetail)
    aCoder.encode(canAttempt, forKey: SerializationKeys.canAttempt)
  }

}
