//
//  SelfBatchStudentModel.swift
//
//  Created by Vinod Kumar on 30/06/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SelfBatchStudentModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let assignment = "assignment"
    static let id = "id"
    static let image = "image"
    static let isSelf = "self"
    static let assessment = "assessment"
    static let query = "query"
    static let lastActive = "last_active"
    static let attendance = "attendance"
    static let moduleCompleted = "module_completed"
  }

  // MARK: Properties
  public var name: String?
  public var assignment: BatchAssignment?
  public var id: String?
  public var image: String?
  public var isSelf: Int?
  public var assessment: BatchAssessment?
  public var query: Int?
  public var lastActive: String?
  public var attendance: String?
  public var moduleCompleted: String?

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
    name = json[SerializationKeys.name].string
    assignment = BatchAssignment(json: json[SerializationKeys.assignment])
    id = json[SerializationKeys.id].string
    image = json[SerializationKeys.image].string
    isSelf = json[SerializationKeys.isSelf].int
    assessment = BatchAssessment(json: json[SerializationKeys.assessment])
    query = json[SerializationKeys.query].int
    lastActive = json[SerializationKeys.lastActive].string
    attendance = json[SerializationKeys.attendance].string
    moduleCompleted = json[SerializationKeys.moduleCompleted].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = assignment { dictionary[SerializationKeys.assignment] = value.dictionaryRepresentation() }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = isSelf { dictionary[SerializationKeys.isSelf] = value }
    if let value = assessment { dictionary[SerializationKeys.assessment] = value.dictionaryRepresentation() }
    if let value = query { dictionary[SerializationKeys.query] = value }
    if let value = lastActive { dictionary[SerializationKeys.lastActive] = value }
    if let value = attendance { dictionary[SerializationKeys.attendance] = value }
    if let value = moduleCompleted { dictionary[SerializationKeys.moduleCompleted] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.assignment = aDecoder.decodeObject(forKey: SerializationKeys.assignment) as? BatchAssignment
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    self.isSelf = aDecoder.decodeObject(forKey: SerializationKeys.isSelf) as? Int
    self.assessment = aDecoder.decodeObject(forKey: SerializationKeys.assessment) as? BatchAssessment
    self.query = aDecoder.decodeObject(forKey: SerializationKeys.query) as? Int
    self.lastActive = aDecoder.decodeObject(forKey: SerializationKeys.lastActive) as? String
    self.attendance = aDecoder.decodeObject(forKey: SerializationKeys.attendance) as? String
    self.moduleCompleted = aDecoder.decodeObject(forKey: SerializationKeys.moduleCompleted) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(assignment, forKey: SerializationKeys.assignment)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(image, forKey: SerializationKeys.image)
    aCoder.encode(isSelf, forKey: SerializationKeys.isSelf)
    aCoder.encode(assessment, forKey: SerializationKeys.assessment)
    aCoder.encode(query, forKey: SerializationKeys.query)
    aCoder.encode(lastActive, forKey: SerializationKeys.lastActive)
    aCoder.encode(attendance, forKey: SerializationKeys.attendance)
    aCoder.encode(moduleCompleted, forKey: SerializationKeys.moduleCompleted)
  }

}
