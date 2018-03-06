//
//  NetworkManager.swift
//  TalentEdgeApp
//
//  Created by Vinod Sahu on 8/28/16.
//  Copyright © 2016 Vinod Sahu. All rights reserved.
//


import Foundation
import Alamofire


#if ELSA
    
let kBaseURL = "https://elsa.talentedge.in/Api/"
let kEmbed = "https://ciel.talentedge.in"
    
#elseif PVR
    
let kBaseURL = "http://staging.talentedge.in/ELS/Api/"
let kEmbed = "https://ciel.talentedge.in"
    
#elseif CIEL
    
let kBaseURL = "https://ciel.talentedge.in/Api/"
let kEmbed = "https://ciel.talentedge.in"
    
#else
    
    //let kBaseURL = "http://staging.talentedge.in/ELS/Api/"
let kBaseURL = "https://staging.talentedge.in/ULS/Api/login"
    //let kBaseURL = "https://sliq.talentedge.in/Api/"
let kEmbed = "https://ciel.talentedge.in"
    
#endif

enum ApiEndPoints {
    
    case myCertificates
    case completedTest
    case loginUser
    case getModuleList
    case dashboard
    case assesmentList
    case assignmentList
    case testimonials
    case getLiveClassList
    case getContentList
    case forgotPassword
    case updateProfile
    case viewNotes
    case viewVideo
    case assignmentView
    case assesmentView
    case startTest
    case saveAnswers
    case getDiscussionList
    case finduserbybatch
    case getCommentList
    case saveComment
    case deleteComment
    case testimonialAdd
    case testimonialDelete
    case uploadAssignment
    case myAttendance
    case getModulePlannerContentList
    case generateLoginOtp
    case getBatchStudentsListing
    case joinLiveClass
    case reviewTest
    case getAnnouncement
    case contentAccessLog
    case getCommentTemplate
    case likeContent
    case listWallComment
    case addWallComment
    case getReferralList
    case getEventCalendar
    case notificationList
    case topMessage
    case messageList
    case unreadNotificationMessageCnt
    case getLearnerList // Usgin for getting contact List
    case viewNotification
    case courseList
    case facultyContentList
    case getLiveClassAttendance
    case messageCompose
    case addReferral
    case getBatchAnalytics
    case suggestedCourseList
    case reviewAssignmentMarks
    
}

final class NetworkManager {
    
    //{"status":0,"code":108,"message":"Invalid Access, Please login to access your account"}
    static let internetMessage = ["status":false,"message":"Please check your internet connection"] as [String : Any]
    
    class func endpointMap(_ endpoint :ApiEndPoints ) -> NSString {
        
