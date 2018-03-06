//
//  TDetailDashBoardViewController.swift
//  TalentEdge
//
//  Created by Ashish Mittal  on 01/06/17.
//  Copyright © 2017 Aditya Sharma. All rights reserved.
//

import UIKit
import Charts

class TDetailDashBoardViewController: BCUIViewController , UIScrollViewDelegate{
    
    
    var batchID:String?
    
    @IBOutlet weak var attendanceView: UIView!
    
    @IBOutlet weak var attLeftTopLabel: UILabel!
    
    
    @IBOutlet weak var attLeftBottomLabel: UILabel!
    
    
    @IBOutlet weak var attMiddleLabel: UILabel!
    
    
    @IBOutlet weak var attMiddleView: UIView!
    
    
    @IBOutlet weak var attRightTopLabel: UILabel!
    
    
    @IBOutlet weak var attRightBottomLabel: UILabel!
    
    
    @IBOutlet weak var notesView: UIView!
    
    
    @IBOutlet weak var notLeftTopLabel: UILabel!
    
    @IBOutlet weak var notLeftBottomLabel: UILabel!
    
    
    @IBOutlet weak var notMiddleLabel: UILabel!
    
    
    
    @IBOutlet weak var notMiddleView: UIView!
    
    
    @IBOutlet weak var notRightTopLabel: UILabel!
    
    
    @IBOutlet weak var notRightBottomLabel: UILabel!
    
    
    @IBOutlet weak var vidRightBottomLabel: UILabel!
    
    
    @IBOutlet weak var asiRightBottomLabel: UILabel!
    
    
    
    
    @IBOutlet weak var assRightBottomLabel: UILabel!
    
    
    
    @IBOutlet weak var queRightBottomLabel: UILabel!
    
    
    
    @IBOutlet weak var queRightTopLabel: UILabel!
    
    @IBOutlet weak var assRightTopLabel: UILabel!
    
    
    @IBOutlet weak var asiRightTopLabel: UILabel!
    
    
    @IBOutlet weak var vidRightTopLabel: UILabel!
    
    
    @IBOutlet weak var videoView: UIView!
    
    
    @IBOutlet weak var vidLeftTopLabel: UILabel!
    
    
    
    
    @IBOutlet weak var asiLeftTopLabel: UILabel!
    
    
    @IBOutlet weak var assLeftTopLabel: UILabel!
    
    
    @IBOutlet weak var queLeftTopLabel: UILabel!
    
    
    
    @IBOutlet weak var vidMiddleLabel: UILabel!
    
    
    
    @IBOutlet weak var vidMiddleView: UIView!
    
    
    @IBOutlet weak var asiMiddleView: UIView!
    
    
    
    
    
    
    
    
    @IBOutlet weak var assignmentView: UIView!
    
    @IBOutlet weak var asiMiddleLabel: UILabel!
    
    @IBOutlet weak var assMiddleLabel: UILabel!
    
    
    
    
    
    
    @IBOutlet weak var queryView: UIView!
    
    @IBOutlet weak var queMiddleLabel: UILabel!
    
    @IBOutlet weak var queMiddleView: UIView!
    
    
    @IBOutlet weak var assMiddleView: UIView!
    @IBOutlet weak var AssessmentView: UIView!
    
    @IBOutlet weak var vidLeftBottomLabel: UILabel!
    
    
    @IBOutlet weak var asiLeftBottomLabel: UILabel!
    
    
    @IBOutlet weak var assLeftBottomLabel: UILabel!
    
    
    
    @IBOutlet weak var queLEftBottomLabel: UILabel!
    
    
    @IBOutlet weak var scrollViewForImageSlider: UIScrollView!
    
    //@IBOutlet weak var pageControlForImageSlider: PageControlForImagesInSignUpScreen!
    
    
    @IBOutlet weak var notesLabel: UILabel!
    
    
    @IBOutlet weak var notesChart: BarChartView!
    
    
    @IBOutlet weak var notesChartDescription: UIView!
    
    @IBOutlet weak var assignmentLabel: UILabel!
    
    
    @IBOutlet weak var assignementChart: LineChartView!
    
    @IBOutlet weak var assignemntDescription: UIView!
    
    
    
