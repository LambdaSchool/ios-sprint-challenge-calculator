//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class CalculatorViewController: UIViewController {
    
    // Creating brain property of typee CalculatorBrain
    var brain: CalculatorBrain? = nil

    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        brain = CalculatorBrain()
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let tapped = sender.titleLabel?.text else {
            print("Error recognizing operand")
            return
        }
        outputLabel.text = brain?.addOperandDigit(tapped)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let action = sender.titleLabel?.text else { return }
        brain?.setOperator(action)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let answer = brain?.calculateIfPossible() {
            outputLabel.text = answer
        }
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = nil
        brain = CalculatorBrain()
    }
}



