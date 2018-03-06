//
//  StudentAttemptInfoModel.swift
//
//  Created by Vinod Kumar Sahu on 26/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class StudentAttemptInfoModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let dateAttemptedFormatted = "date_attempted_formatted"
    static let email = "email"
    static let attemptId = "attempt_id"
    static let timeTaken = "time_taken"
    static let pic = "pic"
    static let wrongQuestions = "wrong_questions"
    static let attemptedQuestions = "attempted_questions"
    static let correctQuestions = "correct_questions"
    static let dateAttempted = "date_attempted"
    static let marks = "marks"
    static let skippedQuestions = "skipped_questions"
    static let userId = "user_id"
    static let totalQuestions = "total_questions"
    static let totalMarks = "total_marks"
  }

  // MARK: Properties
  public var name: String?
  public var dateAttemptedFormatted: String?
  public var email: String?
  public var attemptId: String?
  public var timeTaken: Int?
  public var pic: String?
  public var wrongQuestions: Int?
  public var attemptedQuestions: Int?
  public var correctQuestions: Int?
  public var dateAttempted: String?
  public var marks: Int?
  public var skippedQuestions: Int?
  public var userId: String?
  public var totalQuestions: String?
  public var totalMarks: String?

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
    name = json[SerializationKeys.name].string
    dateAttemptedFormatted = json[SerializationKeys.dateAttemptedFormatted].string
    email = json[SerializationKeys.email].string
    attemptId = json[SerializationKeys.attemptId].string
    timeTaken = json[SerializationKeys.timeTaken].int
    pic = json[SerializationKeys.pic].string
    wrongQuestions = json[SerializationKeys.wrongQuestions].int
    attemptedQuestions = json[SerializationKeys.attemptedQuestions].int
    correctQuestions = json[SerializationKeys.correctQuestions].int
    dateAttempted = json[SerializationKeys.dateAttempted].string
    marks = json[SerializationKeys.marks].int
    skippedQuestions = json[SerializationKeys.skippedQuestions].int
    userId = json[SerializationKeys.userId].string
    totalQuestions = json[SerializationKeys.totalQuestions].string
    totalMarks = json[SerializationKeys.totalMarks].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = dateAttemptedFormatted { dictionary[SerializationKeys.dateAttemptedFormatted] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = attemptId { dictionary[SerializationKeys.attemptId] = value }
    if let value = timeTaken { dictionary[SerializationKeys.timeTaken] = value }
    if let value = pic { dictionary[SerializationKeys.pic] = value }
    if let value = wrongQuestions { dictionary[SerializationKeys.wrongQuestions] = value }
    if let value = attemptedQuestions { dictionary[SerializationKeys.attemptedQuestions] = value }
    if let value = correctQuestions { dictionary[SerializationKeys.correctQuestions] = value }
    if let value = dateAttempted { dictionary[SerializationKeys.dateAttempted] = value }
    if let value = marks { dictionary[SerializationKeys.marks] = value }
    if let value = skippedQuestions { dictionary[SerializationKeys.skippedQuestions] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = totalQuestions { dictionary[SerializationKeys.totalQuestions] = value }
    if let value = totalMarks { dictionary[SerializationKeys.totalMarks] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.dateAttemptedFormatted = aDecoder.decodeObject(forKey: SerializationKeys.dateAttemptedFormatted) as? String
    self.email = aDecoder.decodeObject(forKey: SerializationKeys.email) as? String
    self.attemptId = aDecoder.decodeObject(forKey: SerializationKeys.attemptId) as? String
    self.timeTaken = aDecoder.decodeObject(forKey: SerializationKeys.timeTaken) as? Int
    self.pic = aDecoder.decodeObject(forKey: SerializationKeys.pic) as? String
    self.wrongQuestions = aDecoder.decodeObject(forKey: SerializationKeys.wrongQuestions) as? Int
    self.attemptedQuestions = aDecoder.decodeObject(forKey: SerializationKeys.attemptedQuestions) as? Int
    self.correctQuestions = aDecoder.decodeObject(forKey: SerializationKeys.correctQuestions) as? Int
    self.dateAttempted = aDecoder.decodeObject(forKey: SerializationKeys.dateAttempted) as? String
    self.marks = aDecoder.decodeObject(forKey: SerializationKeys.marks) as? Int
    self.skippedQuestions = aDecoder.decodeObject(forKey: SerializationKeys.skippedQuestions) as? Int
    self.userId = aDecoder.decodeObject(forKey: SerializationKeys.userId) as? String
    self.totalQuestions = aDecoder.decodeObject(forKey: SerializationKeys.totalQuestions) as? String
    self.totalMarks = aDecoder.decodeObject(forKey: SerializationKeys.totalMarks) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(dateAttemptedFormatted, forKey: SerializationKeys.dateAttemptedFormatted)
    aCoder.encode(email, forKey: SerializationKeys.email)
    aCoder.encode(attemptId, forKey: SerializationKeys.attemptId)
    aCoder.encode(timeTaken, forKey: SerializationKeys.timeTaken)
    aCoder.encode(pic, forKey: SerializationKeys.pic)
    aCoder.encode(wrongQuestions, forKey: SerializationKeys.wrongQuestions)
    aCoder.encode(attemptedQuestions, forKey: SerializationKeys.attemptedQuestions)
    aCoder.encode(correctQuestions, forKey: SerializationKeys.correctQuestions)
    aCoder.encode(dateAttempted, forKey: SerializationKeys.dateAttempted)
    aCoder.encode(marks, forKey: SerializationKeys.marks)
    aCoder.encode(skippedQuestions, forKey: SerializationKeys.skippedQuestions)
    aCoder.encode(userId, forKey: SerializationKeys.userId)
    aCoder.encode(totalQuestions, forKey: SerializationKeys.totalQuestions)
    aCoder.encode(totalMarks, forKey: SerializationKeys.totalMarks)
  }

}
