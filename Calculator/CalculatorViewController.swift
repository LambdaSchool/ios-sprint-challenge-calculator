//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    // MARK: - Properties
    
    var brain: CalculatorBrain? = nil
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var outputLabel: UILabel!
    
    // MARK: - Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain(operand1String: "", operand2String: "")        
    }

    // MARK: - IBAction

    @IBAction func operandTapped(_ sender: UIButton) {
        
        if let buttonText = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(buttonText)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let buttonText = sender.titleLabel?.text {
            brain?.setOperator(buttonText)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        outputLabel.text = brain?.calculateIfPossible()
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = nil        
        brain = CalculatorBrain(operand1String: "", operand2String: "")
    }
}
