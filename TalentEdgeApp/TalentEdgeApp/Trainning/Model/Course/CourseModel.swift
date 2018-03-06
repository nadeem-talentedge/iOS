//
//  CourseModel.swift
//
//  Created by Vinod Kumar Sahu on 19/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CourseModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let externalCourse = "external"
    static let internalCourse = "internal"
  }

  // MARK: Properties
  public var externalCourse: [ExternalCourse]?
  public var internalCourse: [InternalCourse]?

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
    
    if let items = json[SerializationKeys.externalCourse].array { externalCourse = items.map { ExternalCourse(json: $0) } }
    
    if let items = json[SerializationKeys.internalCourse].array { internalCourse = items.map { InternalCourse(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    
    if let value = externalCourse { dictionary[SerializationKeys.externalCourse] = value.map { $0.dictionaryRepresentation() } }
    
    if let value = internalCourse { dictionary[SerializationKeys.internalCourse] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    
    self.externalCourse = aDecoder.decodeObject(forKey: SerializationKeys.externalCourse) as? [ExternalCourse]
    
    self.internalCourse = aDecoder.decodeObject(forKey: SerializationKeys.internalCourse) as? [InternalCourse]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(externalCourse, forKey: SerializationKeys.externalCourse)
    aCoder.encode(internalCourse, forKey: SerializationKeys.internalCourse)
  }

}
