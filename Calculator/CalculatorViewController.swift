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
    var brain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        outputLabel.text = sender.titleLabel?.text
        guard let operand = sender.titleLabel?.text else {return}
        print(operand)
        brain.addOperandDigit(operand)
        
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let operatorType = sender.titleLabel?.text else { return }
            print(operatorType)
            brain.setOperator(operatorType)
          
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        guard let output = brain.calculateIfPossible() else {return}
        outputLabel.text = output
       
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        outputLabel.text = "0"
        brain.operand1String = ""
        brain.operand2String = ""
        brain.operatorType = nil
    }
}
