//
//  Queries.swift
//
//  Created by Vinod Kumar Sahu on 14/11/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Queries: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let numQueriesAnswered = "num_queries_answered"
    static let numQueries = "num_queries"
    static let numStudents = "num_students"
  }

  // MARK: Properties
  public var numQueriesAnswered: String?
  public var numQueries: String?
  public var numStudents: String?

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
    numQueriesAnswered = json[SerializationKeys.numQueriesAnswered].string
    numQueries = json[SerializationKeys.numQueries].string
    numStudents = json[SerializationKeys.numStudents].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = numQueriesAnswered { dictionary[SerializationKeys.numQueriesAnswered] = value }
    if let value = numQueries { dictionary[SerializationKeys.numQueries] = value }
    if let value = numStudents { dictionary[SerializationKeys.numStudents] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.numQueriesAnswered = aDecoder.decodeObject(forKey: SerializationKeys.numQueriesAnswered) as? String
    self.numQueries = aDecoder.decodeObject(forKey: SerializationKeys.numQueries) as? String
    self.numStudents = aDecoder.decodeObject(forKey: SerializationKeys.numStudents) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(numQueriesAnswered, forKey: SerializationKeys.numQueriesAnswered)
    aCoder.encode(numQueries, forKey: SerializationKeys.numQueries)
    aCoder.encode(numStudents, forKey: SerializationKeys.numStudents)
  }

}