        switch endpoint {
        
        case .myCertificates:
            return "myCertificates"
            
        case .reviewAssignmentMarks:
            return "reviewAssignmentMarks"
            
        case .getBatchAnalytics:
            return "getBatchAnalytics"
            
        case .completedTest:
            return "completedTest"
            
        case .addReferral:
            return "addReferral"
            
        case .messageCompose:
            return "messageCompose"
            
        case .getLiveClassAttendance:
            return "getLiveClassAttendance"
            
        case .facultyContentList:
            return "facultyContentList"
            
        case .loginUser:
            return "login"
            
        case .getModuleList:
            return "getModuleList"
            
        case .dashboard:
            return "courseList"
            
        case .assesmentList:
            return "assesmentList"
            
        case .assignmentList:
            return "assignmentList"
            
        case .testimonials:
            return "testimonials"
            
        case .getLiveClassList:
            return "getLiveClassIndexList"
            //return "getLiveClassList"
            
        case .getContentList:
            return "getContentList"
            
        case .forgotPassword:
            return "forgotPassword"
            
        case .updateProfile:
            return "updateProfile"
            
        case .viewNotes:
            return "viewNotes"
            
        case .getDiscussionList:
            return "getDiscussionList"
            
        case .viewVideo:
            return "viewVideo"
            
        case .assignmentView:
            return "assignmentView"
            
        case .assesmentView:
            return "assesmentView"
            
        case .startTest:
            return "startTest"
            
        case .saveAnswers:
            return "saveAnswers"
            
        case .finduserbybatch:
            return "finduserbybatch"
            
        case .getCommentList:
            return "getCommentList"
            
        case .saveComment:
            return "saveComment"
            
        case .deleteComment:
            return "deleteComment"
            
        case .testimonialAdd:
            return "testimonialAdd"
            
        case .testimonialDelete:
            return "testimonialDelete"
            
        case .uploadAssignment:
            return "uploadAssignment"
            
        case .myAttendance:
            return "myAttendance"
            
        case .getModulePlannerContentList:
            return "getModulePlannerContentList"
            
        case .generateLoginOtp:
            return "generateLoginOtp"
            
        case .getBatchStudentsListing:
            return "getBatchStudentsListing"
            
        case .joinLiveClass:
            return "joinLiveClass"
            
        case .reviewTest:
            return "reviewTest"
            
        case .getAnnouncement:
            return "getAnnouncement"
            
        case .contentAccessLog:
            return "contentAccessLog"
            
        case .getCommentTemplate:
            return "getCommentTemplate"
            
        case .likeContent:
            return "likeContent"
            
        case .listWallComment:
            return "listWallComment"
            
        case .addWallComment:
            return "addWallComment"
            
        case .getReferralList:
            return "getReferralList"
            
        case .getEventCalendar:
            return "getEventCalendar"
            
        case .notificationList:
            return "notificationList"
            
        case .topMessage:
            return "topMessage"
            
        case .unreadNotificationMessageCnt:
            return "unreadNotificationMessageCnt"
            
        case .getLearnerList:
            return "getLearnerList"
            
        case .viewNotification:
            return "viewNotification"
            
        case .courseList:
            return "dashboard"
            
        case .messageList:
            return "messageList"
            
        case .suggestedCourseList:
            return "suggestedCourseList"
            
        }
    }
    
    class func getUrl(appendAPI:Bool) -> String? {
        
        if  let appInfo = Utility.getLoginUserDetail()?.resultData?.appInfo{
            
            if appInfo.count > 0{
                
                if let url = appInfo[0].uRL {
                    
                    //print("Base Url find : ------------------------->",url)
                    if appendAPI == true{
                        
                        return "\(url)Api/"
                        
                    }else{
                        
                        return url
                    }
                    
                }else{
                    
                    return nil
                }
                
            }else{
                
                return nil
            }
            
        }else{
            
            return nil
        }
    }
    //https://staging.talentedge.in/ULS/Api/login
    
    //MARK:- Login Request
    class func loginRequest(dataParam: NSMutableDictionary?,requestHeader:NSMutableDictionary? ,completionHandler: @escaping (NSDictionary?, NSError?) -> Void) {
        
        if Connectivity.isConnectedToInternet(){
            
            let url = "http://sliq.talentedge.in/Api/unifiedLogin"
            //let url = "https://staging.talentedge.in/dev/Api/unifiedLogin"
            
            print("Login URl ------------> :",url)
            print("Params :",Utility.jsonToString(json: dataParam) ?? "NA")
            print("Header :",Utility.jsonToString(json: requestHeader) ?? "NA")
            
            Alamofire.request(url, method: .post, parameters: dataParam as? Parameters, encoding: JSONEncoding.default,headers:requestHeader as? Dictionary ).responseJSON { (response) in
                
                if let JSON = response.result.value {
                    
                    //print("JSON: \(JSON)")
                    completionHandler(JSON as? NSDictionary,nil)
                    
                }else{
                    
                    //print("Request failed with error: \(error)")
                    completionHandler(nil,response.result.error as NSError?)
                }
            }
        }
        else{
            
            completionHandler(NetworkManager.internetMessage as NSDictionary,nil)
        }
    }
    
    //MARK:- Get Request
    class func httpGetRequest(_ endpoint: ApiEndPoints,data:NSMutableDictionary,completionHandler: @escaping (NSDictionary?, NSError?) -> Void) {
        
