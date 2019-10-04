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
        brain = CalculatorBrain()
    }
    
    var brain: CalculatorBrain? = nil
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let unwrappyboi = sender.titleLabel?.text {
            if outputLabel.text == "0" {
                outputLabel?.text = unwrappyboi
            }
            else {
                outputLabel?.text = (outputLabel.text ?? "") + unwrappyboi
            }
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let unwrappyOperator = sender.titleLabel?.text {
            
            brain?.setOperator(unwrappyOperator)
            brain?.addOperandDigit(outputLabel?.text)
            outputLabel.text = "0"
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        brain?.addOperandDigit(outputLabel?.text)
        outputLabel?.text = brain?.calculateIfPossible()
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    
    
    private func clearTransaction() {
        outputLabel.text = "0"
        brain = CalculatorBrain()
    }
}
