//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculator = CalculatorBrain()
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let digit = sender.titleLabel?.text else {return}
        var uwOutputLabel = outputLabel.text ?? ""
        if uwOutputLabel == "0" { uwOutputLabel = "" }
        outputLabel.text = uwOutputLabel + calculator.addOperandDigit(digit)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let op = sender.titleLabel?.text else { return }
        let uwOutputLabel = outputLabel.text ?? ""
        if uwOutputLabel != "" {
            if uwOutputLabel != "0" {
                calculator.setOperator (op)
                outputLabel.text = uwOutputLabel + op
            } else {
                calculator.addOperandDigit("0")
                calculator.setOperator(op)
            }
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        guard let result = calculator.calculateIfPossible() else {
            outputLabel.text = "Error"
            return
        }
        outputLabel.text = result
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        calculator.clear()
        outputLabel.text = "0"
    }
}
