//
//  TeacherLearner.swift
//
//  Created by Vinod Kumar on 30/09/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TeacherLearner: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let myself = "self"
    static let name = "name"
    static let id = "id"
    static let image = "image"
    static let learnerdetaiassessment = "assessment"
    static let query = "query"
    static let lastActive = "last_active"
    static let attendance = "attendance"
    static let moduleCompleted = "module_completed"
    static let learnerdetailassignment = "assignment"
  }

  // MARK: Properties
  public var myself: Int?
  public var name: String?
  public var id: String?
  public var image: String?
  public var learnerdetaiassessment: Learnerdetaiassessment?
  public var query: Int?
  public var lastActive: String?
  public var attendance: String?
  public var moduleCompleted: String?
  public var learnerdetailassignment: Learnerdetailassignment?

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
    myself = json[SerializationKeys.myself].int
    name = json[SerializationKeys.name].string
    id = json[SerializationKeys.id].string
    image = json[SerializationKeys.image].string
    learnerdetaiassessment = Learnerdetaiassessment(json: json[SerializationKeys.learnerdetaiassessment])
    query = json[SerializationKeys.query].int
    lastActive = json[SerializationKeys.lastActive].string
    attendance = json[SerializationKeys.attendance].string
    moduleCompleted = json[SerializationKeys.moduleCompleted].string
    learnerdetailassignment = Learnerdetailassignment(json: json[SerializationKeys.learnerdetailassignment])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = myself { dictionary[SerializationKeys.myself] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = learnerdetaiassessment { dictionary[SerializationKeys.learnerdetaiassessment] = value.dictionaryRepresentation() }
    if let value = query { dictionary[SerializationKeys.query] = value }
    if let value = lastActive { dictionary[SerializationKeys.lastActive] = value }
    if let value = attendance { dictionary[SerializationKeys.attendance] = value }
    if let value = moduleCompleted { dictionary[SerializationKeys.moduleCompleted] = value }
    if let value = learnerdetailassignment { dictionary[SerializationKeys.learnerdetailassignment] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.myself = aDecoder.decodeObject(forKey: SerializationKeys.myself) as? Int
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    self.learnerdetaiassessment = aDecoder.decodeObject(forKey: SerializationKeys.learnerdetaiassessment) as? Learnerdetaiassessment
    self.query = aDecoder.decodeObject(forKey: SerializationKeys.query) as? Int
    self.lastActive = aDecoder.decodeObject(forKey: SerializationKeys.lastActive) as? String
    self.attendance = aDecoder.decodeObject(forKey: SerializationKeys.attendance) as? String
    self.moduleCompleted = aDecoder.decodeObject(forKey: SerializationKeys.moduleCompleted) as? String
    self.learnerdetailassignment = aDecoder.decodeObject(forKey: SerializationKeys.learnerdetailassignment) as? Learnerdetailassignment
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(myself, forKey: SerializationKeys.myself)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(image, forKey: SerializationKeys.image)
    aCoder.encode(learnerdetaiassessment, forKey: SerializationKeys.learnerdetaiassessment)
    aCoder.encode(query, forKey: SerializationKeys.query)
    aCoder.encode(lastActive, forKey: SerializationKeys.lastActive)
    aCoder.encode(attendance, forKey: SerializationKeys.attendance)
    aCoder.encode(moduleCompleted, forKey: SerializationKeys.moduleCompleted)
    aCoder.encode(learnerdetailassignment, forKey: SerializationKeys.learnerdetailassignment)
  }

}
