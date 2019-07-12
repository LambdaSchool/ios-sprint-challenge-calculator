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
    var brain : CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        if let operandString = sender.titleLabel?.text{
            outputLabel.text = brain?.addOperandDigit(operandString)
        }
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let operatorString = sender.titleLabel?.text{
            if brain?.operatorType !=  nil {
                outputLabel.text = brain?.furtherOperate()
            }
            brain?.setOperator(operatorString)
            
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let result = brain?.calculateIfPossible(){
            outputLabel.text = result
            brain?.operatorType = nil
            brain?.operand1String = result
            brain?.operand2String = ""
        }
        
    }
    @IBAction func switchSignsTapped(_ sender: Any) {
        if let currentNumber = outputLabel.text{
            outputLabel.text = brain?.switchSign(currentNumberString: currentNumber)
        }
    }
    @IBAction func percentTapped(_ sender: Any) {
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
}
