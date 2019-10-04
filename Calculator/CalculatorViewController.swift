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
    
    let brain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let digit = sender.titleLabel?.text else { return }
        
        let number = brain.addOperandDigit(digit)
        updateOutputLabel(with: number)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let operatorString = sender.titleLabel?.text else { return }
        brain.setOperator(operatorString)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        if let answer = brain.calculateIfPossible() {
            
            updateOutputLabel(with: answer)
            clearTransaction()
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        updateOutputLabel(with: "0")
    }
    
    // Mark: - Helper Functions
    
    func updateOutputLabel(with number: String) {
        outputLabel.text = number
    }
        
    // MARK: - Private
    
    private func clearTransaction() {
        brain.operatorType = nil
        brain.operand1String = ""
        brain.operand2String = ""
    }
    
}
