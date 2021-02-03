//
//  ViewController.swift
//  Prework
//
//  Created by Spencer Nisonoff on 2/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipSlider.value = 0.15
        updatePercent()
    }
    
    func updatePercent() {
        let percent = Int(tipSlider.value * 100)
        tipPercentageLabel.text = "\(percent)%"
    }
    
    @IBAction func tipSliderSlid(_ sender: UISlider) {
        updatePercent()
    }
    
    @IBAction func segControlUsed(_ sender: UISlider) {
        let tipPercentages = [0.15, 0.18, 0.2]
        tipSlider.value = Float(tipPercentages[tipControl.selectedSegmentIndex])
        updatePercent()
        calculateTip(sender)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tip = bill * Double(round(100.0 * tipSlider.value) / 100.0)
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    


}

