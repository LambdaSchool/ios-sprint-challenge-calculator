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
        //connected to 0...9 & .
        if let digit = sender.titleLabel?.text {
            print(addOperandDigit(digit))
        }
        
        let brain = addOperandDigit.self
        outputLabel.text = "\(String(describing: brain))"
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        //connected to + - / *
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
    
    func addOperandDigit(_ digit: String) -> String {
        return digit
    }
}
