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
        
        setStackSpacing()
        calculateValue(self)
    }

    @IBAction func calculateValue(_ sender: Any) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        
        let formattedMileage = formatter.string(for: mileage.value) ?? "0"
        mileageLabel.text = "MILEAGE (\(formattedMileage) miles)"
        
        let modelValue = Double(model.selectedSegmentIndex)
        let premiumValue = Double(upgrades.selectedSegmentIndex)
        let mileageValue = Double(mileage.value)
        let conditionValue = Double(condition.selectedSegmentIndex)
        
        if let prediction = try? cars.prediction(model: modelValue, premium: premiumValue, mileage: mileageValue, condition: conditionValue) {
            let clampedValuation = max(2000, prediction.price)
            
            formatter.numberStyle = .currency
            valuation.text = formatter.string(for: clampedValuation)
        } else {
            valuation.text = "Error"
        }
    }
    
    // MARK: Helper methods
    func setStackSpacing() {
        stackView.setCustomSpacing(30, after: model)
        stackView.setCustomSpacing(30, after: upgrades)
        stackView.setCustomSpacing(30, after: mileage)
        stackView.setCustomSpacing(60, after: condition)
    }
}
