//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
var brain: CalculatorBrain?

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        brain = CalculatorBrain()
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        guard let theNumber = sender.titleLabel?.text else {
            return
        }
        print(theNumber)
        
        if outputLabel.text == theNumber {
            outputLabel.text = theNumber
        } else if let text = String?(theNumber) {
            outputLabel.text = ""
            outputLabel.text = text
        }
        brain?.addOperandDigit(outputLabel.text!)
        print(brain?.operand1String)
        print(brain?.operand2String)
    }
    
    
    @IBAction func operatorTapped(_ sender: UIButton) {
    
        let theOperator = (sender.titleLabel?.text)!
        brain?.setOperator(theOperator)
        print(brain?.operatorType)
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
