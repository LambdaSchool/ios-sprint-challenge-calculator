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
        if let operand = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(operand)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let operatorSymbol = sender.titleLabel?.text {
            brain?.setOperator(operatorSymbol)
            //Ben did brain?.setOperator(buttontext)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let outcome = brain?.calculateIfPossible() {
            outputLabel.text = outcome
            clearTransaction()
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
//        brain = nil
        brain = CalculatorBrain()
    }
}
