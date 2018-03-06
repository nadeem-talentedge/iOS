//
//  TestimonialListBase.swift
//
//  Created by Temp  on 11/06/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TestimonialListBase: NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let uploads = "uploads"
        static let allowDelete = "allow_delete"
        static let id = "id"
        static let createdBy = "created_by"
        static let createdByRole = "created_by_role"
        static let descriptionValue = "description"
        static let userType = "user_type"
        static let pic = "pic"
        static let userId = "user_id"
        static let batchId = "batch_id"
        static let showMore = "show_More"
    }
    
    // MARK: Properties
    public var uploads: String?
    public var allowDelete: Int?
    public var id: String?
    public var createdBy: String?
    public var createdByRole: String?
    public var descriptionValue: String?
    public var userType: String?
    public var pic: String?
    public var userId: String?
    public var batchId: String?
    public var showMore: String?
    
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
        uploads = json[SerializationKeys.uploads].string
        allowDelete = json[SerializationKeys.allowDelete].int
        id = json[SerializationKeys.id].string
        createdBy = json[SerializationKeys.createdBy].string
        createdByRole = json[SerializationKeys.createdByRole].string
        descriptionValue = json[SerializationKeys.descriptionValue].string
        userType = json[SerializationKeys.userType].string
        pic = json[SerializationKeys.pic].string
        userId = json[SerializationKeys.userId].string
        batchId = json[SerializationKeys.batchId].string
        showMore = json[SerializationKeys.showMore].string
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = uploads { dictionary[SerializationKeys.uploads] = value }
        if let value = allowDelete { dictionary[SerializationKeys.allowDelete] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
        if let value = createdByRole { dictionary[SerializationKeys.createdByRole] = value }
        if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
        if let value = userType { dictionary[SerializationKeys.userType] = value }
        if let value = pic { dictionary[SerializationKeys.pic] = value }
        if let value = userId { dictionary[SerializationKeys.userId] = value }
        if let value = batchId { dictionary[SerializationKeys.batchId] = value }
        
        if let value = showMore { dictionary[SerializationKeys.showMore] = value }
        
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.uploads = aDecoder.decodeObject(forKey: SerializationKeys.uploads) as? String
        self.allowDelete = aDecoder.decodeObject(forKey: SerializationKeys.allowDelete) as? Int
        self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
        self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? String
        self.createdByRole = aDecoder.decodeObject(forKey: SerializationKeys.createdByRole) as? String
        self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
        self.userType = aDecoder.decodeObject(forKey: SerializationKeys.userType) as? String
        self.pic = aDecoder.decodeObject(forKey: SerializationKeys.pic) as? String
        self.userId = aDecoder.decodeObject(forKey: SerializationKeys.userId) as? String
        self.batchId = aDecoder.decodeObject(forKey: SerializationKeys.batchId) as? String
        
        self.showMore = aDecoder.decodeObject(forKey: SerializationKeys.showMore) as? String
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(uploads, forKey: SerializationKeys.uploads)
        aCoder.encode(allowDelete, forKey: SerializationKeys.allowDelete)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
        aCoder.encode(createdByRole, forKey: SerializationKeys.createdByRole)
        aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
        aCoder.encode(userType, forKey: SerializationKeys.userType)
        aCoder.encode(pic, forKey: SerializationKeys.pic)
        aCoder.encode(userId, forKey: SerializationKeys.userId)
        aCoder.encode(batchId, forKey: SerializationKeys.batchId)
        aCoder.encode(showMore, forKey: SerializationKeys.showMore)
        
    }
    
}
