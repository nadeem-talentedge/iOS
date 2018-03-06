//
//  IssuedTo.swift
//
//  Created by Vinod Kumar Sahu on 03/01/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class IssuedToModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let empId = "emp_id"
    static let designaiton = "designaiton"
  }

  // MARK: Properties
  public var name: String?
  public var empId: String?
  public var designaiton: String?

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
    empId = json[SerializationKeys.empId].string
    designaiton = json[SerializationKeys.designaiton].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = empId { dictionary[SerializationKeys.empId] = value }
    if let value = designaiton { dictionary[SerializationKeys.designaiton] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.empId = aDecoder.decodeObject(forKey: SerializationKeys.empId) as? String
    self.designaiton = aDecoder.decodeObject(forKey: SerializationKeys.designaiton) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(empId, forKey: SerializationKeys.empId)
    aCoder.encode(designaiton, forKey: SerializationKeys.designaiton)
  }

}
