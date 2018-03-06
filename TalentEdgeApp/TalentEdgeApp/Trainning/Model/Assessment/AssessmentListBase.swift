//
//  AssessmentListBase.swift
//
//  Created by Rohit on 29/05/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class AssessmentListBase: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let content = "Content"
    static let test = "Test"
    static let isAlreadyAttempt = "is_already_attempt"
  }

  // MARK: Properties
  public var content: Content?
  public var test: Test?
  public var isAlreadyAttempt: Int?

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
    content = Content(json: json[SerializationKeys.content])
    test = Test(json: json[SerializationKeys.test])
    isAlreadyAttempt = json[SerializationKeys.isAlreadyAttempt].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = content { dictionary[SerializationKeys.content] = value.dictionaryRepresentation() }
    if let value = test { dictionary[SerializationKeys.test] = value.dictionaryRepresentation() }
    if let value = isAlreadyAttempt { dictionary[SerializationKeys.isAlreadyAttempt] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.content = aDecoder.decodeObject(forKey: SerializationKeys.content) as? Content
    self.test = aDecoder.decodeObject(forKey: SerializationKeys.test) as? Test
    self.isAlreadyAttempt = aDecoder.decodeObject(forKey: SerializationKeys.isAlreadyAttempt) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(content, forKey: SerializationKeys.content)
    aCoder.encode(test, forKey: SerializationKeys.test)
    aCoder.encode(isAlreadyAttempt, forKey: SerializationKeys.isAlreadyAttempt)
  }

}
