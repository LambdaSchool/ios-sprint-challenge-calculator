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
//    created brain of optional CalculatorBrain type
    var brain: CalculatorBrain?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initialize brain / CalculatorBrain
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
//        set the .text of the titleLabel to "digit" and displayed the .text to the outputLabel, and set that equal to the brain .addOperandDigit.
        if let digit = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(digit)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
//        seet the .text of the titleLabel to operatorString and setOperator of operatorString with the button label pressed text.
        if let operatorString = sender.titleLabel?.text {
            outputLabel.text = brain?.setOperator(operatorString)
            }
    
    }
    @IBAction func equalTapped(_ sender: UIButton) {
//        set the calculateIfPossible function to equal and displayed the result in the outputLabel .text
        if let equal = brain?.calculateIfPossible() {
            outputLabel.text = equal
        }
    }
    @IBAction func clearTapped(_ sender: UIButton) {
//        runs the clearTransaction function, then sets the outputLabel .text to "0" on the display as seen on the mac calculator.
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
//        sets the brain var to nil, and resets the CalculatorBrain function.
        brain = nil
        brain = CalculatorBrain()
        }
}

