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

    @IBAction func operandTapped(_ sender: UIButton) {
        
        guard let button = sender.titleLabel?.text,
        let brain = brain
        else {return}
        
        outputLabel.text = brain.addOperandDigit(button)

    }

    @IBAction func operatorTapped(_ sender: UIButton) {
        
        guard let button = sender.titleLabel?.text,
        let operatorType = OperatorType(rawValue: button),
        let brain = brain
        else {return}
        
        brain.setOperator(operatorType)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        guard let _ = sender.titleLabel?.text,
        let brain = brain
        else {return}
        
        outputLabel.text = brain.calculateIfPossible()
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        outputLabel.text = "0"
        clearTransaction()
            
        }

    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = nil
        brain = CalculatorBrain()
        
    }
}
