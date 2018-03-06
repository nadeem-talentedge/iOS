//
//  TEAppSettingModel.swift
//
//  Created by Vinod Kumar on 04/08/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TEAppSettingModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let appTheme = "AppTheme"
    static let menuItem = "menuItem"
  }

  // MARK: Properties
  public var appTheme: TEAppTheme?
  public var menuItem: [TEMenuItem]?

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
    appTheme = TEAppTheme(json: json[SerializationKeys.appTheme])
    if let items = json[SerializationKeys.menuItem].array { menuItem = items.map { TEMenuItem(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = appTheme { dictionary[SerializationKeys.appTheme] = value.dictionaryRepresentation() }
    if let value = menuItem { dictionary[SerializationKeys.menuItem] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.appTheme = aDecoder.decodeObject(forKey: SerializationKeys.appTheme) as? TEAppTheme
    self.menuItem = aDecoder.decodeObject(forKey: SerializationKeys.menuItem) as? [TEMenuItem]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(appTheme, forKey: SerializationKeys.appTheme)
    aCoder.encode(menuItem, forKey: SerializationKeys.menuItem)
  }

}
