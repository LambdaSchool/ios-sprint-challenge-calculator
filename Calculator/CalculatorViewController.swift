//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
var brain: CalculatorBrain?
var isPerformingOperation = false

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        brain = CalculatorBrain()
        outputLabel.text = " "
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        guard let theNumber = sender.titleLabel?.text else {
            return
        }
        
        if isPerformingOperation == true {
            isPerformingOperation = false
            outputLabel.text = sender.titleLabel?.text
        } else if let text = outputLabel.text {
            outputLabel.text = text + (sender.titleLabel?.text!)!
        }
        
        brain?.addOperandDigit(outputLabel.text!)
        print(brain?.operand1String)
        print(brain?.operand2String)
    }
    
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        let theOperator = (sender.titleLabel?.text)!
        brain?.setOperator(theOperator)
        outputLabel.text = "0"
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        outputLabel.text = brain?.calculateIfPossible()
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain?.operand1String = ""
        brain?.operand2String = ""
        brain?.operatorType = OperatorType(rawValue: "")
        outputLabel.text = ""
        
    }
    
}
