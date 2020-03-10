//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class CalculatorViewController: UIViewController {
    

    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let brain1 = CalculatorBrain()
        brain = brain1
    }

    
    
    @IBAction func positiveNegativeButtonTapped(_ sender: UIButton) {
             switch brain?.operatorType {
            case nil:
                if brain?.operand1String == "" {
                    break
                } else {
                let currentValue = brain?.operand1String
                brain?.operand1String = ("-" + currentValue!)
                outputLabel.text = brain?.operand1String
            }
            default: if brain?.operand2String == "" {
                break
            } else {
                let currentValue = brain?.operand2String
                brain?.operand2String = ("-" + currentValue!)
                outputLabel.text = brain?.operand2String
                }
            }
        }
    
 
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let operand = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(operand)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        if let operatorTypeTapped = sender.titleLabel?.text {
            brain?.setOperator(operatorTypeTapped)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        if let _ = sender.titleLabel?.text {
            if let calculate = brain?.calculateIfPossible() {
                outputLabel.text = calculate
                
                clearTransaction()
            }
        }
        
        
        
        
        
//        if let calculatedResult = brain?.calculateIfPossible() {
//            outputLabel.text = calculatedResult
//        } else {
//            outputLabel.text = "Error"
//        }
}
    

    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
        brain = nil
        brain = CalculatorBrain()
    
    }
    var brain: CalculatorBrain?
}
