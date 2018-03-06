//
//  TEAppTheme.swift
//
//  Created by Vinod Kumar on 04/08/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TEAppTheme: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let headingTextColor4 = "heading_text_color_4"
    static let themeColor10 = "theme_color_10"
    static let themeColor8 = "theme_color_8"
    static let headingTextColor2 = "heading_text_color_2"
    static let headingTextColor1 = "heading_text_color_1"
    static let themeColor2 = "theme_color_2"
    static let headingTextColor5 = "heading_text_color_5"
    static let themeColor6 = "theme_color_6"
    static let themeColor4 = "theme_color_4"
    static let themeColor7 = "theme_color_7"
    static let themeColor5 = "theme_color_5"
    static let themeColor1 = "theme_color_1"
    static let headingTextColor3 = "heading_text_color_3"
    static let themeColor3 = "theme_color_3"
    static let themeColor9 = "theme_color_9"
  }

  // MARK: Properties
  public var headingTextColor4: TEHeadingTextColor4?
  public var themeColor10: TEThemeColor10?
  public var themeColor8: TEThemeColor8?
  public var headingTextColor2: TEHeadingTextColor2?
  public var headingTextColor1: TEHeadingTextColor1?
  public var themeColor2: TEThemeColor2?
  public var headingTextColor5: TEHeadingTextColor5?
  public var themeColor6: TEThemeColor6?
  public var themeColor4: TEThemeColor4?
  public var themeColor7: TEThemeColor7?
  public var themeColor5: TEThemeColor5?
  public var themeColor1: TEThemeColor1?
  public var headingTextColor3: TEHeadingTextColor3?
  public var themeColor3: TEThemeColor3?
  public var themeColor9: TEThemeColor9?

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
    headingTextColor4 = TEHeadingTextColor4(json: json[SerializationKeys.headingTextColor4])
    themeColor10 = TEThemeColor10(json: json[SerializationKeys.themeColor10])
    themeColor8 = TEThemeColor8(json: json[SerializationKeys.themeColor8])
    headingTextColor2 = TEHeadingTextColor2(json: json[SerializationKeys.headingTextColor2])
    headingTextColor1 = TEHeadingTextColor1(json: json[SerializationKeys.headingTextColor1])
    themeColor2 = TEThemeColor2(json: json[SerializationKeys.themeColor2])
    headingTextColor5 = TEHeadingTextColor5(json: json[SerializationKeys.headingTextColor5])
    themeColor6 = TEThemeColor6(json: json[SerializationKeys.themeColor6])
    themeColor4 = TEThemeColor4(json: json[SerializationKeys.themeColor4])
    themeColor7 = TEThemeColor7(json: json[SerializationKeys.themeColor7])
    themeColor5 = TEThemeColor5(json: json[SerializationKeys.themeColor5])
    themeColor1 = TEThemeColor1(json: json[SerializationKeys.themeColor1])
    headingTextColor3 = TEHeadingTextColor3(json: json[SerializationKeys.headingTextColor3])
    themeColor3 = TEThemeColor3(json: json[SerializationKeys.themeColor3])
    themeColor9 = TEThemeColor9(json: json[SerializationKeys.themeColor9])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = headingTextColor4 { dictionary[SerializationKeys.headingTextColor4] = value.dictionaryRepresentation() }
    if let value = themeColor10 { dictionary[SerializationKeys.themeColor10] = value.dictionaryRepresentation() }
    if let value = themeColor8 { dictionary[SerializationKeys.themeColor8] = value.dictionaryRepresentation() }
    if let value = headingTextColor2 { dictionary[SerializationKeys.headingTextColor2] = value.dictionaryRepresentation() }
    if let value = headingTextColor1 { dictionary[SerializationKeys.headingTextColor1] = value.dictionaryRepresentation() }
    if let value = themeColor2 { dictionary[SerializationKeys.themeColor2] = value.dictionaryRepresentation() }
    if let value = headingTextColor5 { dictionary[SerializationKeys.headingTextColor5] = value.dictionaryRepresentation() }
    if let value = themeColor6 { dictionary[SerializationKeys.themeColor6] = value.dictionaryRepresentation() }
    if let value = themeColor4 { dictionary[SerializationKeys.themeColor4] = value.dictionaryRepresentation() }
    if let value = themeColor7 { dictionary[SerializationKeys.themeColor7] = value.dictionaryRepresentation() }
    if let value = themeColor5 { dictionary[SerializationKeys.themeColor5] = value.dictionaryRepresentation() }
    if let value = themeColor1 { dictionary[SerializationKeys.themeColor1] = value.dictionaryRepresentation() }
    if let value = headingTextColor3 { dictionary[SerializationKeys.headingTextColor3] = value.dictionaryRepresentation() }
    if let value = themeColor3 { dictionary[SerializationKeys.themeColor3] = value.dictionaryRepresentation() }
    if let value = themeColor9 { dictionary[SerializationKeys.themeColor9] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.headingTextColor4 = aDecoder.decodeObject(forKey: SerializationKeys.headingTextColor4) as? TEHeadingTextColor4
    self.themeColor10 = aDecoder.decodeObject(forKey: SerializationKeys.themeColor10) as? TEThemeColor10
    self.themeColor8 = aDecoder.decodeObject(forKey: SerializationKeys.themeColor8) as? TEThemeColor8
    self.headingTextColor2 = aDecoder.decodeObject(forKey: SerializationKeys.headingTextColor2) as? TEHeadingTextColor2
    self.headingTextColor1 = aDecoder.decodeObject(forKey: SerializationKeys.headingTextColor1) as? TEHeadingTextColor1
    self.themeColor2 = aDecoder.decodeObject(forKey: SerializationKeys.themeColor2) as? TEThemeColor2
    self.headingTextColor5 = aDecoder.decodeObject(forKey: SerializationKeys.headingTextColor5) as? TEHeadingTextColor5
    self.themeColor6 = aDecoder.decodeObject(forKey: SerializationKeys.themeColor6) as? TEThemeColor6
    self.themeColor4 = aDecoder.decodeObject(forKey: SerializationKeys.themeColor4) as? TEThemeColor4
    self.themeColor7 = aDecoder.decodeObject(forKey: SerializationKeys.themeColor7) as? TEThemeColor7
    self.themeColor5 = aDecoder.decodeObject(forKey: SerializationKeys.themeColor5) as? TEThemeColor5
    self.themeColor1 = aDecoder.decodeObject(forKey: SerializationKeys.themeColor1) as? TEThemeColor1
    self.headingTextColor3 = aDecoder.decodeObject(forKey: SerializationKeys.headingTextColor3) as? TEHeadingTextColor3
    self.themeColor3 = aDecoder.decodeObject(forKey: SerializationKeys.themeColor3) as? TEThemeColor3
    self.themeColor9 = aDecoder.decodeObject(forKey: SerializationKeys.themeColor9) as? TEThemeColor9
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(headingTextColor4, forKey: SerializationKeys.headingTextColor4)
    aCoder.encode(themeColor10, forKey: SerializationKeys.themeColor10)
    aCoder.encode(themeColor8, forKey: SerializationKeys.themeColor8)
    aCoder.encode(headingTextColor2, forKey: SerializationKeys.headingTextColor2)
    aCoder.encode(headingTextColor1, forKey: SerializationKeys.headingTextColor1)
    aCoder.encode(themeColor2, forKey: SerializationKeys.themeColor2)
    aCoder.encode(headingTextColor5, forKey: SerializationKeys.headingTextColor5)
    aCoder.encode(themeColor6, forKey: SerializationKeys.themeColor6)
    aCoder.encode(themeColor4, forKey: SerializationKeys.themeColor4)
    aCoder.encode(themeColor7, forKey: SerializationKeys.themeColor7)
    aCoder.encode(themeColor5, forKey: SerializationKeys.themeColor5)
    aCoder.encode(themeColor1, forKey: SerializationKeys.themeColor1)
    aCoder.encode(headingTextColor3, forKey: SerializationKeys.headingTextColor3)
    aCoder.encode(themeColor3, forKey: SerializationKeys.themeColor3)
    aCoder.encode(themeColor9, forKey: SerializationKeys.themeColor9)
  }

}