        if Connectivity.isConnectedToInternet(){
        
            if let url = NetworkManager.getUrl(appendAPI: true){
                
                let endPointName = NetworkManager.endpointMap(endpoint)
                
                let url = NSString(format: "%@%@", url,endPointName) as String
                
                print("Get Request----:",url,"\n","Params:",data)
                
                Alamofire.request(url, method: .get,parameters: data as? Parameters, encoding: URLEncoding.default).responseJSON { response in
                    
                    if let JSON = response.result.value {
                        
                        completionHandler(JSON as? NSDictionary,nil)
                        
                    }else{
                        
                        completionHandler(nil,response.result.error as NSError?)
                    }
                }
                
            }else{
                
                completionHandler(nil,nil)
            }
            
        }else{
            
            completionHandler(NetworkManager.internetMessage as NSDictionary,nil)
        }
        
    }
    
    //MARK:- Get Request
    class func httpGetRequest(_ endpoint: ApiEndPoints,data:NSMutableDictionary,completionHandler: @escaping (Any?, NSError?) -> Void) {
        
        if Connectivity.isConnectedToInternet(){
        
            if let url = NetworkManager.getUrl(appendAPI: true){
                
                let endPointName = NetworkManager.endpointMap(endpoint)
                let url = NSString(format: "%@%@", url ,endPointName) as String
                
                print("Get Request----:",url,data)
                
                Alamofire.request(url, method: .get,parameters: data as? Parameters, encoding: URLEncoding.default).responseJSON { response in
                    
                    if let JSON = response.result.value {
                        
                        completionHandler(JSON, nil)
                        
                    }else{
                        
                        completionHandler(nil,response.result.error as NSError?)
                    }
                }
                
            }else{
                
                completionHandler(nil,nil)
            }
            
        }
        else{
           
            completionHandler(NetworkManager.internetMessage as NSDictionary,nil)
        }
        
    }
    
    //MARK:- Post Request
    
    class func httpPostRequest(_ endpoint: ApiEndPoints,dataParam: NSMutableDictionary?,requestHeader:NSMutableDictionary? ,completionHandler: @escaping (NSDictionary?, NSError?) -> Void) {
        
        if Connectivity.isConnectedToInternet(){
        
            if let url = NetworkManager.getUrl(appendAPI: true){
                
                let endPointName = NetworkManager.endpointMap(endpoint)
                let url = NSString(format: "%@%@", url,endPointName) as String
                
                if endpoint != .generateLoginOtp {
                    
                    if let requestHeader = requestHeader{
                        
                        requestHeader["deviceType"] = "IOS"
                        requestHeader["token"] = Utility.getLoginUserDetail()?.token ?? ""
                        requestHeader["user_id"] = Utility.getLoginUserDetail()?.resultData?.user?.userId ?? ""
                        //requestHeader["Content-Type"] = NSSet(objects: "application/json","text/html")
                    }
                }
                
                print("Post Request----:",url,"\n",Utility.jsonToString(json: requestHeader) ?? "","\n",Utility.jsonToString(json: dataParam) ?? "")
                
                Alamofire.request(url, method: .post, parameters: dataParam as? Parameters, encoding: JSONEncoding.default,headers:requestHeader as? Dictionary ).responseJSON { (response) in
                    
                    if let JSON = response.result.value {
                        
                        //print("JSON: \(JSON)")
                        completionHandler(JSON as? NSDictionary,nil)
                        
                    }else{
                        
                        //print("Request failed with error: \(error)")
                        completionHandler(nil,response.result.error as NSError?)
                    }
                    
                }
                
            }else{
                
                completionHandler(nil,nil)
            }
            
        }else{
         
            completionHandler(NetworkManager.internetMessage as NSDictionary,nil)
        }
        
    }
    
    //MARK:- MultiPart Post Request
    
    class func httpMultiPartFromRequestForMessage(_ endpoint: ApiEndPoints,dataParam: NSMutableDictionary?,requestHeader:NSMutableDictionary, userimage : [SelectedImage]? ,completionHandler: @escaping (NSDictionary?, NSError?) -> Void) {
        
