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
    
    override func viewDidLoad() {
        var brain = CalculatorBrain()
        
        super.viewDidLoad()
    }
    
    var brain: CalculatorBrain?
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let operandButtonText = sender.titleLabel?.text else {return}
        
        outputLabel.text = brain?.addOperandDigit(operandButtonText)
        }
    
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let operatorButtonText = sender.titleLabel?.text else {return}
        
        brain?.setOperator(operatorButtonText)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let displayValue = brain?.calculateIfPossible() {
            outputLabel.text = displayValue
        } else {return}
        
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = nil
    }
    
    
}
