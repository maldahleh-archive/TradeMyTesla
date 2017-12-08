//
//  ViewController.swift
//  TradeMyTesla
//
//  Created by Mohammed Al-Dahleh on 2017-12-07.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let cars = Cars()
    let formatter = NumberFormatter()
    
    // MARK: UI variables
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var model: UISegmentedControl!
    @IBOutlet weak var upgrades: UISegmentedControl!
    @IBOutlet weak var condition: UISegmentedControl!
    
    @IBOutlet weak var mileageLabel: UILabel!
    @IBOutlet weak var mileage: UISlider!
    
    @IBOutlet weak var valuation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFormatterProperties()
        setStackSpacing()
    }

    @IBAction func calculateValue(_ sender: Any) {
        let formattedMileage = formatter.string(for: mileage.value) ?? "0"
        mileageLabel.text = "MILEAGE (\(formattedMileage) miles)"
        
        
    }
    
    // MARK: Helper methods
    func setFormatterProperties() {
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
    }
    
    func setStackSpacing() {
        stackView.setCustomSpacing(30, after: model)
        stackView.setCustomSpacing(30, after: upgrades)
        stackView.setCustomSpacing(30, after: mileage)
        stackView.setCustomSpacing(60, after: condition)
    }
}