        if Connectivity.isConnectedToInternet(){
            
            if let url = NetworkManager.getUrl(appendAPI: true){
                
                let endPointName = NetworkManager.endpointMap(endpoint)
                
                let url = NSString(format: "%@%@", url,endPointName) as String
                
                requestHeader["deviceType"] = "IOS"
                requestHeader["token"] = Utility.getLoginUserDetail()?.token ?? ""
                
                print("Post Request----:",url,requestHeader,dataParam ?? "")
                
                Alamofire.upload(multipartFormData: { dict in
                    
                    if let userImages = userimage{
                        
                        var count = 1
                        for userImage in userImages{
                            
                            if let image = userImage.image{
                                
                                dict.append(UIImageJPEGRepresentation(image, 0.1)!, withName: "image\(count)", fileName: userImage.imageImage ?? "Image.png", mimeType: "image/jpeg")
                                count = count+1
                            }
                        }
                    }
                    
                    do {
                        
                        if let params = dataParam{
                            
                            for key in params.allKeys{
                                
                                if let val = dataParam?.value(forKey: key as! String) as? String{
                                    
                                    dict.append((val.data(using: String.Encoding.utf8, allowLossyConversion: false)!), withName: key as! String)
                                }
                            }
                        }
                    }
                    catch {
                        
                        print(error.localizedDescription)
                    }
                    
                    
                }, usingThreshold: 100, to: url, method: HTTPMethod.post, headers: requestHeader as? Dictionary, encodingCompletion: { encodingResult in
                    
                    switch encodingResult {
                        
                    case .success(let upload, _, _):
                        upload.responseJSON { response in
                            
                            if let JSON = response.result.value {
                                
                                completionHandler(JSON as? NSDictionary,nil)
                                
                            }else{
                                
                                completionHandler(nil,response.result.error as NSError?)
                            }
                        }
                        
                    case .failure(let encodingError):
                        
                        print(encodingError)
                    }
                })
                
            }else{
                
                completionHandler(nil,nil)
            }
            
        }else{
            
           completionHandler(NetworkManager.internetMessage as NSDictionary,nil)
        }
        
    }
    
    class func httpMultiPartFromRequest(_ endpoint: ApiEndPoints,dataParam: NSMutableDictionary?,requestHeader:NSMutableDictionary, userimage : UIImage? ,completionHandler: @escaping (NSDictionary?, NSError?) -> Void) {
        
