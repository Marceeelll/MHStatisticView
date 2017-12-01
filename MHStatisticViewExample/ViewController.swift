//
//  ViewController.swift
//  MHStatisticViewExample
//
//  Created by Marcel Hagmann on 11.11.17.
//  Copyright © 2017 Marcel Hagmann. All rights reserved.
//

import UIKit
import MHStatisticFramework

class ViewController: UIViewController {
    // MARK: UIStatisticLineChartView implementation
    @IBOutlet weak var lineChartView: UIStatisticLineChartView!
    
    var lineChartDelegate: UILineChartDelegate!
    var lineChartDataSource: UILineChartDataSource!
    
    let lineChartViewBackgroundColor = UIColor(red: 27.0/255.0, green: 37.0/255.0, blue: 51.0/255.0, alpha: 1.0)
    let lineChartLegendColor = UIColor.white
    let lineChartTintColor = UIColor(red: 143.0/255.0, green: 208.0/255.0, blue: 65.0/255.0, alpha: 1.0)
    
    let statColors: [(tintColor: UIColor, gradientColors: [CGColor])] = [(UIColor(red: 143.0/255.0, green: 208.0/255.0, blue: 65.0/255.0, alpha: 1.0),
                                                                       [UIColor(red: 180.0/255.0, green: 236.0/255.0, blue: 81.0/255.0, alpha: 0.42).cgColor,
                                                                        UIColor(red: 66.0/255.0, green: 147.0/255.0, blue: 33.0/255.0, alpha: 0.02).cgColor]),
        
                                                                       (UIColor(red: 197.0/255.0, green: 58.0/255.0, blue: 58.0/255.0, alpha: 1.0),
                                                                       [UIColor(red: 236.0/255.0, green: 81.0/255.0, blue: 81.0/255.0, alpha: 0.42).cgColor,
                                                                        UIColor(red: 147.0/255.0, green: 33.0/255.0, blue: 33.0/255.0, alpha: 0.02).cgColor]),
                                                                       
                                                                       (UIColor(red: 49.0/255.0, green: 91.0/255.0, blue: 190.0/255.0, alpha: 1.0),
                                                                        [UIColor(red: 81.0/255.0, green: 114.0/255.0, blue: 236.0/255.0, alpha: 0.42).cgColor,
                                                                         UIColor(red: 33.0/255.0, green: 34.0/255.0, blue: 147.0/255.0, alpha: 0.02).cgColor]),
                                                                       
                                                                       (UIColor(red: 190.0/255.0, green: 158.0/255.0, blue: 49.0/255.0, alpha: 1.0),
                                                                        [UIColor(red: 236.0/255.0, green: 221.0/255.0, blue: 81.0/255.0, alpha: 0.42).cgColor,
                                                                         UIColor(red: 145.0/255.0, green: 147.0/255.0, blue: 33.0/255.0, alpha: 0.02).cgColor])]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineChartDelegate = UILineChartDelegate()
        lineChartDataSource = UILineChartDataSource()
        
        lineChartView.delegate = lineChartDelegate
        lineChartView.dataSource = lineChartDataSource
        
        lineChartView.backgroundColor = lineChartViewBackgroundColor
        lineChartView.legendTextColor = lineChartLegendColor
        lineChartView.tintColor = lineChartTintColor
        
        setUpUIElements()
    }
    
    override func viewDidLayoutSubviews() {
        lineChartView.viewDidLayoutSubviews()
    }

    // MARK: - Other ViewController functions
    @IBOutlet weak var lblDrawXLabelForEveryXElement: UILabel!
    @IBOutlet weak var lblSelectedCircleLineWidth: UILabel!
    @IBOutlet weak var lblSelectedCircleRadius: UILabel!
    @IBOutlet weak var lblCircleRadius: UILabel!
    @IBOutlet weak var lblLineWidth: UILabel!
    @IBOutlet weak var lblShouldDrawCircleForEachData: UILabel!
    
    func setUpUIElements() {
        lblDrawXLabelForEveryXElement.adjustsFontSizeToFitWidth = true
        lblSelectedCircleLineWidth.adjustsFontSizeToFitWidth = true
        lblSelectedCircleRadius.adjustsFontSizeToFitWidth = true
        lblCircleRadius.adjustsFontSizeToFitWidth = true
        lblLineWidth.adjustsFontSizeToFitWidth = true
        lblShouldDrawCircleForEachData.adjustsFontSizeToFitWidth = true
    }
    
    @IBAction func drawXLabelForEveryXElementAction(_ sender: UISlider) {
        let result = Int(sender.value)
        lblDrawXLabelForEveryXElement.text = "drawXLabelForEveryXElement: \(result)"
        lineChartView.drawXLabelForEveryXElement = result
        lineChartView.reloadData()
    }
    
    @IBAction func selectedCircleLineWidthAction(_ sender: UISlider) {
        let result = String(format: "%.1f", sender.value)
        lblSelectedCircleLineWidth.text = "selectedCircleLineWidth: \(result)"
        lineChartView.selectedCircleLineWidth = CGFloat(sender.value)
        lineChartView.reloadData()
    }
    
    @IBAction func selectedCircleRadiusAction(_ sender: UISlider) {
        let result = String(format: "%.1f", sender.value)
        lblSelectedCircleRadius.text = "selectedCircleRadius: \(result)"
        lineChartView.selectedCircleRadius = CGFloat(sender.value)
        lineChartView.reloadData()
    }
    
    @IBAction func circleRadiusAction(_ sender: UISlider) {
        let result = String(format: "%.1f", sender.value)
        lblCircleRadius.text = "circleRadius: \(result)"
        lineChartView.circleRadius = CGFloat(sender.value)
        lineChartView.reloadData()
    }
    
    @IBAction func lineWidthAction(_ sender: UISlider) {
        let result = String(format: "%.1f", sender.value)
        lblLineWidth.text = "lineWidth: \(result)"
        lineChartView.lineWidth = CGFloat(sender.value)
        lineChartView.reloadData()
    }
    
    @IBAction func shouldDrawCircleForEachDataAction(_ sender: UISwitch) {
        let result = sender.isOn ? "on" : "off"
        lblShouldDrawCircleForEachData.text = "shouldDrawCircleForEachData: \(result)"
        lineChartView.shouldDrawCircleForEachData = sender.isOn
        lineChartView.reloadData()
    }
    @IBAction func changeColorAction(_ sender: UISegmentedControl) {
        let colors = statColors[sender.selectedSegmentIndex]
        lineChartView.tintColor = colors.tintColor
        lineChartView.gradientColors = colors.gradientColors
        lineChartView.reloadData()
    }
    
    @IBAction func resetDataAction(_ sender: UIButton) {
        lineChartDataSource.resetDataSource()
        lineChartView.reloadData()
    }
    
    @IBAction func addDataAction(_ sender: UIButton) {
        let random = arc4random_uniform(10) + 10
        let randomFloat = CGFloat(Int(random))
        lineChartDataSource.append(data: randomFloat, legendXTitle: "MH")
        lineChartView.reloadData()
    }
    
    
}
