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
    var lastButtonPressWasEquals = false
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if lastButtonPressWasEquals {
            clearTransaction()
        }
        lastButtonPressWasEquals = false
        
        guard let operandString = sender.titleLabel!.text else {
            print("Unable to get string from button title.")
            return
        }
        
        let outputText = brain?.addOperandDigit(operandString)
        
        outputLabel.text = outputText
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        lastButtonPressWasEquals = false
        
        guard let operatorString = sender.titleLabel!.text else {
            print("Unable to get string from button title.")
            return
        }
        
        brain?.setOperator(operatorString)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        lastButtonPressWasEquals = true
        if let result = brain?.calculateIfPossible() {
            outputString(result)
            brain?.operand1String = result
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        lastButtonPressWasEquals = false
        clearTransaction()
        outputLabel.text = "0"
    }
    
    @IBAction func negateTapped(_ sender: UIButton) {
        if let negatedNumber = brain?.negate(lastButtonPressWasEquals) {
            outputString(negatedNumber)
        }
    }
    
    @IBAction func percentTapped(_ sender: UIButton) {
        if brain?.operatorType == nil || lastButtonPressWasEquals {
            guard let operand1 = Double(brain!.operand1String) else {
                return
            }
            brain?.operand1String = String(operand1 / 100.0)
            outputString(brain!.operand1String)
        } else {
            guard let operand2 = Double(brain!.operand2String) else {
                return
            }
            brain?.operand2String = String(operand2 / 100.0)
            outputString(brain!.operand2String)
        }
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain?.operand1String = ""
        //brain?.operand2String = ""
        brain?.operatorType = nil
    }
    
    private func outputString(_ string: String) {
        if string.suffix(2) == ".0" {
            outputLabel.text = String(string.dropLast(2))
        } else {
            outputLabel.text = string
        }
    }
}