        if Connectivity.isConnectedToInternet(){
        
            if let url = NetworkManager.getUrl(appendAPI: true){
                
                let endPointName = NetworkManager.endpointMap(endpoint)
                
                let url = NSString(format: "%@%@", url,endPointName) as String
                
                requestHeader["deviceType"] = "IOS"
                requestHeader["token"] = Utility.getLoginUserDetail()?.token ?? ""
                
                print("Post Request----:",url,requestHeader,dataParam ?? "")
                
                Alamofire.upload(multipartFormData: { dict in
                    
                    switch endpoint{
                        
                    case .messageCompose:
                        
                        if let userimage = userimage{
                            
                            dict.append(UIImageJPEGRepresentation(userimage, 1.0)!, withName: "image", fileName: "profile.jpeg", mimeType: "image/jpeg")
                        }
                        
                        do {
                            
                             if let val = dataParam?.value(forKey: "subject") as? String{
                                
                                dict.append((val.data(using: String.Encoding.utf8, allowLossyConversion: false)!), withName: "subject")
                            }
                            
                            if let val = dataParam?.value(forKey: "message") as? String{
                                
                                dict.append((val.data(using: String.Encoding.utf8, allowLossyConversion: false)!), withName: "message")
                            }
                            
                            if let val = dataParam?.value(forKey: "to_id") as? String{
                                
                                dict.append((val.data(using: String.Encoding.utf8, allowLossyConversion: false)!), withName: "to_id")
                            }
                            
                            if let val = dataParam?.value(forKey: "batch_id") as? String{
                                
                                dict.append((val.data(using: String.Encoding.utf8, allowLossyConversion: false)!), withName: "batch_id")
                            }
                            
                        } catch {
                            
                            print(error.localizedDescription)
                        }
                        
                        
                    case .updateProfile:
                        
                        if let userimage = userimage{
                            
                            dict.append(UIImageJPEGRepresentation(userimage, 1.0)!, withName: "image", fileName: "profile.jpeg", mimeType: "image/jpeg")
                        }
                        
                        do {
                            
                            print("Profile ---------------------------------",dataParam)
                            let jsonData = try JSONSerialization.data(withJSONObject: dataParam!, options: .prettyPrinted)
                            dict.append(jsonData, withName: "profileData")
                            
                        } catch {
                            
                            print(error.localizedDescription)
                        }
                        
                    case .uploadAssignment:
                        
                        if let userimage = userimage{
                            
                            dict.append(UIImageJPEGRepresentation(userimage, 1.0)!, withName: "uploaded_path", fileName: "assignemnt.jpeg", mimeType: "image/jpeg")
                            
                            if let val = dataParam?.value(forKey: "content_id") as? String{
                                
                                dict.append((val.data(using: String.Encoding.utf8, allowLossyConversion: false)!), withName: "content_id")
                            }
                        }
                        
                    case .addReferral:
                        
                        if let userimage = userimage{
                            
                            dict.append(UIImageJPEGRepresentation(userimage, 1.0)!, withName: "uploaded_path", fileName: "refer.jpeg", mimeType: "image/jpeg")
                            
                            if let val = dataParam?.value(forKey: "content_id") as? String{
                                
                                dict.append((val.data(using: String.Encoding.utf8, allowLossyConversion: false)!), withName: "content_id")
                            }
                        }
                        
                    default: break
                        
                    }
                    
                }, usingThreshold: 100, to: url, method: HTTPMethod.post, headers: requestHeader as? Dictionary, encodingCompletion: { encodingResult in
                    
                    switch encodingResult {
                        
                    case .success(let upload, _, _):
                        upload.responseJSON { response in
                            
                            if let JSON = response.result.value {
                                
                                completionHandler(JSON as? NSDictionary,nil)
                                
                            }else{
                                
                                completionHandler(nil,response.result.error as NSError?)
                            }
                        }
                        
                    case .failure(let encodingError):
                        
                        print(encodingError)
                    }
                })
                
            }else{
                
                completionHandler(nil,nil)
            }
            
        }else{
            
            completionHandler(NetworkManager.internetMessage as NSDictionary,nil)
        }
    }
    
    //MARK:- Download Files
    
    class func fileAlreadyAvailable(fileUrl:String) -> (status:Bool,filePath:String?){
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        
        let url = NSURL(fileURLWithPath: path)
        
        let filePath = url.appendingPathComponent((fileUrl as NSString).lastPathComponent)?.path
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: filePath!) {
            
            print("FILE AVAILABLE ")
            return (true,filePath)
            
        }else {
            
            print("FILE NOT AVAILABLE ")
            return (false,nil)
        }
    }
    
    class func downloadFileFromUrl(fileUrl:String,progress: @escaping (Double?) -> Void,result: @escaping (Any?) -> Void) {
        
        if Connectivity.isConnectedToInternet() {
        
            let fileStatus = NetworkManager.fileAlreadyAvailable(fileUrl: fileUrl)
            
            if fileStatus.status == true {
                
                result(fileStatus.filePath)
                
            }else{
                
                let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
                
                Alamofire.download(fileUrl, to: destination).downloadProgress { progressData in
                    
                    print("Downloading : - ",progressData.fractionCompleted)
                    progress(progressData.fractionCompleted)
                    
                    }.responseData { responceData in
                        
                        if responceData.error == nil, let path = responceData.destinationURL?.path {
                            
                            result(path)
                            
                        }else{
                            
                            result(responceData.error)
                        }
                }
            }
        }
        else{
          
            result(NetworkManager.internetMessage as NSDictionary)
        }
        
    }
}

class Connectivity {
    
    class func isConnectedToInternet() ->Bool {
        
        return NetworkReachabilityManager()!.isReachable
    }
}
