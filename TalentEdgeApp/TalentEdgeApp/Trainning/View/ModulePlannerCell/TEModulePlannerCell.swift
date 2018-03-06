//
//  TEModulePlannerCell.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 14/06/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
protocol TEModulePlannerCellDelegate {
    func play_Click(indx : Int)
}

class TEModulePlannerCell: BCUITableViewCell {

    static let reuseIdentifier = "mTEModulePlannerCell"
    static let nibName = "TEModulePlannerCell"
    
    @IBOutlet weak var lblTitle: BCUILabel!
    @IBOutlet weak var btnSubTitle: BCUIButton!
    @IBOutlet weak var lblTime: BCUILabel!
    @IBOutlet weak var btnPlay: BCUIButton!
    @IBOutlet weak var lblDueDate: BCUILabel!
    var delegate: TEModulePlannerCellDelegate?
    
    @IBOutlet weak var bgView: BCView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func play_Click(_ sender: BCUIButton) {
        
        if let delegate = delegate{
            delegate.play_Click(indx: self.indexOfCell)
        }
    }
    
    
    
    //MARK: - ContentListAssignment Cellconfigure
    func configureCell(objet : ModulePlannerListModel?) -> Void {
        
        
        if let objet = objet {
            
            print("Action --------------> ",objet.dictionaryRepresentation)
            self.btnPlay.setText(text: objet.action)
            
            self.lblTitle.setText(text: objet.title)
            
            if let refType = objet.refType{
            
                 self.btnSubTitle.setText(text: refType)
                
            }else{
            
                if let contentTypeID = objet.contentTypeId{
                    
                    var contentTypeTemp = -1
                    contentTypeTemp = Int(contentTypeID)!
                    
                    
                
                switch contentTypeTemp {
                    
                case CONTENT_TYPE.NOTES.hashValue:
                    
                    self.btnSubTitle.setText(text: "Notes")
                    
                    break
                    
                case CONTENT_TYPE.VIDEO.hashValue:
                    
                    self.btnSubTitle.setText(text: "Video")
                    
                    break
                    
                case CONTENT_TYPE.INTERACTIVE_VIDEO.hashValue:
                    
                    self.btnSubTitle.setText(text: "Interactive Video")
                    
                    break
                    
                case CONTENT_TYPE.ASSESSMENT.hashValue:
                    
                    self.btnSubTitle.setText(text: "Assessment")
                    
                    break
                    
                case CONTENT_TYPE.ASSIGNMENT.hashValue:
                    
                    self.btnSubTitle.setText(text: "Assignment")
                    
                    break
                    
                case CONTENT_TYPE.MODULE_PLANNER.hashValue:
                    
                    break
                    
                case CONTENT_TYPE.LIVE_CLASS.hashValue:
                    
                    break
                    
                case CONTENT_TYPE.DISCUSSION.hashValue:
                    
                    break
                    
                case CONTENT_TYPE.JOINING.hashValue:
                    
                    break
                    
                case CONTENT_TYPE.ANNIVERSARY.hashValue:
                    
                    break
                    
                case CONTENT_TYPE.BIRTHDAY.hashValue:
                    
                    break
                    
                case CONTENT_TYPE.EVENT.hashValue:
                    
                    break
                    
                case CONTENT_TYPE.CELEBRATION.hashValue:
                    
                    break
                    
                case CONTENT_TYPE.AWARD.hashValue:
                    
                    break
                    
                case CONTENT_TYPE.RECRUITMENT.hashValue:
                    
                    break
                    
                default:
                    break
                }
              }
            }
           
            self.lblTime.setText(text: objet.contentDurationFormated)
            
            self.lblDueDate.setText(text: "End Date : "+(objet.endDateValue ?? ""))
            
            
            if objet.isLocked == 1{
                
                self.bgView.backgroundColor = UIColor.lightGray
                self.btnPlay.isUserInteractionEnabled = false
                
            }else{
                
                self.btnPlay.isUserInteractionEnabled = true
                self.bgView.backgroundColor = UIColor.init(colorLiteralRed: 0/255.0, green: 142.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            }

        }
    }
}
