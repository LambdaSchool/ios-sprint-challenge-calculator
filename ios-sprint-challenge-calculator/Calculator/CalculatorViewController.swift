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
        super.viewDidLoad()
        
    }
    var calculatorBrain = CalculatorBrain()
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else {return}
        outputLabel.text = calculatorBrain.addOperandDigit(buttonText)
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else {return}
        calculatorBrain.setOperator(buttonText)
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        outputLabel.text = calculatorBrain.calculateIfPossible()
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
    calculatorBrain = CalculatorBrain()
        
    }
}
