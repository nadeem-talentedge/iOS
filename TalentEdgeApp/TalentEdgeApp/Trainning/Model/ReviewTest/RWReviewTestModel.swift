//
//  RWReviewTestModel.swift
//
//  Created by Vinod Kumar on 30/06/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class RWReviewTestModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let content = "Content"
    static let attemptDetails = "AttemptDetails"
    static let module = "Module"
    static let eventDetail = "EventDetail"
    static let testQuestion = "TestQuestion"
    static let test = "Test"
  }

  // MARK: Properties
  public var content: RWContent?
  public var attemptDetails: RWAttemptDetails?
  public var module: RWModule?
  public var eventDetail: [Any]?
  public var testQuestion: [RWTestQuestion]?
  public var test: RWTest?

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
    content = RWContent(json: json[SerializationKeys.content])
    attemptDetails = RWAttemptDetails(json: json[SerializationKeys.attemptDetails])
    module = RWModule(json: json[SerializationKeys.module])
    if let items = json[SerializationKeys.eventDetail].array { eventDetail = items.map { $0.object} }
    if let items = json[SerializationKeys.testQuestion].array { testQuestion = items.map { RWTestQuestion(json: $0) } }
    test = RWTest(json: json[SerializationKeys.test])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = content { dictionary[SerializationKeys.content] = value.dictionaryRepresentation() }
    if let value = attemptDetails { dictionary[SerializationKeys.attemptDetails] = value.dictionaryRepresentation() }
    if let value = module { dictionary[SerializationKeys.module] = value.dictionaryRepresentation() }
    if let value = eventDetail { dictionary[SerializationKeys.eventDetail] = value }
    if let value = testQuestion { dictionary[SerializationKeys.testQuestion] = value.map { $0.dictionaryRepresentation() } }
    if let value = test { dictionary[SerializationKeys.test] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.content = aDecoder.decodeObject(forKey: SerializationKeys.content) as? RWContent
    self.attemptDetails = aDecoder.decodeObject(forKey: SerializationKeys.attemptDetails) as? RWAttemptDetails
    self.module = aDecoder.decodeObject(forKey: SerializationKeys.module) as? RWModule
    self.eventDetail = aDecoder.decodeObject(forKey: SerializationKeys.eventDetail) as? [Any]
    self.testQuestion = aDecoder.decodeObject(forKey: SerializationKeys.testQuestion) as? [RWTestQuestion]
    self.test = aDecoder.decodeObject(forKey: SerializationKeys.test) as? RWTest
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(content, forKey: SerializationKeys.content)
    aCoder.encode(attemptDetails, forKey: SerializationKeys.attemptDetails)
    aCoder.encode(module, forKey: SerializationKeys.module)
    aCoder.encode(eventDetail, forKey: SerializationKeys.eventDetail)
    aCoder.encode(testQuestion, forKey: SerializationKeys.testQuestion)
    aCoder.encode(test, forKey: SerializationKeys.test)
  }

}
