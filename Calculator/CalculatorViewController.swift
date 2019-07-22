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
    @IBOutlet weak var decimalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        if value == "." { decimalButton.isEnabled = false }
        outputLabel.text = brain?.addOperandDigit(value)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        decimalButton.isEnabled = true
        brain?.setOperator(value)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        guard let result = brain?.calculateIfPossible() else {
            outputLabel.text = "ERROR"
            return
        }
        outputLabel.text = result
        clearTransaction()
        brain?.operand1String = outputLabel.text ?? ""
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
        decimalButton.isEnabled = true
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain?.operand1String = ""
        brain?.operand2String = ""
        brain?.operatorType = nil
    }
}
