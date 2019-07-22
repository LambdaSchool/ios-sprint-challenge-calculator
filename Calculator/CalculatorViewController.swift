//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//  Casualty

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var decimalButton: UIButton!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        // Takes in the value of the operand tapped
        if let operandTapped = sender.titleLabel?.text {
            
            let buttonDoesntContainDecimal = !operandTapped.contains(".")
            
            let buttonContainsDecimalWithNoCurrentDecimal = operandTapped.contains(".") && !(outputLabel.text?.contains(".") ?? false)
            
            
            if buttonDoesntContainDecimal || buttonContainsDecimalWithNoCurrentDecimal {
                outputLabel.text = brain?.addOperandDigit(operandTapped)
            }
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        // Takes in the value of the operator tapped
        if let operatorValueTapped = sender.titleLabel?.text {
             let unwrappedNumber = String(outputLabel.text ?? "")
            outputLabel.text = String("\(unwrappedNumber) \(operatorValueTapped)")
            brain?.setOperator(operatorValueTapped)
            
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        // Calculates the answer and sets it to the value 'answer'
        if let answer = brain!.calculateIfPossible() {
            outputLabel.text = answer
        }
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
        // Clears the calculation when tapped
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
        // Clear calculation function
        brain = CalculatorBrain()
        
    }
    
    @IBAction func posNegButtonTapped(_ sender: Any) {
        
        
        // Turns number negative or positive
        if var posNegNumber = Double(outputLabel.text ?? "") {
            posNegNumber = posNegNumber * -1.0
            outputLabel.text = String(posNegNumber)
            brain?.operand1String = String(posNegNumber)
            
        }
    }
    
    @IBAction func percentButtonTapped(_ sender: Any) {
        
        // Divides by 100.0 (Double) to return the percentageNumber
        if var percentageNumber = Double(outputLabel.text ?? "") {
            percentageNumber = percentageNumber / 100.0
            outputLabel.text = String(percentageNumber)
            brain?.operand1String = String(percentageNumber)
            
        }
    }
}
