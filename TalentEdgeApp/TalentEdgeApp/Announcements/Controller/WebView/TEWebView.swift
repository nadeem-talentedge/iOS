//
//  TEWebView.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 28/07/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import WebKit

enum PageType {
    
    case executive
    case mission
    case help
    case about
    case embedVideo
    case avatar
    case featuredCourse
    
}
class TEWebView: BCUIViewController {

    var webView:WKWebView!
    var pageType = PageType.help
    var url:String?
    var contentId = "0"
    var moduleID:String?
    var batchID:String?
    var batchName:String?
    var stroke = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        self.view = webView
        
        switch pageType {
        
        case .executive:
            
            self.setTitle(title: "Executed Committe")
            self.webView.load(URLRequest(url: URL(string: "https://elsa.talentedge.in/AboutUs/executives")!))
            
        case .mission:
            
            self.setTitle(title: "Our Mission")
            self.webView.load(URLRequest(url: URL(string: "https://elsa.talentedge.in/AboutUs/mission")!))
            
        case .about:
            
            if let url = NetworkManager.getUrl(appendAPI: false){
                
                print("Base Url ------------------->",url)
                self.setTitle(title: "About")
                self.webView.load(URLRequest(url: URL(string: "\(url)AboutUs/about")!))
            }
            
        case .help:
            
            if let url = NetworkManager.getUrl(appendAPI: false){
            
                print("Base Url ------------------->",url)
                self.setTitle(title: "Help")
                self.webView.load(URLRequest(url: URL(string: "\(url)AboutUs/help")!))
            }
            
            
         case .embedVideo:
            
            self.setTitle(title: self.batchName ?? "Video Player")
                
                if let url = NetworkManager.getUrl(appendAPI: false){
                
                    var urlUrl = ""
                    
                    if self.stroke == true{
                        
                       urlUrl = "\(url)Embed/videoPlayer?id=\(self.contentId)&module_id=\(self.moduleID ?? "")&token=\(Utility.getLoginUserDetail()?.token ?? "")"
                        
                    }else{
                    
                       urlUrl = "\(url)Embed/videoPlayer?id=\(self.contentId)&token=\(Utility.getLoginUserDetail()?.token ?? "")"
                    }
                    
                    if #available(iOS 9.0, *) {
                        
                        self.webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/601.5.17 (KHTML, like Gecko) Version/9.1 Safari/601.5.17"
                        
                    } else {
                        
                        // Fallback on earlier versions
                        UserDefaults.standard.register(defaults: ["UserAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/601.5.17 (KHTML, like Gecko) Version/9.1 Safari/601.5.17"])
                    }
                    self.webView.load(URLRequest(url: URL(string: urlUrl)!))
                    
                }else{
                    
                    Utility.showAlert(message: "video not available", title: AppName, actions: nil, controller: self)
                }
            
            case .avatar:
                
                if let batchID = self.batchID{
                    
                    if let url = NetworkManager.getUrl(appendAPI: false){
                        
                        let url = "\(url)Chat/webView/batchId:\(batchID)?token=\(Utility.getLoginUserDetail()?.token ?? "")"
                        
                        self.webView.load(URLRequest(url: URL(string: url)!))
                    }
                    
                }else{
                    
                    self.setBootTitle(topTitle: "Talentedge Avatar", bottomTitle: "May i help you!")
                    
                    let base = "https://api.motion.ai/webchat/56428?color=62a8ea&sendBtn=SEND&session="
                    let userID = Utility.getLoginUserDetail()?.resultData?.user?.userId ?? ""
                    let token = Utility.getLoginUserDetail()?.token ?? ""
                    let suffix = "&inputBox=Type%20something...&token=0096901569a19f9ec14b56da083523e8"
                    let url = "\(base)\(userID)_\(token)\(suffix)"
                    
                    if let url = URL(string: url){
                        
                        self.webView.load(URLRequest(url: url))
                    }
                }
            
                case .featuredCourse:
            
                    if let url = self.url{
                        
                        self.webView.load(URLRequest(url: URL(string: url)!))
                }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension TEWebView:WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        self.startAnimating()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.stopAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        self.stopAnimating()
    }
}

