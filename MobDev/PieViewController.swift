//
//  PieViewController.swift
//  MobDev
//
//  Created by POG on 19.12.2020.
//

import Charts
import UIKit

class PieViewContoller: UIViewController, ChartViewDelegate {
    
    var pieChart = PieChartView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pieChart.frame = CGRect(x: 0, y: 0,
                                width: self.view.safeAreaLayoutGuide.layoutFrame.width,
                                height: self.view.safeAreaLayoutGuide.layoutFrame.height)
        pieChart.center = view.center
        view.addSubview(pieChart)
        
        var entries: [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: 25))
        entries.append(PieChartDataEntry(value: 20))
        entries.append(PieChartDataEntry(value: 55))
        
        let set = PieChartDataSet(entries: entries)
        set.colors = [NSUIColor.systemYellow, NSUIColor.systemGreen, NSUIColor.systemBlue]
        let data = PieChartData(dataSet: set)
        pieChart.data = data
    }
}
