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
    var fromAddOperand: String = ""
    var fromOperatorTapped: String = ""
    var fromPercentageButton: String = ""
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func plusMinusButtonTapped(_ sender: Any) {
    }
    
    @IBAction func percentageButtonTapped(_ sender: Any) {
        
        guard let numString = outputLabel.text else {
            return
        }
        guard let convertedNumFromString = Double(numString) else { return  }
        let percentageNum = convertedNumFromString/100
        let percentString = String(percentageNum)
        brain?.operand1String = ""
        fromPercentageButton = brain?.addOperandDigit(percentString) ?? "0"
            outputLabel.text = fromPercentageButton
    }
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        guard let number = sender.titleLabel?.text else{
            return
        }
        fromAddOperand = brain?.addOperandDigit(number) ?? "0"
        outputLabel.text = fromAddOperand
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let operand = sender.titleLabel?.text else{
            return
        }
        brain?.setOperator(operand)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        let resultOfCalculation = brain?.calculateIfPossible()
        outputLabel.text = resultOfCalculation
        brain?.operatorType = nil
        brain?.operand1String = outputLabel.text ?? "0"
        brain?.operand2String = ""
       


    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain?.numberString = ""
        brain?.operand1String = ""
        brain?.operand2String = ""
        brain?.operatorType = nil
        
    }
}
