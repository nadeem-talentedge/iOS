//
//  TEEventModel.swift
//
//  Created by Vinod Kumar on 27/07/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TEEventModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let message = "message"
    static let timestamp = "timestamp"
    static let code = "code"
    static let events = "resultData"
    static let aSSETSBASEURL = "ASSETS_BASE_URL"
  }

  // MARK: Properties
  public var status: Int?
  public var message: String?
  public var timestamp: Int?
  public var code: Int?
  public var events: [Events]?
  public var aSSETSBASEURL: String?

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
    status = json[SerializationKeys.status].int
    message = json[SerializationKeys.message].string
    timestamp = json[SerializationKeys.timestamp].int
    code = json[SerializationKeys.code].int
    if let items = json[SerializationKeys.events].array { events = items.map { Events(json: $0) } }
    aSSETSBASEURL = json[SerializationKeys.aSSETSBASEURL].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = timestamp { dictionary[SerializationKeys.timestamp] = value }
    if let value = code { dictionary[SerializationKeys.code] = value }
    if let value = events { dictionary[SerializationKeys.events] = value.map { $0.dictionaryRepresentation() } }
    if let value = aSSETSBASEURL { dictionary[SerializationKeys.aSSETSBASEURL] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
    self.timestamp = aDecoder.decodeObject(forKey: SerializationKeys.timestamp) as? Int
    self.code = aDecoder.decodeObject(forKey: SerializationKeys.code) as? Int
    self.events = aDecoder.decodeObject(forKey: SerializationKeys.events) as? [Events]
    self.aSSETSBASEURL = aDecoder.decodeObject(forKey: SerializationKeys.aSSETSBASEURL) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(message, forKey: SerializationKeys.message)
    aCoder.encode(timestamp, forKey: SerializationKeys.timestamp)
    aCoder.encode(code, forKey: SerializationKeys.code)
    aCoder.encode(events, forKey: SerializationKeys.events)
    aCoder.encode(aSSETSBASEURL, forKey: SerializationKeys.aSSETSBASEURL)
  }

}
