//
//  LoginBase.swift
//
//  Created by Vinod Kumar on 18/09/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class LoginBase: NSObject,NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let message = "message"
    static let code = "code"
    static let token = "token"
    static let resultData = "resultData"
  }

  // MARK: Properties
  public var status: Int?
  public var message: String?
  public var code: Int?
  public var token: String?
  public var resultData: ResultData?

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
    code = json[SerializationKeys.code].int
    token = json[SerializationKeys.token].string
    resultData = ResultData(json: json[SerializationKeys.resultData])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = code { dictionary[SerializationKeys.code] = value }
    if let value = token { dictionary[SerializationKeys.token] = value }
    if let value = resultData { dictionary[SerializationKeys.resultData] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
    self.code = aDecoder.decodeObject(forKey: SerializationKeys.code) as? Int
    self.token = aDecoder.decodeObject(forKey: SerializationKeys.token) as? String
    self.resultData = aDecoder.decodeObject(forKey: SerializationKeys.resultData) as? ResultData
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(message, forKey: SerializationKeys.message)
    aCoder.encode(code, forKey: SerializationKeys.code)
    aCoder.encode(token, forKey: SerializationKeys.token)
    aCoder.encode(resultData, forKey: SerializationKeys.resultData)
  }

}
