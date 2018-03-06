//
//  YoutubePlayerVC.swift
//  Inspiring
//
//  Created by Vinod Sahu on 1/11/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

class YoutubePlayerVC: BCUIViewController {

    
    var youtubeUrl = ""
    @IBOutlet weak var ytPlayer: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.setTitle(title: "Video Player")
        
        if !youtubeUrl.isEmpty{
        
            self.ytPlayer.load(withVideoId:youtubeUrl)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YoutubePlayerVC: YTPlayerViewDelegate {

}
