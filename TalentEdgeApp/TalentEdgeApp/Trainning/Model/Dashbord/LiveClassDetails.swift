//
//  LiveClassDetails.swift
//
//  Created by Vinod Kumar on 05/07/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class LiveClassDetails: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let descriptionValue = "description"
    static let date = "date"
    static let title = "title"
    static let contentDuration = "content_duration"
    static let id = "id"
    static let time = "time"
  }

  // MARK: Properties
  public var descriptionValue: String?
  public var date: String?
  public var title: String?
  public var contentDuration: String?
  public var id: String?
  public var time: String?

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
    descriptionValue = json[SerializationKeys.descriptionValue].string
    date = json[SerializationKeys.date].string
    title = json[SerializationKeys.title].string
    contentDuration = json[SerializationKeys.contentDuration].string
    id = json[SerializationKeys.id].string
    time = json[SerializationKeys.time].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = date { dictionary[SerializationKeys.date] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = contentDuration { dictionary[SerializationKeys.contentDuration] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = time { dictionary[SerializationKeys.time] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.date = aDecoder.decodeObject(forKey: SerializationKeys.date) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.contentDuration = aDecoder.decodeObject(forKey: SerializationKeys.contentDuration) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.time = aDecoder.decodeObject(forKey: SerializationKeys.time) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(date, forKey: SerializationKeys.date)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(contentDuration, forKey: SerializationKeys.contentDuration)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(time, forKey: SerializationKeys.time)
  }

}
