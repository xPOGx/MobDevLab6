//
//  GraphViewContoller.swift
//  MobDev
//
//  Created by POG on 19.12.2020.
//

import Charts
import UIKit

class GraphViewContoller: UIViewController, ChartViewDelegate {
    
    var lineChartView = LineChartView()

       override func viewDidLoad() {
        super.viewDidLoad()
        lineChartView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lineChartView.frame = CGRect(x: 0, y: 0,
                                                    width: self.view.safeAreaLayoutGuide.layoutFrame.width,
                                                    height: self.view.safeAreaLayoutGuide.layoutFrame.height)
        lineChartView.center = view.center
        view.addSubview(lineChartView)
        
        let yse1 = Array(-7...7).map {
            x in ChartDataEntry(x: Double(x),
                                y: sin(Double(x)))
        }
        
        let set = LineChartDataSet(entries: yse1)
        set.colors = [NSUIColor.red]
        set.drawCirclesEnabled = false
        set.drawValuesEnabled = false
        set.mode = .cubicBezier
        let data = LineChartData(dataSet: set)
        lineChartView.data = data
    }
   
}
