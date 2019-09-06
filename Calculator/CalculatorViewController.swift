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
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var dotButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        if value == "." { dotButton.isEnabled = false }
        outputLabel.text = brain?.addOperandDigit(value)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton){
        guard let value = sender.titleLabel?.text else { return }
        dotButton.isEnabled = true
        brain?.setOperator(value)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        guard let result = brain?.calculateIfPossible() else {
            outputLabel.text = "ERROR"
            return
        }
        
        let doubleValue = Double(result)
        if doubleValue?.truncatingRemainder(dividingBy: 1.0) == 0 {
            outputLabel.text = String(format: "%0.f", doubleValue!)
        } else {
            outputLabel.text = result
        }
        clearTransaction()
        brain?.operand1String = outputLabel.text ?? ""
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
        dotButton.isEnabled = true
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain?.operand1String = ""
        brain?.operand2String = ""
        brain?.operatorType = nil
    }
    
    @IBAction func valueSwitch() {
        switch brain?.operatorType {
        case nil:
            if brain?.operand1String == "" {
                break
            } else {
                let currentValue = brain?.operand1String
                brain?.operand1String = ("-" + currentValue!)
                outputLabel.text = brain?.operand1String
            }
        default:
            if brain?.operand2String == "" {
                break
            } else {
                let currentValue = brain?.operand2String
                brain?.operand2String = ("-" + currentValue!)
                outputLabel.text = brain?.operand2String
            }
        }
    }
}
