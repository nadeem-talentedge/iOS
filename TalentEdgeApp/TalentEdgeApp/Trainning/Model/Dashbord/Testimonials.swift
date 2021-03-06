//
//  Testimonials.swift
//
//  Created by Vinod Kumar Sahu on 21/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Testimonials: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let descriptionValue = "description"
    static let createdDate = "created_date"
    static let createdBy = "created_by"
  }

  // MARK: Properties
  public var descriptionValue: String?
  public var createdDate: String?
  public var createdBy: String?

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
    descriptionValue = json[SerializationKeys.descriptionValue].string
    createdDate = json[SerializationKeys.createdDate].string
    createdBy = json[SerializationKeys.createdBy].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = createdDate { dictionary[SerializationKeys.createdDate] = value }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.createdDate = aDecoder.decodeObject(forKey: SerializationKeys.createdDate) as? String
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(createdDate, forKey: SerializationKeys.createdDate)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
  }

}
