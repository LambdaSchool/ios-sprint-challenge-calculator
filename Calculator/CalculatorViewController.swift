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
        guard let operandString = sender.titleLabel!.text else {
            print("Unable to get string from button title.")
            return
        }
        
        let outputText = brain?.addOperandDigit(operandString)
        
        outputLabel.text = outputText
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let operatorString = sender.titleLabel!.text else {
            print("Unable to get string from button title.")
            return
        }
        
        brain?.setOperator(operatorString)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let result = brain?.calculateIfPossible() {
            outputLabel.text = result
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
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
