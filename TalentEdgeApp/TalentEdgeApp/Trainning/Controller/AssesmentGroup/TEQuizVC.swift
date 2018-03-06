//
//  TEQuizVC.swift
//  TalentEdgeApp
//
//  Created by Temp  on 23/05/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

enum TestType {
    
    case new
    case review
}

class TEQuizVC: BCUIViewController {
    
    @IBOutlet weak var pageView: BCView!
    @IBOutlet weak var btnNext: BCUIButton!
    @IBOutlet weak var btnPrev: BCUIButton!
    @IBOutlet weak var btnSubmitTest: BCUIButton!
    
    @IBOutlet weak var lblPageNumber: BCUILabel!
    @IBOutlet weak var lblTimer: BCUILabel!
    
    var testType = TestType.new
    
    var countDown = 0
    var totalCountDown = 0
    var timer:Timer?
    
    var indexNumber = 0
    
    var contentId:String?
    var contentName:String?
    
    let pageViewController:UIPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options:nil)
    
    var startTestModel:StartTestModel? {
        
        didSet{
            
            if self.startTestModel != nil{
                
                self.pageViewController.dataSource = self
                self.pageViewController.delegate = self
                
                self.addChildViewController(self.pageViewController)
                
                self.pageViewController.view.frame = self.pageView.bounds
                
                self.pageView.addSubview(self.pageViewController.view)
                
                self.setFirstViewController()
                self.startTimer()
            }
        }
    }
    
    var reviewTestModel:RWReviewTestModel? {
        
        didSet{
            
            if self.reviewTestModel != nil{
                
                self.pageViewController.dataSource = self
                self.pageViewController.delegate = self
                
                self.addChildViewController(self.pageViewController)
                
                self.pageViewController.view.frame = self.pageView.bounds
                
                self.pageView.addSubview(self.pageViewController.view)
                
                self.setFirstViewController()
            }
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let contentName = self.contentName{
            
            self.setTitle(title: contentName)
        }
        
        if self.testType == .new{
        
            self.lblTimer.isHidden = false
            btnSubmitTest.isHidden = false
            self.callWebserviceForStartAssessment()
            
        }else{
        
            self.lblTimer.isHidden = true
            btnSubmitTest.isHidden = true
            self.callWebserviceForReviewAssessment()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated);
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setFirstViewController() -> Void {
        
         self.pageViewController.setViewControllers([getViewControllerAtIndex(0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
    }
    
    func getViewControllerAtIndex(_ index: NSInteger) -> TEQuizChildVC {
        
        print("Index Number ------------ :",index)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let child = storyboard.instantiateViewController(withIdentifier: Utility.ID_TEQuizChildVC) as! TEQuizChildVC
        
        child.view.frame = self.pageViewController.view.bounds
        
        child.pageIndex = index
        child.testType = self.testType
        
        if self.testType == .new{
        
            child.newTestQuestion = self.startTestModel?.testQuestion?[index]
            self.lblPageNumber.setText(text: "\(index+1)"+"/"+"\((self.startTestModel?.testQuestion?.count)!)")
            
        }else{
        
            child.reviewTestQuestion = self.reviewTestModel?.testQuestion?[index]
            self.lblPageNumber.setText(text: "\(index+1)"+"/"+"\((self.reviewTestModel?.testQuestion?.count)!)")
        }
        return child
    }
    
    // MARK:- Next Prev
    
    @IBAction func loadNextController() -> Void {
        
        if self.testType == .new{
            
            self.indexNumber += 1;
            
            print("NEXT------------->",self.indexNumber,(self.startTestModel?.testQuestion?.count)!)
            
            if (self.indexNumber >= (self.startTestModel?.testQuestion?.count)!) {
                
                self.indexNumber = (self.startTestModel?.testQuestion?.count)!
                return
            }
            
            
            let nextViewController:UIViewController = getViewControllerAtIndex(self.indexNumber);
            
            self.pageViewController.setViewControllers([nextViewController] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
            
        }else{
            
            
            self.indexNumber += 1;
            
            print("NEXT------------->",self.indexNumber,(self.reviewTestModel?.testQuestion?.count)!)
            
            if (self.indexNumber >= (self.reviewTestModel?.testQuestion?.count)!) {
                
                self.indexNumber = (self.reviewTestModel?.testQuestion?.count)!
                return
            }
            
            
            let nextViewController:UIViewController = getViewControllerAtIndex(self.indexNumber);
            
            self.pageViewController.setViewControllers([nextViewController] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        }
        
    }
    
    
    
    @IBAction func loadPrevController() -> Void {
        
        if self.testType == .new{
            
            self.indexNumber -= 1;
            
            print("Pre ------------->",self.indexNumber,(self.startTestModel?.testQuestion?.count)!)
            
            if (self.indexNumber < 0) {
                
                self.indexNumber = 0;
                return
            }
            
            let nextViewController:UIViewController = getViewControllerAtIndex(self.indexNumber);
            
            self.pageViewController.setViewControllers([nextViewController] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
            
        }else{
            
            self.indexNumber -= 1;
            
            print("Pre ------------->",self.indexNumber,(self.reviewTestModel?.testQuestion?.count)!)
            
            if (self.indexNumber < 0) {
                
                self.indexNumber = 0;
                return
            }
            
            let nextViewController:UIViewController = getViewControllerAtIndex(self.indexNumber);
            
            self.pageViewController.setViewControllers([nextViewController] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
            
        }
        
    }
    
    // MARK:- Timer
    
    func startTimer() -> Void {
        
        print("Duration --- :",self.startTestModel?.test?.totalDurations ?? "NA",":",self.startTestModel?.test?.durationText ?? "NA")
        
        if let duration = self.startTestModel?.test?.totalDurations {
            
            self.countDown = duration
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountDown), userInfo: nil, repeats: true)
            
            timer?.fire()
            
        }else{
        
            print("Duration Not Available")
        }
    
    }
    
    func updateCountDown() {
       
        if self.countDown >= 0{
            
            self.setValue()
        
        }else{
         
            self.stopTimer(isPop:true)
        }
        self.totalCountDown += 1
        self.countDown -= 1
    }
 
    func setValue() -> Void{
       
        let hour = String(format: "%.2d",(self.countDown/60)/60)
        let minite = String(format: "%.2d",self.countDown/60)
        let second = String(format: "%.2d",self.countDown%60)
        
        if let timerLabel = self.lblTimer{
        
            DispatchQueue.main.async {
            
                timerLabel.setText(text: hour+":"+minite+":"+second)
                //print("Label ");
            }
            
        }else{
        
            print("Label Nil");
        }
    }
    
    private func stopTimer(isPop:Bool) {
        
        self.timer?.invalidate()
        self.timer = nil
        
        if isPop{
        
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    //MARK:- Submit Test
    
    @IBAction func submitDidClick(sender:BCUIButton) -> Void {
    
        
        if self.isAnyAnserSelected(){
        
            self.stopTimer(isPop:false)
            
            let vc = TESubmitInfoVC(nibName: "TESubmitInfoVC", bundle: nil)
            vc.delegate = self
            vc.totalQuestion = self.startTestModel?.test?.totalQuestions
            vc.totalAttmpt = "\(self.totalSelected())"
            vc.totalTime = self.durationToFormatedTime(duration:self.totalCountDown)
            self.presentPopupViewController(vc, animationType:MJPopupViewAnimationSlideBottomBottom)
        }
        else{
        
            Utility.showAlert(message: "Please select minimum one question answer", title: AppName, actions: nil, controller: self)
        }
    
    }
    
    func isAnyAnserSelected() -> Bool {
        
        var isSelectedAny = false
        
        if let testQuestion = self.startTestModel?.testQuestion{
        
            for model in testQuestion{
            
                let result =  model.questionOption?.filter({ (question:STQuestionOption) -> Bool in
                    
                    return question.isSelected == true
                })
                
                if let result = result{
                
                    if result.count > 0{
                        
                        isSelectedAny = true
                    }
                }
            }
            return isSelectedAny
            
        }else{
        
            return false
        }
    }
    
    func getSelectedAnserDict() -> NSMutableArray? {
        
        let arr = NSMutableArray()
        
        if let testQuestion = self.startTestModel?.testQuestion{
            
            for model in testQuestion{
                
                let result =  model.questionOption?.filter({ (question:STQuestionOption) -> Bool in
                    
                    return question.isSelected == true
                })
                
                if let result = result{
                
                    for questionOption in result{
                    
                        print(" LET --------",questionOption.optionStatement ?? "")
                        
                        let mutable = NSMutableDictionary()
                        mutable.setValue(questionOption.questionId, forKey: "question_id")
                        mutable.setValue(questionOption.id, forKey: "selected_option_id")
                        arr.add(mutable)
                    }
                }
            }
        }
        return arr
    }
    
    func getMyScore() -> Int {
        
        var count = 0
        
        if let testQuestion = self.startTestModel?.testQuestion{
            
            for model in testQuestion{
                
                let result =  model.questionOption?.filter({ (question:STQuestionOption) -> Bool in
                    
                    return question.isSelected == true
                })
                
                if let result = result{
                    
                    for questionOption in result{
                        
                        if questionOption.isCorrectOption! {
                        
                            if let marks = model.question?.marks{
                                
                                count += Int(marks)!
                            }
                        }
                    }
                }
            }
        }
        return count
    }
    
    func totalSelected() -> Int {
        
        var count = 0
        
        if let testQuestion = self.startTestModel?.testQuestion{
            
            for model in testQuestion{
                
                let result =  model.questionOption?.filter({ (question:STQuestionOption) -> Bool in
                    
                    return question.isSelected == true
                })
                
                if let result = result{
                
                    if result.count > 0{
                    
                        count += 1
                    }
                }
            }
        }
        return count
    }
    
    func totalMarks() -> Int {
        
        var count = 0
        
        if let testQuestion = self.startTestModel?.testQuestion{
            
            for model in testQuestion{
            
                if let marks = model.question?.marks{
                
                    count += Int(marks)!
                }
            }
        }
        return count
    }
    
    func durationToFormatedTime(duration:Int) -> String{
        
        let hour = String(format: "%.2d",(duration/60)/60)
        let minite = String(format: "%.2d",duration/60)
        let second = String(format: "%.2d",duration%60)
        return hour+":"+minite+":"+second
    }
}

// MARK:- TESubmitInfoVC Delegate

extension TEQuizVC: TESubmitGraphDelegate  {
    
    func reviewButtonDidClick(sender: BCUIButton) {
     
        self.lblTimer.isHidden = true
        btnSubmitTest.isHidden = true
        self.callWebserviceForReviewAssessment()
    
    }
    
    func reattemptButtonDidClick(sender: BCUIButton) {
        
        self.lblTimer.isHidden = false
        btnSubmitTest.isHidden = false
        self.callWebserviceForStartAssessment()
    }
    
}

// MARK:- TESubmitInfoVC Delegate

extension TEQuizVC: TESubmitInfoVCDelegate  {

    func cancelButtonDidClick(sender: BCUIButton) {
       
        self.dismissPopupViewControllerWithanimationType(MJPopupViewAnimationSlideBottomBottom)
    }
    
    func submitButtonDidClick(sender: BCUIButton) {
        
        self.dismissPopupViewControllerWithanimationType(MJPopupViewAnimationSlideBottomBottom)
        self.callWebserviceForSubmitAssessment()
    }
}
// MARK:- UIPageViewControllerDataSource

extension TEQuizVC: UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        if self.testType == .new{
        
            if ((self.startTestModel?.testQuestion?.count)! <= 0)
            {return nil }
            
        }else{
        
            if ((self.reviewTestModel?.testQuestion?.count)! <= 0)
            {return nil }
        }
        
        let page: TEQuizChildVC = viewController as! TEQuizChildVC
        self.indexNumber = page.pageIndex
        
        if ((self.indexNumber == 0) || (self.indexNumber == NSNotFound))
        {
            return nil
        }
        self.indexNumber -= 1;
        return getViewControllerAtIndex(self.indexNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        
        if self.testType == .new{
            
            if ((self.startTestModel?.testQuestion?.count)! <= 0)
            {return nil }
            
        }else{
            
            if ((self.reviewTestModel?.testQuestion?.count)! <= 0)
            {return nil }
        }
        
        let pageContent: TEQuizChildVC = viewController as! TEQuizChildVC
        self.indexNumber = pageContent.pageIndex
        
        if (indexNumber == NSNotFound)
        {
            return nil;
        }
        
        indexNumber += 1;
        
        if self.testType == .new{
        
            if (self.indexNumber >= (self.startTestModel?.testQuestion?.count)!)
            {
                return nil;
            }
            
        }else{
        
            if (self.indexNumber >= (self.reviewTestModel?.testQuestion?.count)!)
            {
                return nil;
            }
        }
        return getViewControllerAtIndex(self.indexNumber)
    }
}

//MARK: - Network Call

extension TEQuizVC {
    
    func callWebserviceForSubmitAssessment() {
        
        if let contentId = self.contentId {
            
            self.startAnimating()
            
            let dicParam  =  NSMutableDictionary()
            
            dicParam.setValue(Utility.arrayToString(array: self.getSelectedAnserDict()), forKey: "question")
            
            dicParam.setValue(contentId, forKey: "content_id")
            dicParam.setValue(self.totalCountDown, forKey: "time_taken")
            
            print("body -------->",dicParam)
            
            let headerParam = NSMutableDictionary()
        
            NetworkManager.httpPostRequest(.saveAnswers, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Start Test : ------> ",data ?? "Start Test Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                         
                            let vc = TESubmitGraph(nibName: "TESubmitGraph", bundle: nil)
                            vc.delegate = self
                            
                            vc.contentName = self.contentName
                            vc.contentId = self.contentId
                            
                            vc.totalQuestion = self.startTestModel?.test?.totalQuestions
                            
                            vc.myScore = "\(self.getMyScore())"
                            
                            vc.totalAttempt  = "\(self.totalSelected())"
                            
                            vc.totalTime =  self.durationToFormatedTime(duration: self.startTestModel?.test?.totalDurations ?? 0)
                            
                            vc.totalTimeTaken = self.durationToFormatedTime(duration:self.totalCountDown)
                            
                            vc.totalMarks =  "\(self.totalMarks())"
                            
                            vc.assessmentType = self.startTestModel?.test?.testType
                            
                            //print("Percent Tage :",self.getMyScore(),self.totalMarks(),Double((Double(self.getMyScore())/Double(self.totalMarks()))*100))
                            
                            vc.percentage = Double((Double(self.getMyScore())/Double(self.totalMarks()))*100)
                            
                            self.navigationController?.pushViewController(vc, animated: true)
                            
                        }else{
                    
                            let message : String =  data.value(forKey: "message")  as! String
                            
                            Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                        }
                    }
                    else{
                        
                        Utility.showAlert(message: "Error. Try After some time", title: AppName, actions: nil, controller: self)
                    }
                    
                }else{
                
                    Utility.showAlert(message: "Error. Try After some time", title: AppName, actions: nil, controller: self)
                }
                
                self.stopAnimating()
            })
            
        }
        else{
            
            Utility.showAlert(message: "content id not available or your not login properly", title: AppName, actions: nil, controller: self)
        }
        
    }
    
    func callWebserviceForReviewAssessment() {
        
        if let moduleID = self.contentId , let token = Utility.getLoginUserDetail()?.token {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["content_id"] = moduleID
            
            let headerParam = NSMutableDictionary()
            headerParam["token"] =  token
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.reviewTest, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Review Test : ------> ",Utility.jsonToString(json: data) ?? "Review Test Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSDictionary{
                                
                                self.reviewTestModel = RWReviewTestModel(object: resultData)
                            }
                            
                        }else{
                            
                            let message : String =  data.value(forKey: "message")  as! String
                            Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                        }
                        
                    }
                    else{
                        
                        Utility.showAlert(message: "Data not found.", title: AppName, actions: nil, controller: self)
                    }
                    
                }
                self.stopAnimating()
            })
            
        }
        else{
            
            Utility.showAlert(message: "content id not available or your not login properly", title: AppName, actions: nil, controller: self)
        }
        
    }
    
    func callWebserviceForStartAssessment() {
        
        if let moduleID = self.contentId , let token = Utility.getLoginUserDetail()?.token {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["content_id"] = moduleID
            
            let headerParam = NSMutableDictionary()
            headerParam["token"] =  token
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.startTest, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                print("Start Test : ------> ",data ?? "Start Test Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSDictionary{
                                
                                self.startTestModel = StartTestModel(object: resultData)
                            }
                            
                        }else{
                            
                            let message : String =  data.value(forKey: "message")  as! String
                            Utility.showAlert(message: message, title: AppName, actions: nil, controller: self)
                        }
                        
                    }
                    else{
                        
                        Utility.showAlert(message: "Data not found.", title: AppName, actions: nil, controller: self)
                    }
                    
                }
                self.stopAnimating()
            })
            
        }
        else{
            
            Utility.showAlert(message: "content id not available or your not login properly", title: AppName, actions: nil, controller: self)
        }
        
    }
}
