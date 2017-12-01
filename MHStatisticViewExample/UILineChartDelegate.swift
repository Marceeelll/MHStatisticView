//
//  UILineChartDelegate.swift
//  MHStatisticViewExample
//
//  Created by Marcel Hagmann on 11.11.17.
//  Copyright © 2017 Marcel Hagmann. All rights reserved.
//

import MHStatisticFramework

class UILineChartDelegate: NSObject, UIStatisticViewDelegate {
    func statisticView(_ statisticView: UIStatisticLineChartView, didSelectedIndex index: Int) {
        print("Did selected index: \(index)")
    }
}
