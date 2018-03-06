//
//  AssigmentDetailModel.swift
//
//  Created by Vinod Kumar on 09/06/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class AssigmentDetailModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let content = "Content"
    static let module = "Module"
    static let canAttempt = "canAttempt"
    static let isAlreadyAttempt = "is_already_attempt"
    static let assignment = "Assignment"
  }

  // MARK: Properties
  public var content: AssignmentContent?
  public var module: Module?
  public var canAttempt: Int?
  public var isAlreadyAttempt: Int?
  public var assignment: Assignment?

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
    content = AssignmentContent(json: json[SerializationKeys.content])
    module = Module(json: json[SerializationKeys.module])
    canAttempt = json[SerializationKeys.canAttempt].int
    isAlreadyAttempt = json[SerializationKeys.isAlreadyAttempt].int
    assignment = Assignment(json: json[SerializationKeys.assignment])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = content { dictionary[SerializationKeys.content] = value.dictionaryRepresentation() }
    if let value = module { dictionary[SerializationKeys.module] = value.dictionaryRepresentation() }
    if let value = canAttempt { dictionary[SerializationKeys.canAttempt] = value }
    if let value = isAlreadyAttempt { dictionary[SerializationKeys.isAlreadyAttempt] = value }
    if let value = assignment { dictionary[SerializationKeys.assignment] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.content = aDecoder.decodeObject(forKey: SerializationKeys.content) as? AssignmentContent
    self.module = aDecoder.decodeObject(forKey: SerializationKeys.module) as? Module
    self.canAttempt = aDecoder.decodeObject(forKey: SerializationKeys.canAttempt) as? Int
    self.isAlreadyAttempt = aDecoder.decodeObject(forKey: SerializationKeys.isAlreadyAttempt) as? Int
    self.assignment = aDecoder.decodeObject(forKey: SerializationKeys.assignment) as? Assignment
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(content, forKey: SerializationKeys.content)
    aCoder.encode(module, forKey: SerializationKeys.module)
    aCoder.encode(canAttempt, forKey: SerializationKeys.canAttempt)
    aCoder.encode(isAlreadyAttempt, forKey: SerializationKeys.isAlreadyAttempt)
    aCoder.encode(assignment, forKey: SerializationKeys.assignment)
  }

}
