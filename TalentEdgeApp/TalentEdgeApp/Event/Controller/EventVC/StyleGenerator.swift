import CalendarKit

struct StyleGenerator {
  static func defaultStyle() -> CalendarStyle {
    return CalendarStyle()
  }

  static func darkStyle() -> CalendarStyle {
    
    
    let selector = DaySelectorStyle()
    
    selector.activeTextColor = UIColor.white
    selector.inactiveTextColor = UIColor.white
    selector.selectedBackgroundColor = UIColor.orange
    selector.todayActiveBackgroundColor = UIColor.orange//UIColor(red: 148.0/255.0, green: 203.0/255.0, blue: 209.0/255.0, alpha: 1)
    selector.todayInactiveTextColor = UIColor(red: 148.0/255.0, green: 203.0/255.0, blue: 209.0/255.0, alpha: 1)

    let daySymbols = DaySymbolsStyle()
    
    daySymbols.weekDayColor = UIColor.white
    daySymbols.weekendColor = UIColor.orange
    

    let swipeLabel = SwipeLabelStyle()
    swipeLabel.textColor = UIColor.white

    let header = DayHeaderStyle()
    
    header.daySelector = selector
    header.daySymbols = daySymbols
    header.swipeLabel = swipeLabel
    
    let colors = Colors()
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 88))
    view.backgroundColor = UIColor.red
    let backgroundLayer = colors.gl
    backgroundLayer?.frame = view.frame
    view.layer.insertSublayer(backgroundLayer!, at: 0)
    header.backgroundColor = UIColor(patternImage: UIImage.init( view))
    //header.backgroundColor = UIColor.init(colorLiteralRed: 35.0/255.0, green: 71.0/255.0, blue: 149.0/255.0, alpha: 05)

    let timeline = TimelineStyle()
    timeline.timeIndicator.color = UIColor.white
    timeline.lineColor = UIColor.gray
    timeline.timeColor = UIColor.gray
    timeline.backgroundColor = UIColor.white
    
    
    
    let style = CalendarStyle()
    style.header = header
    style.timeline = timeline

    return style
  }
}