    @IBOutlet weak var assessmentLabel: UILabel!
    
    
    
    @IBOutlet weak var assessmentChart: LineChartView!
    
    
    @IBOutlet weak var assessmentDescription: UIView!
    
    
    var model:AnalyticsBase?
    
    var numberOFpagesForSliider : Int?
    
    
    
    @IBOutlet weak var notes1: UILabel!
    
    
    @IBOutlet weak var notes2: UILabel!
    
    
    @IBOutlet weak var notes3: UILabel!
    
    
    @IBOutlet weak var notes4: UILabel!
    
    
    @IBOutlet weak var notes5: UILabel!
    
    @IBOutlet weak var asi1: UILabel!
    
    
    @IBOutlet weak var asi2: UILabel!
    
    
    @IBOutlet weak var asi3: UILabel!
    
    
    @IBOutlet weak var asi4: UILabel!
    
    @IBOutlet weak var asi5: UILabel!
    
    
    
    @IBOutlet weak var ass1: UILabel!
    
    
    @IBOutlet weak var ass2: UILabel!
    
    @IBOutlet weak var ass3: UILabel!
    
    
    @IBOutlet weak var ass4: UILabel!
    
    
    @IBOutlet weak var ass5: UILabel!
    
    
    @IBOutlet weak var mainscrollView: UIScrollView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //self.mainscrollView.addScalableCover(with: ModelManager.singleton.courseImage)
        self.mainscrollView.isHidden = false 
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.mainscrollView.isHidden = true
        self.getData()
    }
    
    func setUpLiveClasses(_ model:Analytics)
    {
        self.attLeftTopLabel.text = model.totalLiveClass
        self.attLeftBottomLabel.text = "Live Classes"
        
        self.attMiddleLabel.text = model.avgLcCompPercent! + "% Attendance"
        let l = Int(model.totalLiveclassMinutes ?? "0")!/60
        let r = Int(model.totalLiveclassMinutes ?? "0")!%60
        let str:String = "\(l):\(r) hrs"
        self.attRightTopLabel.text = str
        
        drawLineFromPoint(CGPoint(x: Double(self.attMiddleView.frame.size.width - 10) * (0/100), y: 20.0), ofColor: Utility.colorWithHexString("3bab14"), inView: (self.attMiddleView ), model.avgLcCompPercent! )
        
    }
    func setUpNotes(_ model: Analytics)
    {
        self.notLeftTopLabel.text = model.totalNotes
        self.notLeftBottomLabel.text = "Notes"
        self.notMiddleLabel.text = (model.avgNotesCompPercent ?? "0") + "% Completed"
        self.notRightTopLabel.text = (model.totalNotesPages ?? "0") + " Pages"
        
        drawLineFromPoint(CGPoint(x: Double(self.notMiddleView.frame.size.width - 10) * (0/100), y: 20.0), ofColor: Utility.colorWithHexString("3bab14"), inView: (self.notMiddleView ), model.avgNotesCompPercent!)
        //self.notMiddleView.isHidden = true
    }
    
    func setUpvideos(_ model: Analytics)
    {
        
        self.vidLeftTopLabel.text = model.totalVideo
        self.vidLeftBottomLabel.text = "Videos"
        self.vidMiddleLabel.text = (model.avgIntvideoCompPercent ?? "0") + "% Completed"
        
        drawLineFromPoint(CGPoint(x: Double(self.vidMiddleView.frame.size.width - 10) * (0/100), y: 20.0), ofColor: Utility.colorWithHexString("3bab14"), inView: (self.vidMiddleView ), model.avgVideoCompPercent!)
        
        let l = Int(model.totalLiveclassMinutes ?? "0")!/60
        let r = Int(model.totalLiveclassMinutes ?? "0")!%60
        let str:String = "\(l):\(r) hrs"
        self.vidRightTopLabel.text = str
        //self.vidMiddleView.isHidden = true
    }
    /*
     
     */
    func setUpAssignments(_ model: Analytics)
    {
        
        if let value = model.avgAssignmentCompPercent{
            
            if value.isEmpty == true{
                
                model.avgAssignmentCompPercent = "0"
            }
            
        }else{
            
            model.avgAssignmentCompPercent = "0"
        }
        
        self.asiLeftTopLabel.text = model.totalAssignment
        self.asiLeftBottomLabel.text = "Assignments"
        self.asiMiddleLabel.text = (model.avgAssignmentCompPercent ?? "0") + "% Submitted"
        
        model.avgAssignmentCompPercent = model.avgAssignmentCompPercent ?? "0"
        
        drawLineFromPoint(CGPoint(x: Double(self.asiMiddleView.frame.size.width - 10) * (0/100), y: 20.0), ofColor: Utility.colorWithHexString("3bab14"), inView: (self.asiMiddleView ), model.avgAssignmentCompPercent!)
        self.asiRightTopLabel.text = (model.assessmentStudentsCount ?? "0") + " Students"
        
    }
    
    func setUpAssessments(_ model:Analytics){
       
        if let value = model.avgAssessmentCompPercent{
            
            if value.isEmpty == true{
                
                model.avgAssessmentCompPercent = "0"
            }
            
        }else{
            
            model.avgAssessmentCompPercent = "0"
        }
        
        self.assLeftTopLabel.text = model.totalAssessment ?? ""
         self.assLeftBottomLabel.text = "Assessments"
         self.assMiddleLabel.text = "\((model.avgAssessmentCompPercent ?? "0")) % Submitted"
        
        drawLineFromPoint(CGPoint(x: Double(self.assMiddleView.frame.size.width - 10) * (0/100), y: 20.0), ofColor: Utility.colorWithHexString("3bab14"), inView: (self.assMiddleView ),model.avgAssessmentCompPercent!)
        
        self.assRightTopLabel.text = "\((model.assignmentStudentsCount ?? "0")) Students"
         //self.assMiddleView.isHidden = true
    }
    
    func setUpqueries(_ model: Queries)
    {
        
        self.queLeftTopLabel.text = model.numQueries
        self.queLEftBottomLabel.text = "Queries for Faculty"
        let per :Int
        if(Int(model.numQueries!) != 0 ){
            per = Int(Int(model.numQueriesAnswered!)! / Int(model.numQueries ?? "0" )!)*100
        }
        else
        {
            per = 0
        }
        self.queMiddleLabel.text = String(per) + "% Answered"
        
        drawLineFromPoint(CGPoint(x: Double(self.queMiddleView.frame.size.width - 10) * (0/100), y: 20.0), ofColor: Utility.colorWithHexString("3bab14"), inView: (self.queMiddleView ), String(per) )
        
        self.queRightTopLabel.text  =  (model.numStudents ?? "0") + " Students"
        // self.queMiddleView.isHidden = true
        
    }
    
    func addImageInSlider(){
        
        // timer?.invalidate()
        let scrollViewWidth: CGFloat = self.scrollViewForImageSlider.frame.size.width
        // width of scrollView for images
        let scrollViewHeight: CGFloat = self.scrollViewForImageSlider.frame.size.height
        
        let modelArray  = self.model?.liveClasses
        numberOFpagesForSliider = self.model?.liveClasses?.count
        
        for i in 0..<(self.model!.liveClasses?.count)!
        {
            let Sub = modelArray?[i]
            
            let viewForLiveClasses = Bundle.main.loadNibNamed("DetailDashBoardFirstView", owner: self, options: nil)?[0] as? UIView as! DetailDashBoardFirstView?
            viewForLiveClasses?.frame = CGRect(x:  CGFloat(CGFloat(i) * scrollViewWidth) , y:0, width: (self.scrollViewForImageSlider?.frame.size.width)!, height: (self.scrollViewForImageSlider?.frame.size.height)!)
            viewForLiveClasses?.setUpTheLabels(Sub!)
            self.scrollViewForImageSlider.addSubview(viewForLiveClasses!)
        }
        self.scrollViewForImageSlider.showsVerticalScrollIndicator = false
        self.scrollViewForImageSlider.showsHorizontalScrollIndicator = false
        let count:CGFloat = CGFloat((self.model!.liveClasses?.count)!)
        self.scrollViewForImageSlider.contentSize = CGSize(width: CGFloat(scrollViewWidth * count), height: CGFloat(scrollViewHeight))
        self.scrollViewForImageSlider.setContentOffset(CGPoint(x: CGFloat(0), y: CGFloat(0)), animated: true)
        
    }
    
    /*func addPageControl() {
        
        self.pageControlForImageSlider.numberOfPages = (numberOFpagesForSliider)!
        self.pageControlForImageSlider.addTarget(self, action: #selector(self.onPageControlPageChanged), for: .valueChanged)
        let page: Int = Int(self.scrollViewForImageSlider.contentOffset.x) / Int(self.scrollViewForImageSlider.frame.size.width)
        self.pageControlForImageSlider.currentPage = page
        self.pageControlForImageSlider.setCurrentPageLocal(page)
        
        //page is set to current image in UIPageControl on changing image in scrollView for images
    }
    
    func onPageControlPageChanged(_ pageControl_: UIPageControl) {
        
        if let pageControlLocal : PageControlForImagesInSignUpScreen  = pageControl_ as? PageControlForImagesInSignUpScreen {
            let offsetX: CGFloat = CGFloat(pageControlLocal.currentPage) * self.scrollViewForImageSlider.frame.size.width
            let offset = CGPoint(x: CGFloat(offsetX), y: CGFloat(0))
            self.scrollViewForImageSlider.setContentOffset(offset, animated: true)
            //offset of scrollview for images is changed on changing pagecontrol
            pageControlLocal.setCurrentPageLocal(pageControl_.currentPage)
        }
        
        
    }*/
    
    
    
    
    func drawLineFromPoint(_ end:CGPoint, ofColor lineColor: UIColor, inView view:UIView, _ attendance_percentage : String = "0") {
        
        //design the path
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 20))
        
        path.addLine(to: CGPoint(x: Double(view.frame.size.width ) * Double(attendance_percentage)!/100, y: 20))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.strokeColor = UIColor.init(hexString: "2F9DD4").cgColor
        shapeLayer.lineWidth = 10.0
        
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: 0, y: 20))
        path1.addLine(to: CGPoint(x: view.frame.size.width, y: 20))
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.path = path1.cgPath
        shapeLayer1.strokeColor = UIColor.init(hexString: "D2D4D6").cgColor
        shapeLayer1.lineWidth = 10.0
        
        view.layer.addSublayer(shapeLayer1)
        view.layer.addSublayer(shapeLayer)
    }
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView_: UIScrollView) {
        if(scrollView_.tag == 2){
            let page: Int = Int(self.scrollViewForImageSlider.contentOffset.x) / Int(self.scrollViewForImageSlider.frame.size.width)
            //self.pageControlForImageSlider.currentPage = page
            //self.pageControlForImageSlider.setCurrentPageLocal(page)
            
            //page is set to current image in UIPageControl on changing image in scrollView for images
        }
        // timer?.invalidate()
    }
    
    
    // for charts methods
    func ImplementStackBar()
    {
        //notesChart.description = ""
        //notesChart.description = ""
        notesChart.getAxis(.right).enabled = false
        notesChart.xAxis.labelPosition  = .bottom
        notesChart.drawGridBackgroundEnabled = true
        let l: Legend? = notesChart.legend
        l?.drawInside = false
        l?.form = .square
        notesChart.xAxis.centerAxisLabelsEnabled = false
        notesChart.xAxis.granularity = 1
        updateChartDataForStackedBar()
    }
    
    func updateChartDataForStackedBar()
    {
        setDataCountForStackedBar()
    }
    
    func setDataCountForStackedBar()
    {
        
        //        for i in 0..<count {
        //            let mult: Double = (range + 1)
        //            let val1 = Double(arc4random_uniform(UInt32(mult)) + mult / 3)
        //            let val2 = Double(arc4random_uniform(UInt32(mult)) + mult / 3)
        //            let val3 = Double(arc4random_uniform(UInt32(mult)) + mult / 3)
        //            yVals.append(BarChartDataEntry(x: i, yValues: [(val1), (val2), (val3)], icon: UIImage(named: "icon")))
        //        }
        var set1: BarChartDataSet? = nil
        //        if (chartView.data?.dataSetCount)! > 0 {
        ////            set1 = (chartView.data?.dataSets[0] as? BarChartDataSet)
        ////            set1?.values = yVals as! [ChartDataEntry]
        ////            chartView.data?.notifyDataChanged()
        ////            chartView.notifyDataSetChanged()
        //        }
        //        else {
        notesChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:["0","1","2","3","4"])
        
        // let values = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        
        let notes =  self.model?.notesanAnalytics
        updateNotesLabel(notes!)
        
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<(notes?.count)! {
            // let dataEntry = BarChartDataEntry(x: values[i], y: Double(i))
            
            //          "completed": 0,
            
            let arrForY = [Double((notes?[i] as! NotesanAnalytics).completed!) ,Double((notes?[i] as! NotesanAnalytics).notStarted!),Double((notes?[i] as! NotesanAnalytics).inProgress!)]
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: arrForY as! [Double])
            
            // let dataEntry2 = BarChartDataEntry(
            dataEntries.append(dataEntry)
        }
        
        // let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        //let chartData = BarChartData(dataSet: chartDataSet)
        
        
        set1 = BarChartDataSet(values: dataEntries, label: "")
        set1?.drawIconsEnabled = false
        //set1?.colors = [ChartColorTemplates.material[0], ChartColorTemplates.material[1], ChartColorTemplates.material[2]]
        
        //299DD5
        //F07A1A
        //3C4B5C
        
        set1?.colors = [UIColor.init(hexString:"299DD5") , UIColor.init(hexString:"F07A1A"),UIColor.init(hexString:"3C4B5C")]
        //ChartColorTemplates.colorful()
        set1?.stackLabels = ["Completed", "In-Progress", "Not Started"]
        var dataSets = [BarChartDataSet]()
        dataSets.append(set1!)
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        // formatter.negativeSuffix = " $"
        //formatter.positiveSuffix = " $"
        let data = BarChartData(dataSets: dataSets)
        
        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: CGFloat(7.0))!)
        data.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        data.setValueTextColor(UIColor.white)
        notesChart.fitBars = true
        notesChart.data = data
        
    }
    
    func updateNotesLabel(_ model:[NotesanAnalytics])
    {
        
        if model.count == 0 {
            notes1.text = ""
            notes2.text = ""
            notes3.text = ""
            notes4.text = ""
            notes5.text = ""
        }
        
        //"4) -> " +
        //
        if model.count == 1{
            notes1.text = "0) -> "  + (model[0].title ?? "NA")
            notes2.text = ""
            notes3.text = ""
            notes4.text = ""
            notes5.text = ""
        }
        if model.count == 2
        {   notes1.text = "0) -> " + (model[0].title ?? "NA")
            notes2.text = "1) -> " + (model[1].title ?? "NA")
            notes3.text = ""
            notes4.text = ""
            notes5.text = ""
        }
        
        
        
        
        if model.count == 3{
            notes1.text = "0) -> " + (model[0].title ?? "NA")
            notes2.text = "1) -> " + (model[1].title ?? "NA")
            notes3.text = "2) -> " + (model[2].title ?? "NA")
            notes4.text = ""
            notes5.text = ""
        }
        
        if model.count == 4{
            
            notes1.text = "0) -> " + (model[0].title ?? "NA")
            notes2.text = "1) -> " + (model[1].title ?? "NA")
            notes3.text = "2) -> " + (model[2].title ?? "NA")
            notes4.text = "3) -> " + (model[3].title ?? "NA")
            notes5.text = ""
        }
        
        if model.count == 5
        {
            notes1.text = "0) -> " + (model[0].title ?? "NA")
            notes2.text = "1) -> " + (model[1].title ?? "NA")
            notes3.text = "2) -> " + (model[2].title ?? "NA")
            notes4.text = "3) -> " + (model[3].title ?? "NA")
            notes5.text = "4) -> " + (model[4].title ?? "NA")
            // notes5.text = (model[4] as! NotesAndVideo).title
        }
    }
    
    func updateAssignmentLabel( model:[AssignmentAnalytics])
    {
        if model.count == 0 {
            asi1.text = ""
            asi2.text = ""
            asi3.text = ""
            asi4.text = ""
            asi5.text = ""
        }
        
        
        if model.count == 1{
            asi1.text = "0) -> " + (model[0].title ?? "NA")
            asi2.text = ""
            asi3.text = ""
            asi4.text = ""
            asi5.text = ""
        }
        if model.count == 2
        {   asi1.text = "0) -> " + (model[0].title ?? "NA")
            asi2.text = "1) -> " + (model[1].title ?? "NA")
            asi3.text = ""
            asi4.text = ""
            asi5.text = ""
        }
        
        
        if model.count == 3{
            asi1.text = "0) -> " + (model[0].title ?? "NA")
            asi2.text = "1) -> " + (model[1].title ?? "NA")
            asi3.text = "2) -> " + (model[2].title ?? "NA")
            asi4.text = ""
            asi5.text = ""
        }
        
        
        if model.count == 4
        {   asi1.text = "0) -> " + (model[0].title ?? "NA")
            asi2.text = "1) -> " + (model[1].title ?? "NA")
            asi3.text = "2) -> " + (model[2].title ?? "NA")
            asi4.text = "3) -> " + (model[3].title ?? "NA")
            // asi5.text = "4) -> " + (model[4] as! NotesAndVideo).title
        }
        
        
        if model.count == 5
        {
            asi1.text = "0) -> " + (model[0].title ?? "NA")
            asi2.text = "1) -> " + (model[1].title ?? "NA")
            asi3.text = "2) -> " + (model[2].title ?? "NA")
            asi4.text = "3) -> " + (model[3].title ?? "NA")
            asi5.text   = "4) -> " + (model[4].title ?? "NA")
            // notes5.text = (model[4] as! NotesAndVideo).title
        }
        
    }
    
    func updateAssessmentLabel(_ model:[AssessmentAnalytics])
    {
        if model.count == 0 {
            ass1.text = ""
            ass2.text = ""
            ass3.text = ""
            ass4.text = ""
            ass5.text = ""
        }
        
        
        if model.count == 1{
            ass1.text = "0) -> " + (model[0].title ?? "NA")
            ass2.text = ""
            ass3.text = ""
            ass4.text = ""
            ass5.text = ""
        }
        if model.count == 2
        {   ass1.text = "0) -> " + (model[0].title ?? "NA")
            ass2.text = "1) -> " + (model[1].title ?? "NA")
            ass3.text = ""
            ass4.text = ""
            ass5.text = ""
        }
        
        
        if model.count == 3{
            ass1.text = "0) -> " + (model[0].title ?? "NA")
            ass2.text = "1) -> " + (model[1].title ?? "NA")
            ass3.text = "2) -> " + (model[2].title ?? "NA")
            ass4.text = ""
            ass5.text = ""
        }
        
        
        if model.count == 4
        {   ass1.text = "0) -> " + (model[0].title ?? "NA")
            ass2.text = "1) -> " + (model[1].title ?? "NA")
            ass3.text = "2) -> " + (model[2].title ?? "NA")
            ass4.text = "3) -> " + (model[3].title ?? "NA")
            //ass5.text = "4) -> " + (model[4] as! NotesAndVideo).title
        }
        
        
        if model.count == 5
        {
            ass1.text = "0) -> " + (model[0].title ?? "NA")
            ass2.text = "1) -> " + (model[1].title ?? "NA")
            ass3.text = "2) -> " + (model[2].title ?? "NA")
            ass4.text = "3) -> " + (model[3].title ?? "NA")
            ass5.text   = "4) -> " + (model[4].title ?? "NA")
            // notes5.text = (model[4] as! NotesAndVideo).title
        }
    }
    
    func implementChartLineForAssignment()
    {
        
        assignementChart.chartDescription?.text = ""
        assignementChart.dragEnabled = true
        assignementChart.setScaleEnabled(true)
        assignementChart.pinchZoomEnabled = true
        assignementChart.drawGridBackgroundEnabled = false
        assignementChart.rightAxis.enabled = false
        
        assignementChart.legend.form = .line
        updateChartDataForLineChart()
        
    }
    
    func updateChartDataForLineChart()
    {
        setDataCountForLineChartForAssignment()
    }
    
    func setDataCountForLineChartForAssignment()
    {
        var set1: LineChartDataSet? = nil
        //        if chartView.data.dataSetCount > 0 {
        //            set1 = (chartView.data.dataSets[0] as? LineChartDataSet)
        //            set1?.values = values
        //            chartView.data.notifyDataChanged()
        //            chartView.notifyDataSetChanged()
        //        }
        //        else {
        
        
        assignementChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:["0","1","2","3","4"])
        assignementChart.xAxis.labelPosition  = .bottom
        
        
        
        var dataEntries: [ChartDataEntry] = []
        // uncomment it
        
        var assignment  = self.model?.assignmentAnalytics
        
        updateAssignmentLabel(model: assignment!)
        
        
        for i in 0..<(assignment?.count)! {
            // let dataEntry = BarChartDataEntry(x: values[i], y: Double(i))
            let obj = (assignment?[i])
            let value:Double = Double(Int((obj?.completed ?? 0))/(Int(obj?.completed ?? 0) + Int((obj!.notStarted ?? 0)))*100)
            let dataEntry = ChartDataEntry(x: Double(i), y: value)
            
            
            // let dataEntry2 = BarChartDataEntry(
            dataEntries.append(dataEntry)
        }
        
        set1 = LineChartDataSet(values: dataEntries, label: "DataSet 1")
        set1?.drawIconsEnabled = false
        //set1?.lineDashLengths = [5.0, 2.5]
        //set1?.highlightLineDashLengths = [5.0, 2.5]
        set1?.colors = [UIColor.init(hexString:"299DD5")]
        set1?.circleColors = [UIColor.white]
        set1?.drawCircleHoleEnabled = true
        set1?.circleHoleColor = UIColor.blue
        set1?.lineWidth = 1.0
        set1?.circleRadius = 6.0
        set1?.circleHoleRadius = 2.0
        //set1?.drawCircleHoleEnabled = false
        set1?.valueFont = UIFont.systemFont(ofSize: CGFloat(9.0))
        //set1?.formLineDashLengths = [5.0, 2.5]
        //set1?.formLineWidth = 1.0
        set1?.formSize = 15.0
        let gradientColors: [Any]? = [(ChartColorTemplates.colorFromString("#00ff0000").cgColor), (ChartColorTemplates.colorFromString("#ffff0000").cgColor)]
        let gradient: CGGradient? = CGGradient(colorsSpace: nil, colors: (gradientColors)! as CFArray, locations: nil)
        set1?.fillAlpha = 0.8
        // set1?.fill = Fill(linearGradient: gradient!, angle: 90.0)
        //  set1?.fill = UIColor.init(hexString: "299DD5").cgColor
        set1?.fill = Fill(CGColor: UIColor.init(hexString:"B9DEF1").cgColor)
        set1?.drawFilledEnabled = true
        var dataSets = [LineChartDataSet]()
        dataSets.append(set1!)
        let data = LineChartData(dataSets: dataSets)
        assignementChart.xAxis.granularity = 1
        assignementChart.getAxis(.right).drawGridLinesEnabled = false
        assignementChart.getAxis(.left).drawGridLinesEnabled = false
        
        assignementChart.data = data
        
    }
    
    
    func implementChartLineForAssessment()
    {
        assessmentChart.chartDescription?.text = ""
        assessmentChart.dragEnabled = true
        assessmentChart.setScaleEnabled(true)
        assessmentChart.pinchZoomEnabled = true
        assessmentChart.drawGridBackgroundEnabled = false
        assessmentChart.rightAxis.enabled = false
        assignementChart.legend.form = .line
        updateChartDataForLineChartForAssessMent()
    }
    
    func updateChartDataForLineChartForAssessMent()
    {
        setDataCountForLineChartForAssessment()
    }
    
    func setDataCountForLineChartForAssessment()
    {
        var set1: LineChartDataSet? = nil
        //        if chartView.data.dataSetCount > 0 {
        //            set1 = (chartView.data.dataSets[0] as? LineChartDataSet)
        //            set1?.values = values
        //            chartView.data.notifyDataChanged()
        //            chartView.notifyDataSetChanged()
        //        }
        //        else {
        
        assignementChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:["0","1","2","3","4"])
        assignementChart.xAxis.labelPosition  = .bottom
        
        //  let values = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        var dataEntries: [ChartDataEntry] = []
        
        let assessment  = self.model?.assessmentAnalytics
        
        updateAssessmentLabel(assessment!)
        
        for i in 0..<(assessment?.count)! {
            
            let obj = (assessment?[i])
            
            let value:Double = Double((obj!.completed ?? 0)/((obj!.completed ?? 0) + (obj!.notStarted ?? 0))*100)
            
            let dataEntry = ChartDataEntry(x: Double(i), y: Double(value))
            
            dataEntries.append(dataEntry)
        }
        
        set1 = LineChartDataSet(values: dataEntries, label: "DataSet 1")
        set1?.drawIconsEnabled = false
        //set1?.lineDashLengths = [5.0, 2.5]
        //set1?.highlightLineDashLengths = [5.0, 2.5]
        set1?.colors = [UIColor.init(hexString:"299DD5")]
        set1?.circleColors = [UIColor.white]
        set1?.drawCircleHoleEnabled = true
        set1?.circleHoleColor = UIColor.blue
        set1?.lineWidth = 1.0
        set1?.circleRadius = 6.0
        set1?.circleHoleRadius = 2.0
        //set1?.drawCircleHoleEnabled = false
        set1?.valueFont = UIFont.systemFont(ofSize: CGFloat(9.0))
        //set1?.formLineDashLengths = [5.0, 2.5]
        //set1?.formLineWidth = 1.0
        set1?.formSize = 15.0
        let gradientColors: [Any]? = [(ChartColorTemplates.colorFromString("#00ff0000").cgColor), (ChartColorTemplates.colorFromString("#ffff0000").cgColor)]
        let gradient: CGGradient? = CGGradient(colorsSpace: nil, colors: (gradientColors)! as CFArray, locations: nil)
        set1?.fillAlpha = 0.8
        // set1?.fill = Fill(linearGradient: gradient!, angle: 90.0)
        set1?.drawFilledEnabled = true
        set1?.fill = Fill(CGColor: UIColor.init(hexString: "B9DEF1").cgColor)
        var dataSets = [LineChartDataSet]()
        dataSets.append(set1!)
        let data = LineChartData(dataSets: dataSets)
        assessmentChart.xAxis.granularity = 1
        assessmentChart.getAxis(.right).drawGridLinesEnabled = false
        assessmentChart.getAxis(.left).drawGridLinesEnabled = false
        assessmentChart.data = data
    }
}

