//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip: Double = 0.10
    var people: Double = 2.0
    var result: Double = 0.0
    
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleWithoutPercentSign = String(buttonTitle.dropLast())
        
        let buttonTitleNumber = Double(buttonTitleWithoutPercentSign)!
        
        
        
        tip = (buttonTitleNumber/100)
        
        
        
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        people = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let userBillInput = billTextField.text ?? "0.00"
        
        let bill = Double(userBillInput) ?? 0.0
        result = (bill*(1+tip)) / people
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.finalBill = String(format: "%.2f", result)
            destinationVC.details = "Split between \(Int(people)) people, with \(tip*100)% tips"
            
            
            
            
        }
    }
    
    
}

