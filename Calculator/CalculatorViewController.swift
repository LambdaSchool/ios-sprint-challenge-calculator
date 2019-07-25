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
    @IBOutlet weak var positiveNegativeButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    
    var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brain = CalculatorBrain()
        
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        if let brain = brain, let digit = sender.currentTitle {
            outputLabel.text = brain.addOperandDigit(digit)
        } else {
            // Alert User
        }
        
//        guard let brain = brain else { return }
//
//        if let operand: String = brain.addOperandDigit(sender.currentTitle ?? "0") {
//            outputLabel.text = operand
//        }
//
//        if sender.currentTitle == "." {
//
//        }

        //outputLabel.text = brain?.addOperandDigit(sender.currentTitle ?? "0")
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        guard let brain = brain else { return }
        
        guard let operatorType: String = sender.currentTitle else { return }

        brain.setOperator(operatorType)
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        guard let brain = brain else { return }
        
        if let calculation = brain.calculateIfPossible() {
            outputLabel.text = calculation
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
    
    @IBAction func percentTapped(_ sender: UIButton) {
        
        guard let outputString: String = outputLabel.text else { return }
        guard let output = Double(outputString) else { return }
            
        if percentButton.isSelected {
            outputLabel.text = "\(output * 100.0)"
        }
    }
    
    @IBAction func positiveNegativeTapped(_ sender: UIButton) {
        
    }
}

