# MHStatisticView - Preview
![alt text](http://marcelhagmann.de/wp-content/uploads/2017/12/ScreenshotExample0.png "Preview")

# MHStatisticView
```swift
var drawXLabelForEveryXElement: Int = 1
var gradientColors: [CGColor]
var selectedCircleLineWidth: CGFloat = 3.0
var selectedCircleRadius: CGFloat = 10.0
var circleRadius: CGFloat = 7.0
var lineWidth: CGFloat = 3.0
var legendFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
var shouldDrawCircleForEachData = false
var legendTextColor = UIColor.black

var margin: CGFloat = 20
var marginTop: CGFloat = 10
var marginRight: CGFloat = 0
var marginBottom: CGFloat = 20
var marginLeft: CGFloat = 40

func setMargin(top: CGFloat, right: CGFloat, bottom: CGFloat, left: CGFloat)
var paddingTopLine: CGFloat = 10
var paddingBottomLine: CGFloat = 10

var dataSource: UIStatisticViewDataSource? = nil
var delegate: UIStatisticViewDelegate? = nil

func reloadData()
func viewDidLayoutSubviews()
```

---
## UILineChartDelegate
```swift
func statisticView(_ statisticView: UIStatisticLineChartView, didSelectedIndexindex: Int)
func statisticView(_ statisticView: UIStatisticLineChartView, isSelecting: Bool)
```

---
## UILineChartDataSource
```swift
func dataToDisplay(in statisticView: UIStatisticLineChartView) -> [CGFloat]
func legendX(for statisticView: UIStatisticLineChartView) -> [String]
func legendY(for statisticView: UIStatisticLineChartView) -> [String]
```

## Margin & Padding
![alt text](http://marcelhagmann.de/wp-content/uploads/2017/12/ScreenshotDescription-1.png "Margin & Padding Description")

---
## Errors that can occur
**2017-11-11 11:00:37.562686+0100 MHStatisticViewExample[4051:236395] Unknown class UIStatisticLineChartView in Interface Builder file.**
1. Go to your Storyboard
2. Select the UIStatisticLineChartView
3. Set the Module to "MHStatisticFramework"
![alt text](http://marcelhagmann.de/wp-content/uploads/2017/12/MHStatisticView-error-that-can-occur-1.png "Error that can occur 1")

