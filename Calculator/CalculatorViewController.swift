//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

var brain: CalculatorBrain?

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let newBrain: CalculatorBrain = brain else { return }
        
            
        
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        brain?.operand1String = String(sender.tag)
        outputLabel.text = brain?.addOperandDigit(brain!.operand1String)
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
        clearTransaction()
        outputLabel.text = ""
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain?.operand1String = ""
        brain?.operand2String = ""
        brain?.operatorType = OperatorType(rawValue: "")
    }
}
