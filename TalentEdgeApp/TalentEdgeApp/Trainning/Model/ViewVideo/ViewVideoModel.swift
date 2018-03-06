//
//  ViewVideoModel.swift
//
//  Created by Vinod Kumar on 08/06/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ViewVideoModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let allowDownload = "allow_download"
    static let descriptionValue = "description"
    static let contentTypeId = "content_type_id"
    static let userContentView = "user_content_view"
    static let id = "id"
    static let createdBy = "created_by"
    static let created = "created"
    static let like = "like"
    static let contentPath = "content_path"
    static let title = "title"
    static let completionPercentage = "completion_percentage"
    static let startDate = "start_date"
    static let endDate = "end_date"
  }

  // MARK: Properties
  public var allowDownload: Bool? = false
  public var descriptionValue: String?
  public var contentTypeId: String?
  public var userContentView: VideoUserContentView?
  public var id: String?
  public var createdBy: String?
  public var created: String?
  public var like: Int?
  public var contentPath: String?
  public var title: String?
  public var completionPercentage: String?
  public var startDate: String?
  public var endDate: String?

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
    allowDownload = json[SerializationKeys.allowDownload].boolValue
    descriptionValue = json[SerializationKeys.descriptionValue].string
    contentTypeId = json[SerializationKeys.contentTypeId].string
    userContentView = VideoUserContentView(json: json[SerializationKeys.userContentView])
    id = json[SerializationKeys.id].string
    createdBy = json[SerializationKeys.createdBy].string
    created = json[SerializationKeys.created].string
    like = json[SerializationKeys.like].int
    contentPath = json[SerializationKeys.contentPath].string
    title = json[SerializationKeys.title].string
    completionPercentage = json[SerializationKeys.completionPercentage].string
    startDate = json[SerializationKeys.startDate].string
    endDate = json[SerializationKeys.endDate].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.allowDownload] = allowDownload
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = contentTypeId { dictionary[SerializationKeys.contentTypeId] = value }
    if let value = userContentView { dictionary[SerializationKeys.userContentView] = value.dictionaryRepresentation() }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    if let value = created { dictionary[SerializationKeys.created] = value }
    if let value = like { dictionary[SerializationKeys.like] = value }
    if let value = contentPath { dictionary[SerializationKeys.contentPath] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = completionPercentage { dictionary[SerializationKeys.completionPercentage] = value }
    if let value = startDate { dictionary[SerializationKeys.startDate] = value }
    if let value = endDate { dictionary[SerializationKeys.endDate] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.allowDownload = aDecoder.decodeBool(forKey: SerializationKeys.allowDownload)
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.contentTypeId = aDecoder.decodeObject(forKey: SerializationKeys.contentTypeId) as? String
    self.userContentView = aDecoder.decodeObject(forKey: SerializationKeys.userContentView) as? VideoUserContentView
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? String
    self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? String
    self.like = aDecoder.decodeObject(forKey: SerializationKeys.like) as? Int
    self.contentPath = aDecoder.decodeObject(forKey: SerializationKeys.contentPath) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.completionPercentage = aDecoder.decodeObject(forKey: SerializationKeys.completionPercentage) as? String
    self.startDate = aDecoder.decodeObject(forKey: SerializationKeys.startDate) as? String
    self.endDate = aDecoder.decodeObject(forKey: SerializationKeys.endDate) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(allowDownload, forKey: SerializationKeys.allowDownload)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(contentTypeId, forKey: SerializationKeys.contentTypeId)
    aCoder.encode(userContentView, forKey: SerializationKeys.userContentView)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
    aCoder.encode(created, forKey: SerializationKeys.created)
    aCoder.encode(like, forKey: SerializationKeys.like)
    aCoder.encode(contentPath, forKey: SerializationKeys.contentPath)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(completionPercentage, forKey: SerializationKeys.completionPercentage)
    aCoder.encode(startDate, forKey: SerializationKeys.startDate)
    aCoder.encode(endDate, forKey: SerializationKeys.endDate)
  }

}
