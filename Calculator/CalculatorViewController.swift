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
        guard let digitToBeAdded =  sender.titleLabel?.text else { return }
        
        outputLabel.text = brain?.addOperandDigit(digitToBeAdded)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let operatorSelected = sender.titleLabel?.text else { return }
        
        brain?.setOperator(operatorSelected)
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
        brain = CalculatorBrain()
    }
}
