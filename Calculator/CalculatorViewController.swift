//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var brain: CalculatorBrain?
    
    // Outlets
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var outputLabelString: String = "0"
    var operatorCurrentlySelected: OperatorType = .notSelected
    var savedNum: Int = 0
    var wasLastButtonSelectedOperator: Bool = false
    
    
    func updateOutput() {
        guard let labelInt: Int = Int(outputLabelString) else {
            outputLabel.text = "0"
            return
        }
        
        
        if operatorCurrentlySelected == .notSelected {
            savedNum = labelInt
        }
        
        
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let num: NSNumber = NSNumber(value: labelInt)
        
        outputLabel.text = formatter.string(from: num)
    }
    
    
    
    func newOperatorSelected(newOperator: OperatorType) {
           if savedNum == 0 {
               return
           }
        
        operatorCurrentlySelected = newOperator
        wasLastButtonSelectedOperator = true
    
    }
    
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
//        let tagToOperand = sender.tag - 1
//
//        guard let stringValue: String = String(tagToOperand) else {
//                outputLabel.text = "0"
//                return
//            }
//
//            if wasLastButtonSelectedOperator {
//                wasLastButtonSelectedOperator = false
//                outputLabelString = "0"
//            }
//
//            outputLabelString = outputLabelString.appending(stringValue)
//            updateOutput()
        
        
        guard let stringValue: String = sender.titleLabel?.text else {
            outputLabel.text = "0"
            return
        }
        
        if wasLastButtonSelectedOperator {
            wasLastButtonSelectedOperator = false
            outputLabelString = "0"
        }
        
        outputLabelString = outputLabelString.appending(stringValue)
        updateOutput()
       
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        let tag = sender.tag
        
        if tag == 12 {
            operatorCurrentlySelected = .division
        } else if tag == 13 {
            operatorCurrentlySelected = .multiplication
        } else if tag == 14{
            operatorCurrentlySelected = .subtraction
        } else if tag == 15 {
            operatorCurrentlySelected = .addition
        }

    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        guard let labelInt: Int = Int(outputLabelString) else {
            outputLabel.text = "0"
            return
        }
        
        if operatorCurrentlySelected == .notSelected || wasLastButtonSelectedOperator == true {
            return
        }
        
        if operatorCurrentlySelected == .addition {
            savedNum += labelInt
        } else if operatorCurrentlySelected == .subtraction {
            savedNum -= labelInt
        } else if operatorCurrentlySelected == .multiplication {
            savedNum *= labelInt
        } else if operatorCurrentlySelected == .division {
            savedNum /= labelInt
        }
        
        operatorCurrentlySelected = .notSelected
        outputLabelString = "\(savedNum)"
        updateOutput()
        wasLastButtonSelectedOperator = true
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        outputLabelString = "0"
        operatorCurrentlySelected = .notSelected
        savedNum = 0
        wasLastButtonSelectedOperator = false
        outputLabel.text = "0"
        
    }
}





