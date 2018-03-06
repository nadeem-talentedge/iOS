//
//  RFStatusCount.swift
//
//  Created by Vinod Kumar Sahu on 16/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class RFStatusCount: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let rejected = "rejected"
    static let notRelevant = "not_relevant"
    static let shortlisted = "shortlisted"
    static let selected = "selected"
    static let notViewed = "not_viewed"
    static let viewed = "viewed"
  }

  // MARK: Properties
  public var rejected: String?
  public var notRelevant: String?
  public var shortlisted: String?
  public var selected: String?
  public var notViewed: String?
  public var viewed: String?

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
    rejected = json[SerializationKeys.rejected].string
    notRelevant = json[SerializationKeys.notRelevant].string
    shortlisted = json[SerializationKeys.shortlisted].string
    selected = json[SerializationKeys.selected].string
    notViewed = json[SerializationKeys.notViewed].string
    viewed = json[SerializationKeys.viewed].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = rejected { dictionary[SerializationKeys.rejected] = value }
    if let value = notRelevant { dictionary[SerializationKeys.notRelevant] = value }
    if let value = shortlisted { dictionary[SerializationKeys.shortlisted] = value }
    if let value = selected { dictionary[SerializationKeys.selected] = value }
    if let value = notViewed { dictionary[SerializationKeys.notViewed] = value }
    if let value = viewed { dictionary[SerializationKeys.viewed] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.rejected = aDecoder.decodeObject(forKey: SerializationKeys.rejected) as? String
    self.notRelevant = aDecoder.decodeObject(forKey: SerializationKeys.notRelevant) as? String
    self.shortlisted = aDecoder.decodeObject(forKey: SerializationKeys.shortlisted) as? String
    self.selected = aDecoder.decodeObject(forKey: SerializationKeys.selected) as? String
    self.notViewed = aDecoder.decodeObject(forKey: SerializationKeys.notViewed) as? String
    self.viewed = aDecoder.decodeObject(forKey: SerializationKeys.viewed) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(rejected, forKey: SerializationKeys.rejected)
    aCoder.encode(notRelevant, forKey: SerializationKeys.notRelevant)
    aCoder.encode(shortlisted, forKey: SerializationKeys.shortlisted)
    aCoder.encode(selected, forKey: SerializationKeys.selected)
    aCoder.encode(notViewed, forKey: SerializationKeys.notViewed)
    aCoder.encode(viewed, forKey: SerializationKeys.viewed)
  }

}