//MARK: - Network Call

extension TDetailDashBoardViewController {
    
    /*
     In Header
     deviceType: Android / IOS / WEB
     user_id: XXXX token: XXXX
     
     In Body
     batch_id:XX
     */
    
    func getData() {
        
        if let batchID = self.batchID {
            
            let dicParam  =  NSMutableDictionary()
            dicParam["batch_id"] = batchID
            
            let headerParam = NSMutableDictionary()
            
            self.startAnimating()
            
            NetworkManager.httpPostRequest(.getBatchAnalytics, dataParam: dicParam, requestHeader: headerParam, completionHandler: { (data : NSDictionary?, error : NSError?) in
                
                //print("getBatchAnalytics : ------> ",data ?? "Module Error");
                
                if let data = data{
                    
                    if let isSuccess = data.value(forKey: "status") as? Bool{
                        
                        if isSuccess == true{
                            
                            if let resultData = data.value(forKey: "resultData") as? NSDictionary{
                                
                                if let value = resultData.value(forKey: "batch_info") as? NSDictionary{
                         
                                    self.model = AnalyticsBase(object: value)
                                    self.setUpLiveClasses((self.model?.analytics)!)
                                    self.setUpNotes((self.model?.analytics)!)
                                    self.setUpvideos((self.model?.analytics)!)
                                    self.setUpAssignments((self.model?.analytics)!)
                                    self.setUpAssessments((self.model?.analytics)!)
                                    self.setUpqueries((self.model?.queries)!)
                                    
                                    self.addImageInSlider()
                                    //self.addPageControl()
                                    self.ImplementStackBar()  //uncomment
                                    self.implementChartLineForAssessment()   // uncomment
                                    self.implementChartLineForAssignment() // uncomment
                                }
                         }
                        }
                    }
                }
                self.mainscrollView.isHidden = false
                self.stopAnimating()
            })
        }
    }
}

