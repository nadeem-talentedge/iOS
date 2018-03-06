//
//  CertificateDetail.swift
//
//  Created by Vinod Kumar Sahu on 03/01/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CertificateDetailModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let batchName = "batch_name"
    static let issuedBy = "issued_by"
    static let batchStartDate = "batch_start_date"
    static let certificatePath = "certificate_path"
    static let batchId = "batch_id"
    static let issuedOn = "issued_on"
    static let batchEndDate = "batch_end_date"
  }

  // MARK: Properties
  public var batchName: String?
  public var issuedBy: String?
  public var batchStartDate: String?
  public var certificatePath: String?
  public var batchId: Int?
  public var issuedOn: String?
  public var batchEndDate: String?

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
    batchName = json[SerializationKeys.batchName].string
    issuedBy = json[SerializationKeys.issuedBy].string
    batchStartDate = json[SerializationKeys.batchStartDate].string
    certificatePath = json[SerializationKeys.certificatePath].string
    batchId = json[SerializationKeys.batchId].int
    issuedOn = json[SerializationKeys.issuedOn].string
    batchEndDate = json[SerializationKeys.batchEndDate].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = batchName { dictionary[SerializationKeys.batchName] = value }
    if let value = issuedBy { dictionary[SerializationKeys.issuedBy] = value }
    if let value = batchStartDate { dictionary[SerializationKeys.batchStartDate] = value }
    if let value = certificatePath { dictionary[SerializationKeys.certificatePath] = value }
    if let value = batchId { dictionary[SerializationKeys.batchId] = value }
    if let value = issuedOn { dictionary[SerializationKeys.issuedOn] = value }
    if let value = batchEndDate { dictionary[SerializationKeys.batchEndDate] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.batchName = aDecoder.decodeObject(forKey: SerializationKeys.batchName) as? String
    self.issuedBy = aDecoder.decodeObject(forKey: SerializationKeys.issuedBy) as? String
    self.batchStartDate = aDecoder.decodeObject(forKey: SerializationKeys.batchStartDate) as? String
    self.certificatePath = aDecoder.decodeObject(forKey: SerializationKeys.certificatePath) as? String
    self.batchId = aDecoder.decodeObject(forKey: SerializationKeys.batchId) as? Int
    self.issuedOn = aDecoder.decodeObject(forKey: SerializationKeys.issuedOn) as? String
    self.batchEndDate = aDecoder.decodeObject(forKey: SerializationKeys.batchEndDate) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(batchName, forKey: SerializationKeys.batchName)
    aCoder.encode(issuedBy, forKey: SerializationKeys.issuedBy)
    aCoder.encode(batchStartDate, forKey: SerializationKeys.batchStartDate)
    aCoder.encode(certificatePath, forKey: SerializationKeys.certificatePath)
    aCoder.encode(batchId, forKey: SerializationKeys.batchId)
    aCoder.encode(issuedOn, forKey: SerializationKeys.issuedOn)
    aCoder.encode(batchEndDate, forKey: SerializationKeys.batchEndDate)
  }

}
