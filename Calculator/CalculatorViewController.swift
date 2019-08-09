//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var toOutputLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var buttonPoint: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
let brain = CalculatorBrain(operand1String: "", operand2String: "", operatortype: nil)
    
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        var operand: String? = nil
        if case button1.isSelected = true {
            operand = "1"
        } else if case button2.isSelected = true {
            operand = "2"
        } else if case button3.isSelected = true {
            operand = "3"
        } else if case button4.isSelected = true {
            operand = "4"
        } else if case button5.isSelected = true {
            operand = "5"
        } else if case button6.isSelected = true {
            operand = "6"
        } else if case button7.isSelected = true {
            operand = "7"
        } else if case button8.isSelected = true {
            operand = "8"
        } else if case button9.isSelected = true {
            operand = "9"
        } else if case button0.isSelected = true {
            operand = "0"
        } else if case buttonPoint.isSelected = true {
            operand = "."
        }
        brain.addOperandDigit("\(operand)")
    }

    
//operatorTapped function
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }

// equalTappedFunction
    
    @IBAction func equalTapped(_ sender: UIButton) {
//    brain.calculateIfPossible()
//    outputLabel.text
    }
    @IBAction func clearTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
