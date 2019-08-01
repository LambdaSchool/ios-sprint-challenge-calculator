//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // 1. create a property called brain of type CalculatorBrain \ no initial value \ optional
    var brain: CalculatorBrain? = nil
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2. initialize a new CalculatorBrain object and assign to above property
        brain = CalculatorBrain(operand1String: "", operand2String: "")
        
    }
    

    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
//        if let button = sender as? UIButton {}
        if let buttonText = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(buttonText)
        }
        
        
        
//        button.isSelected.toggle

        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let buttonText = sender.titleLabel?.text {
            brain?.setOperator(buttonText)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
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
