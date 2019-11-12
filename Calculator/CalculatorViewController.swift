//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var brain = CalculatorBrain()
    
    //Outlets
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       brain = CalculatorBrain()
    }
    
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let goodNumber = sender.titleLabel?.text else  { return }
            let number = brain.addOperandDigit(goodNumber)
            outputLabel.text = number
        }

    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let goodNumber = sender.titleLabel?.text else { return }
        brain.setOperator(goodNumber)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let mathWorked = brain.calculateIfPossible() {
            outputLabel.text = mathWorked
        }
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
