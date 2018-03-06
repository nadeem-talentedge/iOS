//
//  RFReferral.swift
//
//  Created by Vinod Kumar Sahu on 16/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class RFReferral: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let modified = "modified"
    static let uploadPath = "upload_path"
    static let createdBy = "created_by"
    static let rid = "rid"
    static let created = "created"
    static let modifiedBy = "modified_by"
  }

  // MARK: Properties
  public var status: String?
  public var modified: String?
  public var uploadPath: String?
  public var createdBy: String?
  public var rid: String?
  public var created: String?
  public var modifiedBy: String?

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
    status = json[SerializationKeys.status].string
    modified = json[SerializationKeys.modified].string
    uploadPath = json[SerializationKeys.uploadPath].string
    createdBy = json[SerializationKeys.createdBy].string
    rid = json[SerializationKeys.rid].string
    created = json[SerializationKeys.created].string
    modifiedBy = json[SerializationKeys.modifiedBy].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = modified { dictionary[SerializationKeys.modified] = value }
    if let value = uploadPath { dictionary[SerializationKeys.uploadPath] = value }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    if let value = rid { dictionary[SerializationKeys.rid] = value }
    if let value = created { dictionary[SerializationKeys.created] = value }
    if let value = modifiedBy { dictionary[SerializationKeys.modifiedBy] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? String
    self.modified = aDecoder.decodeObject(forKey: SerializationKeys.modified) as? String
    self.uploadPath = aDecoder.decodeObject(forKey: SerializationKeys.uploadPath) as? String
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? String
    self.rid = aDecoder.decodeObject(forKey: SerializationKeys.rid) as? String
    self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? String
    self.modifiedBy = aDecoder.decodeObject(forKey: SerializationKeys.modifiedBy) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(modified, forKey: SerializationKeys.modified)
    aCoder.encode(uploadPath, forKey: SerializationKeys.uploadPath)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
    aCoder.encode(rid, forKey: SerializationKeys.rid)
    aCoder.encode(created, forKey: SerializationKeys.created)
    aCoder.encode(modifiedBy, forKey: SerializationKeys.modifiedBy)
  }

}
