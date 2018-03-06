//
//  TeacherAssessmentModel.swift
//
//  Created by Vinod Kumar Sahu on 23/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TeacherAssessmentModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let endDate = "end_date"
    static let cntAttempted = "cnt_attempted"
    static let cntNotAttempted = "cnt_not_attempted"
    static let testType = "test_type"
    static let totalDurationFormatted = "total_duration_formatted"
    static let startDateFormatted = "start_date_formatted"
    static let descriptionValue = "description"
    static let endDateFormatted = "end_date_formatted"
    static let totalDuration = "total_duration"
    static let moduleName = "module_name"
    static let id = "id"
    static let title = "title"
    static let avgCompletionPercentage = "avg_completion_percentage"
    static let startDate = "start_date"
    static let totalQuestions = "total_questions"
    static let totalMarks = "total_marks"
  }

  // MARK: Properties
  public var endDate: String?
  public var cntAttempted: String?
  public var cntNotAttempted: String?
  public var testType: String?
  public var totalDurationFormatted: String?
  public var startDateFormatted: String?
  public var descriptionValue: String?
  public var endDateFormatted: String?
  public var totalDuration: String?
  public var moduleName: String?
  public var id: String?
  public var title: String?
  public var avgCompletionPercentage: String?
  public var startDate: String?
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
    endDate = json[SerializationKeys.endDate].string
    cntAttempted = json[SerializationKeys.cntAttempted].string
    cntNotAttempted = json[SerializationKeys.cntNotAttempted].string
    testType = json[SerializationKeys.testType].string
    totalDurationFormatted = json[SerializationKeys.totalDurationFormatted].string
    startDateFormatted = json[SerializationKeys.startDateFormatted].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    endDateFormatted = json[SerializationKeys.endDateFormatted].string
    totalDuration = json[SerializationKeys.totalDuration].string
    moduleName = json[SerializationKeys.moduleName].string
    id = json[SerializationKeys.id].string
    title = json[SerializationKeys.title].string
    avgCompletionPercentage = json[SerializationKeys.avgCompletionPercentage].string
    startDate = json[SerializationKeys.startDate].string
    totalQuestions = json[SerializationKeys.totalQuestions].string
    totalMarks = json[SerializationKeys.totalMarks].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    if let value = cntAttempted { dictionary[SerializationKeys.cntAttempted] = value }
    if let value = cntNotAttempted { dictionary[SerializationKeys.cntNotAttempted] = value }
    if let value = testType { dictionary[SerializationKeys.testType] = value }
    if let value = totalDurationFormatted { dictionary[SerializationKeys.totalDurationFormatted] = value }
    if let value = startDateFormatted { dictionary[SerializationKeys.startDateFormatted] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = endDateFormatted { dictionary[SerializationKeys.endDateFormatted] = value }
    if let value = totalDuration { dictionary[SerializationKeys.totalDuration] = value }
    if let value = moduleName { dictionary[SerializationKeys.moduleName] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = avgCompletionPercentage { dictionary[SerializationKeys.avgCompletionPercentage] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = totalQuestions { dictionary[SerializationKeys.totalQuestions] = value }
    if let value = totalMarks { dictionary[SerializationKeys.totalMarks] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
    self.cntAttempted = aDecoder.decodeObject(forKey: SerializationKeys.cntAttempted) as? String
    self.cntNotAttempted = aDecoder.decodeObject(forKey: SerializationKeys.cntNotAttempted) as? String
    self.testType = aDecoder.decodeObject(forKey: SerializationKeys.testType) as? String
    self.totalDurationFormatted = aDecoder.decodeObject(forKey: SerializationKeys.totalDurationFormatted) as? String
    self.startDateFormatted = aDecoder.decodeObject(forKey: SerializationKeys.startDateFormatted) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.endDateFormatted = aDecoder.decodeObject(forKey: SerializationKeys.endDateFormatted) as? String
    self.totalDuration = aDecoder.decodeObject(forKey: SerializationKeys.totalDuration) as? String
    self.moduleName = aDecoder.decodeObject(forKey: SerializationKeys.moduleName) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.avgCompletionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.avgCompletionPercentage) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.totalQuestions = aDecoder.decodeObject(forKey: SerializationKeys.totalQuestions) as? String
    self.totalMarks = aDecoder.decodeObject(forKey: SerializationKeys.totalMarks) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
    aCoder.encode(cntAttempted, forKey: SerializationKeys.cntAttempted)
    aCoder.encode(cntNotAttempted, forKey: SerializationKeys.cntNotAttempted)
    aCoder.encode(testType, forKey: SerializationKeys.testType)
    aCoder.encode(totalDurationFormatted, forKey: SerializationKeys.totalDurationFormatted)
    aCoder.encode(startDateFormatted, forKey: SerializationKeys.startDateFormatted)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(endDateFormatted, forKey: SerializationKeys.endDateFormatted)
    aCoder.encode(totalDuration, forKey: SerializationKeys.totalDuration)
    aCoder.encode(moduleName, forKey: SerializationKeys.moduleName)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(avgCompletionPercentage, forKey: SerializationKeys.avgCompletionPercentage)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(totalQuestions, forKey: SerializationKeys.totalQuestions)
    aCoder.encode(totalMarks, forKey: SerializationKeys.totalMarks)
  }

}
