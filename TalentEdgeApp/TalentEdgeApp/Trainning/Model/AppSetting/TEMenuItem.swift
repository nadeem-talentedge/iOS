//
//  TEMenuItem.swift
//
//  Created by Vinod Kumar on 04/08/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TEMenuItem: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let icon = "icon"
    static let submenu = "submenu"
    static let title = "title"
  }

  // MARK: Properties
  public var icon: String?
  public var submenu: [Any]?
  public var title: String?

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
    icon = json[SerializationKeys.icon].string
    if let items = json[SerializationKeys.submenu].array { submenu = items.map { $0.object} }
    title = json[SerializationKeys.title].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = icon { dictionary[SerializationKeys.icon] = value }
    if let value = submenu { dictionary[SerializationKeys.submenu] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.icon = aDecoder.decodeObject(forKey: SerializationKeys.icon) as? String
    self.submenu = aDecoder.decodeObject(forKey: SerializationKeys.submenu) as? [Any]
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(icon, forKey: SerializationKeys.icon)
    aCoder.encode(submenu, forKey: SerializationKeys.submenu)
    aCoder.encode(title, forKey: SerializationKeys.title)
  }

}
