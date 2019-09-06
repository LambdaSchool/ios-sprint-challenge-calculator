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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if brain?.lastButtonPressWasEquals ?? false {
            clearTransaction()
        }
        brain?.lastButtonPressWasEquals = false
        
        guard let operandString = sender.titleLabel!.text else {
            print("Unable to get string from button title.")
            return
        }
        
        let outputText = brain?.addOperandDigit(operandString)
        
        outputLabel.text = outputText
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        brain?.lastButtonPressWasEquals = false
        
        guard let operatorString = sender.titleLabel!.text else {
            print("Unable to get string from button title.")
            return
        }
        
        brain?.setOperator(operatorString)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        brain?.lastButtonPressWasEquals = true
        if let result = brain?.calculateIfPossible() {
            if result.suffix(2) == ".0" {
                outputLabel.text = String(result.dropLast(2))
            } else {
                outputLabel.text = result
            }
            brain?.operand1String = result
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        brain?.lastButtonPressWasEquals = false
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain?.operand1String = ""
        //brain?.operand2String = ""
        brain?.operatorType = nil
    }
}
