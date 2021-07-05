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
        guard let operand = sender.currentTitle else {return}
        outputLabel.text = brain?.addOperandDigit(operand)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let  ope  =  sender.currentTitle, let brain = brain else {return}
            brain.setOperator(ope)
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let answer = brain?.calculateIfPossible() {
            outputLabel.text = answer
        }
            clearTransaction()
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
