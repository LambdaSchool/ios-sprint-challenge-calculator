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
    
    let calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let digit = sender.titleLabel?.text else { return }
        let number = calculatorBrain.addOperandDigit(digit)
        updateOutputLabel(with: number)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let operatorString = sender.titleLabel?.text else { return}
        calculatorBrain.setOperator(operatorString)
        updateOutputLabel(with: "0")
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
    
    func updateOutputLabel(with number: String) {
        outputLabel.text = number
    }
}
