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
    
    var calculatorBrain: CalculatorBrain?
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorBrain = CalculatorBrain()
        
        
        
    }
    
    // MARK: - Action Handlers
    
   
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let number = sender.title(for: .normal)  {
            print(number)
            outputLabel.text = String((calculatorBrain?.addOperandDigit(number))!)
        }
        
        
        
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        outputLabel.text.append("\(calculatorBrain?.addOperandDigit(OperatorType.self))")
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        let freshCalculatorBrain = calculatorBrain
        outputLabel.text = freshCalculatorBrain?.addOperandDigit("0")
    }
}
