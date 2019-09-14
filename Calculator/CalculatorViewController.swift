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

    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        guard let number = sender.titleLabel?.text else{
            return
        }
        outputLabel.text = number
        fromAddOperand = brain?.addOperandDigit(number) ?? "0"
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let operand = sender.titleLabel?.text else{
            return
        }
        outputLabel.text = operand
        brain?.setOperator(operand)

    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        outputLabel.text = brain?.calculateIfPossible()
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {

        outputLabel.text = "0"
    }
}
