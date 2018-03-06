//
//  ResultData.swift
//
//  Created by Vinod Kumar on 18/09/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ResultData: NSObject,NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let appInfo = "app_info"
    static let user = "user"
    static let counsellor = "counsellor"
  }

  // MARK: Properties
  public var appInfo: [AppInfo]?
  public var user: User?
  public var counsellor: Counsellor?

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
    if let items = json[SerializationKeys.appInfo].array { appInfo = items.map { AppInfo(json: $0) } }
    user = User(json: json[SerializationKeys.user])
    counsellor = Counsellor(json: json[SerializationKeys.counsellor])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = appInfo { dictionary[SerializationKeys.appInfo] = value.map { $0.dictionaryRepresentation() } }
    if let value = user { dictionary[SerializationKeys.user] = value.dictionaryRepresentation() }
    if let value = counsellor { dictionary[SerializationKeys.counsellor] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.appInfo = aDecoder.decodeObject(forKey: SerializationKeys.appInfo) as? [AppInfo]
    self.user = aDecoder.decodeObject(forKey: SerializationKeys.user) as? User
    self.counsellor = aDecoder.decodeObject(forKey: SerializationKeys.counsellor) as? Counsellor
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(appInfo, forKey: SerializationKeys.appInfo)
    aCoder.encode(user, forKey: SerializationKeys.user)
    aCoder.encode(counsellor, forKey: SerializationKeys.counsellor)
  }

}
