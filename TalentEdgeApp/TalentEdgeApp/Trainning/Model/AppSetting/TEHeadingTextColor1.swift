//
//  TEHeadingTextColor1.swift
//
//  Created by Vinod Kumar on 04/08/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TEHeadingTextColor1: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let green = "green"
    static let alpha = "alpha"
    static let red = "red"
    static let blue = "blue"
  }

  // MARK: Properties
  public var green: Int?
  public var alpha: Int?
  public var red: Int?
  public var blue: Int?

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
    green = json[SerializationKeys.green].int
    alpha = json[SerializationKeys.alpha].int
    red = json[SerializationKeys.red].int
    blue = json[SerializationKeys.blue].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = green { dictionary[SerializationKeys.green] = value }
    if let value = alpha { dictionary[SerializationKeys.alpha] = value }
    if let value = red { dictionary[SerializationKeys.red] = value }
    if let value = blue { dictionary[SerializationKeys.blue] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.green = aDecoder.decodeObject(forKey: SerializationKeys.green) as? Int
    self.alpha = aDecoder.decodeObject(forKey: SerializationKeys.alpha) as? Int
    self.red = aDecoder.decodeObject(forKey: SerializationKeys.red) as? Int
    self.blue = aDecoder.decodeObject(forKey: SerializationKeys.blue) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(green, forKey: SerializationKeys.green)
    aCoder.encode(alpha, forKey: SerializationKeys.alpha)
    aCoder.encode(red, forKey: SerializationKeys.red)
    aCoder.encode(blue, forKey: SerializationKeys.blue)
  }

}
