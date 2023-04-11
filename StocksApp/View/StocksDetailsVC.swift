//
//  StocksDetailsVC.swift
//  Stock
//
//  Created by Said Tura Saidazimov on 25.03.2023.
//
import UIKit
import Foundation
import Charts

class StockDetailsVC: UIViewController {
    lazy var buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
        button.setTitle("Buy for $132.04", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 16, weight: .bold)
        button.heightAnchor.constraint(equalToConstant: 56).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHighlighted = true
        view.addSubview(button)
        return button
    }()
        
    
    lazy var buttonStack: UIStackView =  {
        let stack = UIStackView(arrangedSubviews: [
            CustomButton().configureButton(name: "D"),
            CustomButton().configureButton(name: "W"),
            CustomButton().configureButton(name: "M"),
            CustomButton().configureButton(name: "6M"),
            CustomButton().configureButton(name: "1Y"),
            CustomButton().configureButton(name: "All")
        ])
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 10
        return stack
    }()
    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        view.addSubview(chartView)
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.delegate = self
        chartView.animate(xAxisDuration: 0.5)
        chartView.backgroundColor = .white
        chartView.drawGridBackgroundEnabled = false
        chartView.leftAxis.axisLineColor = .black
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.drawLabelsEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.drawLabelsEnabled = false
        chartView.rightAxis.drawGridLinesEnabled = false
        chartView.rightAxis.drawAxisLineEnabled = false
        chartView.rightAxis.drawLabelsEnabled = false
        chartView.pinchZoomEnabled = false
        chartView.doubleTapToZoomEnabled = false
        chartView.legend.enabled = false
        let set = LineChartDataSet(entries: self.yValues, label: "Hello")
        let gradientColors = [UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1.0).cgColor, UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 0.0).cgColor] as CFArray
        let colorLocations: [CGFloat] = [0.0, 1.0]
        let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations)
        set.fill = LinearGradientFill(gradient: gradient!, angle: 270.0)
        set.mode = .cubicBezier
        set.drawCirclesEnabled = false
        set.drawValuesEnabled = false
        set.colors = [UIColor.black]
        set.drawFilledEnabled = true
        set.fillAlpha = 0.8
        set.lineWidth = 2
        set.drawHorizontalHighlightIndicatorEnabled = false
        set.drawVerticalHighlightIndicatorEnabled = false
        chartView.data = LineChartData(dataSet: set)
        view.addSubview(chartView)
        return chartView
    }()
    
    lazy var changeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$0.12 (1,15%)"
        label.textColor = .green
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: "myGreen")
        view.addSubview(label)
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.text = "$131.93"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            buyButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            buyButton.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            buyButton.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            
            buttonStack.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: -52),
            buttonStack.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            buttonStack.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            buttonStack.heightAnchor.constraint(equalToConstant: 44),
            
            lineChartView.widthAnchor.constraint(equalTo: view.widthAnchor),
            lineChartView.heightAnchor.constraint(equalToConstant: 260),
            lineChartView.bottomAnchor.constraint(equalTo: buttonStack.topAnchor, constant: -40),
            
            changeLabel.bottomAnchor.constraint(equalTo: lineChartView.topAnchor),
            changeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            priceLabel.bottomAnchor.constraint(equalTo: changeLabel.topAnchor, constant: -8),
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 10.2),
        ChartDataEntry(x: 1.0, y: 20.3),
        ChartDataEntry(x: 2.0, y: 14.2)
    ]
    
}


extension StockDetailsVC: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
}
