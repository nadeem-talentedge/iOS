//
//  StudentSubmissionInfoModel.swift
//
//  Created by Vinod Kumar Sahu on 26/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class StudentSubmissionInfoModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let assignmentMarks = "assignment_marks"
    static let email = "email"
    static let reviewedDate = "reviewed_date"
    static let uploadedDate = "uploaded_date"
    static let pic = "pic"
    static let uploadPath = "upload_path"
    static let lname = "lname"
    static let uploadedDateFormatted = "uploaded_date_formatted"
    static let reviewedDateFormatted = "reviewed_date_formatted"
    static let submissionId = "submission_id"
    static let userId = "user_id"
    static let fname = "fname"
    static let isReceived = "is_received"
    static let marksGivenByFaculty = "marks_given_by_faculty"
  }

  // MARK: Properties
  public var assignmentMarks: String?
  public var email: String?
  public var reviewedDate: String?
  public var uploadedDate: String?
  public var pic: String?
  public var uploadPath: String?
  public var lname: String?
  public var uploadedDateFormatted: String?
  public var reviewedDateFormatted: String?
  public var submissionId: String?
  public var userId: String?
  public var fname: String?
  public var isReceived: String?
  public var marksGivenByFaculty: String?

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
    assignmentMarks = json[SerializationKeys.assignmentMarks].string
    email = json[SerializationKeys.email].string
    reviewedDate = json[SerializationKeys.reviewedDate].string
    uploadedDate = json[SerializationKeys.uploadedDate].string
    pic = json[SerializationKeys.pic].string
    uploadPath = json[SerializationKeys.uploadPath].string
    lname = json[SerializationKeys.lname].string
    uploadedDateFormatted = json[SerializationKeys.uploadedDateFormatted].string
    reviewedDateFormatted = json[SerializationKeys.reviewedDateFormatted].string
    submissionId = json[SerializationKeys.submissionId].string
    userId = json[SerializationKeys.userId].string
    fname = json[SerializationKeys.fname].string
    isReceived = json[SerializationKeys.isReceived].string
    marksGivenByFaculty = json[SerializationKeys.marksGivenByFaculty].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = assignmentMarks { dictionary[SerializationKeys.assignmentMarks] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = reviewedDate { dictionary[SerializationKeys.reviewedDate] = value }
    if let value = uploadedDate { dictionary[SerializationKeys.uploadedDate] = value }
    if let value = pic { dictionary[SerializationKeys.pic] = value }
    if let value = uploadPath { dictionary[SerializationKeys.uploadPath] = value }
    if let value = lname { dictionary[SerializationKeys.lname] = value }
    if let value = uploadedDateFormatted { dictionary[SerializationKeys.uploadedDateFormatted] = value }
    if let value = reviewedDateFormatted { dictionary[SerializationKeys.reviewedDateFormatted] = value }
    if let value = submissionId { dictionary[SerializationKeys.submissionId] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = fname { dictionary[SerializationKeys.fname] = value }
    if let value = isReceived { dictionary[SerializationKeys.isReceived] = value }
    if let value = marksGivenByFaculty { dictionary[SerializationKeys.marksGivenByFaculty] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.assignmentMarks = aDecoder.decodeObject(forKey: SerializationKeys.assignmentMarks) as? String
    self.email = aDecoder.decodeObject(forKey: SerializationKeys.email) as? String
    self.reviewedDate = aDecoder.decodeObject(forKey: SerializationKeys.reviewedDate) as? String
    self.uploadedDate = aDecoder.decodeObject(forKey: SerializationKeys.uploadedDate) as? String
    self.pic = aDecoder.decodeObject(forKey: SerializationKeys.pic) as? String
    self.uploadPath = aDecoder.decodeObject(forKey: SerializationKeys.uploadPath) as? String
    self.lname = aDecoder.decodeObject(forKey: SerializationKeys.lname) as? String
    self.uploadedDateFormatted = aDecoder.decodeObject(forKey: SerializationKeys.uploadedDateFormatted) as? String
    self.reviewedDateFormatted = aDecoder.decodeObject(forKey: SerializationKeys.reviewedDateFormatted) as? String
    self.submissionId = aDecoder.decodeObject(forKey: SerializationKeys.submissionId) as? String
    self.userId = aDecoder.decodeObject(forKey: SerializationKeys.userId) as? String
    self.fname = aDecoder.decodeObject(forKey: SerializationKeys.fname) as? String
    self.isReceived = aDecoder.decodeObject(forKey: SerializationKeys.isReceived) as? String
    self.marksGivenByFaculty = aDecoder.decodeObject(forKey: SerializationKeys.marksGivenByFaculty) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(assignmentMarks, forKey: SerializationKeys.assignmentMarks)
    aCoder.encode(email, forKey: SerializationKeys.email)
    aCoder.encode(reviewedDate, forKey: SerializationKeys.reviewedDate)
    aCoder.encode(uploadedDate, forKey: SerializationKeys.uploadedDate)
    aCoder.encode(pic, forKey: SerializationKeys.pic)
    aCoder.encode(uploadPath, forKey: SerializationKeys.uploadPath)
    aCoder.encode(lname, forKey: SerializationKeys.lname)
    aCoder.encode(uploadedDateFormatted, forKey: SerializationKeys.uploadedDateFormatted)
    aCoder.encode(reviewedDateFormatted, forKey: SerializationKeys.reviewedDateFormatted)
    aCoder.encode(submissionId, forKey: SerializationKeys.submissionId)
    aCoder.encode(userId, forKey: SerializationKeys.userId)
    aCoder.encode(fname, forKey: SerializationKeys.fname)
    aCoder.encode(isReceived, forKey: SerializationKeys.isReceived)
    aCoder.encode(marksGivenByFaculty, forKey: SerializationKeys.marksGivenByFaculty)
  }

}
