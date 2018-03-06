//
//  UserContentView.swift
//
//  Created by Vinod Kumar on 08/06/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class UserContentView: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let checkedPages = "checked_pages"
    static let viewPages = "view_pages"
    static let lastPage = "last_page"
    static let lastView = "last_view"
  }

  // MARK: Properties
  public var checkedPages: String?
  public var viewPages: String?
  public var lastPage: String?
  public var lastView: String?

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
    checkedPages = json[SerializationKeys.checkedPages].string
    viewPages = json[SerializationKeys.viewPages].string
    lastPage = json[SerializationKeys.lastPage].string
    lastView = json[SerializationKeys.lastView].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = checkedPages { dictionary[SerializationKeys.checkedPages] = value }
    if let value = viewPages { dictionary[SerializationKeys.viewPages] = value }
    if let value = lastPage { dictionary[SerializationKeys.lastPage] = value }
    if let value = lastView { dictionary[SerializationKeys.lastView] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.checkedPages = aDecoder.decodeObject(forKey: SerializationKeys.checkedPages) as? String
    self.viewPages = aDecoder.decodeObject(forKey: SerializationKeys.viewPages) as? String
    self.lastPage = aDecoder.decodeObject(forKey: SerializationKeys.lastPage) as? String
    self.lastView = aDecoder.decodeObject(forKey: SerializationKeys.lastView) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(checkedPages, forKey: SerializationKeys.checkedPages)
    aCoder.encode(viewPages, forKey: SerializationKeys.viewPages)
    aCoder.encode(lastPage, forKey: SerializationKeys.lastPage)
    aCoder.encode(lastView, forKey: SerializationKeys.lastView)
  }

}
