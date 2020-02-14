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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()

    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let digitText = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(digitText)
            print("\(digitText) was tapped!")
        }
        
    }

    @IBAction func operatorTapped(_ sender: UIButton) {
        if let operatorText = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(operatorText)
        }
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
      
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
       clearTransaction()
        outputLabel.text = String(0)
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
