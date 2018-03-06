//
//  NotesanAnalytics.swift
//
//  Created by Vinod Kumar Sahu on 14/11/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class NotesanAnalytics: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let title = "title"
    static let notStarted = "not_started"
    static let completed = "completed"
    static let inProgress = "in_progress"
  }

  // MARK: Properties
  public var title: String?
  public var notStarted: Int?
  public var completed: Int?
  public var inProgress: Int?

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
    title = json[SerializationKeys.title].string
    notStarted = json[SerializationKeys.notStarted].int
    completed = json[SerializationKeys.completed].int
    inProgress = json[SerializationKeys.inProgress].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = notStarted { dictionary[SerializationKeys.notStarted] = value }
    if let value = completed { dictionary[SerializationKeys.completed] = value }
    if let value = inProgress { dictionary[SerializationKeys.inProgress] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.notStarted = aDecoder.decodeObject(forKey: SerializationKeys.notStarted) as? Int
    self.completed = aDecoder.decodeObject(forKey: SerializationKeys.completed) as? Int
    self.inProgress = aDecoder.decodeObject(forKey: SerializationKeys.inProgress) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(notStarted, forKey: SerializationKeys.notStarted)
    aCoder.encode(completed, forKey: SerializationKeys.completed)
    aCoder.encode(inProgress, forKey: SerializationKeys.inProgress)
  }

}
