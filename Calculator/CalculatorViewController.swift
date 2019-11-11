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
        self.brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        let operandValueTapped = sender.titleLabel?.text ?? ""
        outputLabel.text = brain?.addOperandDigit(operandValueTapped)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        let operatorValueTapped = sender.titleLabel?.text ?? ""
        brain?.setOperator(operatorValueTapped)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let calculatedValue = brain!.calculateIfPossible() {
            outputLabel.text = calculatedValue
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
    }
    // MARK: - Stretch Goal: Implement +/- button: when tapped, the button should toggle positive/negative for the current operand.
    @IBAction func changeSignTapped(_ sender: UIButton) {
        switch brain?.operatorType {
        case nil:
            if brain?.operand1String == "" {
                break
            } else {
            let currentValue = brain?.operand1String
            brain?.operand1String = ("-" + currentValue!)
            outputLabel.text = brain?.operand1String
        }
        default: if brain?.operand2String == "" {
            break
        } else {
            let currentValue = brain?.operand2String
            brain?.operand2String = ("-" + currentValue!)
            outputLabel.text = brain?.operand2String
            }
        }
    }
}
