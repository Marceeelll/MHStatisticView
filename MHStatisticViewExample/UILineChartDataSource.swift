//
//  UILineChartDataSource.swift
//  MHStatisticViewExample
//
//  Created by Marcel Hagmann on 11.11.17.
//  Copyright © 2017 Marcel Hagmann. All rights reserved.
//

import MHStatisticFramework

class UILineChartDataSource: NSObject, UIStatisticViewDataSource {
    private var data: [CGFloat] = []
    private var legendY: [String] = []
    private var legendX: [String] = []
    
    override init() {
        super.init()
        legendY = calculateYTitles()
    }
    
    func append(data: CGFloat, legendXTitle: String) {
        self.data.append(data)
        self.legendX.append(legendXTitle)
        self.legendY = calculateYTitles()
    }
    
    private func calculateYTitles() -> [String] {
        // TODO: Here you can calculate the new Y-Legend-Titles
        return ["Max." , "", "Min"]
    }
    
    func resetDataSource() {
        data.removeAll()
        legendX.removeAll()
    }
    
    
    // MARK: - UIStatisticViewDataSource
    func dataToDisplay(in statisticView: UIStatisticLineChartView) -> [CGFloat] {
        return data
    }
    
    func legendX(for statisticView: UIStatisticLineChartView) -> [String] {
        return legendX
    }
    
    func legendY(for statisticView: UIStatisticLineChartView) -> [String] {
        return legendY
    }
}
