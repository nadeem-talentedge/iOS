//
//  CommentsChat.swift
//
//  Created by Temp  on 11/06/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CommentsChat: NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let created = "created"
        static let createdBy = "created_by"
        static let id = "id"
        static let comment = "comment"
        static let createdByName = "created_by_name"
        static let pic = "pic"
        static let userRole = "user_role"
    }
    
    
    // MARK: Properties
    public var created: String?
    public var createdBy: String?
    public var id: String?
    public var comment: String?
    public var createdByName: String?
    public var pic: String?
    public var userRole: String?
    
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
        created = json[SerializationKeys.created].string
        createdBy = json[SerializationKeys.createdBy].string
        id = json[SerializationKeys.id].string
        comment = json[SerializationKeys.comment].string
        createdByName = json[SerializationKeys.createdByName].string
        pic = json[SerializationKeys.pic].string
        userRole = json[SerializationKeys.userRole].string
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = created { dictionary[SerializationKeys.created] = value }
        if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = comment { dictionary[SerializationKeys.comment] = value }
        if let value = createdByName { dictionary[SerializationKeys.createdByName] = value }
        if let value = pic { dictionary[SerializationKeys.pic] = value }
        if let value = userRole { dictionary[SerializationKeys.userRole] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? String
        self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? String
        self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
        self.comment = aDecoder.decodeObject(forKey: SerializationKeys.comment) as? String
        self.createdByName = aDecoder.decodeObject(forKey: SerializationKeys.createdByName) as? String
        self.pic = aDecoder.decodeObject(forKey: SerializationKeys.pic) as? String
        self.userRole = aDecoder.decodeObject(forKey: SerializationKeys.userRole) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(created, forKey: SerializationKeys.created)
        aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(comment, forKey: SerializationKeys.comment)
        aCoder.encode(createdByName, forKey: SerializationKeys.createdByName)
        aCoder.encode(pic, forKey: SerializationKeys.pic)
        aCoder.encode(userRole, forKey: SerializationKeys.userRole)
    }
    
}
