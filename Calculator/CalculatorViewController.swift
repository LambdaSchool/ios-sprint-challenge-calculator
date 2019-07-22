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
    
    var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brain = CalculatorBrain()
        
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        guard let brain = brain else { return }
        
        if let operand: String = brain.addOperandDigit(sender.currentTitle ?? "0") {
            outputLabel.text = operand
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        guard let brain = brain else { return }
        
        guard let operatorType: String = sender.currentTitle else { return }

        brain.setOperator(operatorType)
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        guard let brain = brain else { return }
        
        if brain.operand1String != "", brain.operand2String != "", (brain.operatorType != nil) {
            guard let operand1 = Double(brain.operand1String) else { return }
            guard let operand2 = Double(brain.operand2String) else { return }
            
            switch brain.operatorType {
            case .addition?:
                let result: String = String(operand1 + operand2)
                outputLabel.text = result
            case .subtraction?:
                let result: String = String(operand1 - operand2)
                outputLabel.text = result
            case .multiplication?:
                let result: String = String(operand1 * operand2)
                outputLabel.text = result
            case .division?:
                
                let result: String = String(operand1 / operand2)
                outputLabel.text = result
            default:
                let result: String = "0"
                outputLabel.text = result
            }
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        outputLabel.text = "0"
        brain = CalculatorBrain()
    }
}
