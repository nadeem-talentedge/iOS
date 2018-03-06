//
//  DiscussionComment.swift
//
//  Created by Temp  on 11/06/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DiscussionComment: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let discussion = "discussion"
    static let comments = "comments"
  }

  // MARK: Properties
  public var discussion: DiscussionChat?
  public var comments: [CommentsChat]?

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
    discussion = DiscussionChat(json: json[SerializationKeys.discussion])
    if let items = json[SerializationKeys.comments].array { comments = items.map { CommentsChat(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = discussion { dictionary[SerializationKeys.discussion] = value.dictionaryRepresentation() }
    if let value = comments { dictionary[SerializationKeys.comments] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.discussion = aDecoder.decodeObject(forKey: SerializationKeys.discussion) as? DiscussionChat
    self.comments = aDecoder.decodeObject(forKey: SerializationKeys.comments) as? [CommentsChat]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(discussion, forKey: SerializationKeys.discussion)
    aCoder.encode(comments, forKey: SerializationKeys.comments)
  }

}
