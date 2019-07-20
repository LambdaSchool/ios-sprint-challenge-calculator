//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var operandOnScreen: Double = 0
    var previousNumber: Double = 0
    var operandCalculated = false
    var operators = 0
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        class CalculatorBrain {
            var operand1 = Double()
            var operand2 = Double()
            var operators = Double()
            
            init(operand1: Double, operand2: Double, operators: Double) {
                self.operand1 = operand1
                self.operand2 = operand2
                self.operators = operators
            }
            
        }
    }
    var brain: CalculatorBrain?
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton)
    {
        if operandCalculated == true
        {
                outputLabel.text = String(sender.tag-1)
                operandOnScreen = Double(outputLabel.text!)!
                operandCalculated = false
        }
        
        outputLabel.text = outputLabel.text! ?? + String(sender.tag-1)
        
        operandOnScreen = Double(outputLabel.text!)!
    }
    
    @IBAction func operatorTapped(_ sender: UIButton)
    {
        if outputLabel.text != "" && sender.tag != 16
        {
            previousNumber = Double(outputLabel.text!)!
            if sender .tag == 12
            { //Division
                outputLabel.text = "/"
            }
            else if sender .tag == 13
            { //Multiple
                outputLabel.text = "*"
            }
            else if sender .tag == 14
            { //Subtraction
                outputLabel.text = "-"
            }
            else if sender .tag == 15
            { // Addition
                outputLabel.text = "+"
            }
            operandCalculated = true
            operators = sender.tag
            
            }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
   
        
         if sender.tag == 11
        {
            outputLabel = nil
            previousNumber = 0
            operandOnScreen = 0
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        if sender.tag == 11 {
            outputLabel = nil
            previousNumber = 0
            operandOnScreen = 0
        }
    }

    // MARK: - Private
    
    private func clearTransaction() {
        
    }


}
