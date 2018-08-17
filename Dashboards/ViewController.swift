//
//  ViewController.swift
//  Dashboards
//
//  Created by Marcelo on 14/08/2018.
//  Copyright © 2018 Marcelo. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var iosStepper: UIStepper!
    @IBOutlet weak var macStepper: UIStepper!
    @IBOutlet weak var winStepper: UIStepper!
    
    
    var iosDataEntry = PieChartDataEntry(value: 0);
    var macDataEntry = PieChartDataEntry(value: 0);
    var winDataEntry = PieChartDataEntry(value: 0);
    
    var numberOfDownloadDatasEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChart.chartDescription?.text = "";
        iosDataEntry.value = iosStepper.value;
        iosDataEntry.label = "iOS";
        
        macDataEntry.value = macStepper.value;
        macDataEntry.label = "macOS";
        
        winDataEntry.value = winStepper.value;
        winDataEntry.label = "Windows";
        
        numberOfDownloadDatasEntries = [iosDataEntry, macDataEntry, winDataEntry];
        updateChartData();
        
    }
    
    @IBAction func changeiOS(_ sender: UIStepper) {
        iosDataEntry.value = sender.value;
        updateChartData();
    }
    
    @IBAction func changeMac(_ sender: UIStepper) {
        macDataEntry.value = sender.value;
        updateChartData();
    }
    
    @IBAction func changeWindows(_ sender: UIStepper) {
        winDataEntry.value = sender.value;
        updateChartData();
    }
    
    func updateChartData() {
        let charDataSet = PieChartDataSet(values: numberOfDownloadDatasEntries, label: nil);
        let charData = PieChartData(dataSet: charDataSet);
        let colors = [UIColor(named: "iosColor"), UIColor(named: "macColor"), UIColor(named: "winColor")];
        charDataSet.colors = colors as! [NSUIColor];
        pieChart.data = charData;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


