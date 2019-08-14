//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class CalculatorViewController: UIViewController {
    
    var brain: CalculatorBrain?
    
    @IBOutlet weak var outputLabel: UILabel!
   
    
    // In viewDidLoad, initialize a new CalculatorBrain object and assign it to the above property.
    override func viewDidLoad() {

        super.viewDidLoad()
        brain = CalculatorBrain()
        
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let digit = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(digit)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        if let button = sender.titleLabel?.text {
          brain?.setOperator(button)
            print(button)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        if let solution = brain?.calculateIfPossible() {
            outputLabel.text = solution
            clearTransaction()
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
