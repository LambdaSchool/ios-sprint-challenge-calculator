//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//  Casualty

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var decimalButton: UIButton!
    
    @IBOutlet weak var subtractButton: UIButton!
    
    @IBOutlet weak var divideButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var multiplyButton: UIButton!
    
    @IBOutlet weak var equalsButton: UIButton!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var previousAnswerLabel: UILabel!
    
    @IBOutlet weak var previousAnswerTitle: UILabel!
    
    var brain: CalculatorBrain?
    let xYValue = 0.75
    let durationTime = 0.15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousAnswerLabel.text = nil
        previousAnswerTitle.text = nil
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        UIButton.animate(withDuration: durationTime,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: CGFloat(self.xYValue), y: CGFloat(self.xYValue))
        },
                         completion: { finish in
                            UIButton.animate(withDuration: self.durationTime, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
        })
        // Takes in the value of the operand tapped
        if let operandTapped = sender.titleLabel?.text {
            
            let buttonDoesntContainDecimal = !operandTapped.contains(".")
            let buttonContainsDecimalWithNoCurrentDecimal = operandTapped.contains(".") && !(outputLabel.text?.contains(".") ?? false)
            
            if buttonDoesntContainDecimal || buttonContainsDecimalWithNoCurrentDecimal {
                outputLabel.text = brain?.addOperandDigit(operandTapped)
            }
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        UIButton.animate(withDuration: durationTime,
                         animations: { sender.transform = CGAffineTransform(scaleX: CGFloat(self.xYValue), y: CGFloat(self.xYValue))},
                         completion: { finish in
                            UIButton.animate(withDuration: self.durationTime, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
        })
        // Takes in the value of the operator tapped
        if let operatorValueTapped = sender.titleLabel?.text {
            
            brain?.setOperator(operatorValueTapped)
            
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        UIButton.animate(withDuration: durationTime,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: CGFloat(self.xYValue), y: CGFloat(self.xYValue))
        },
                         completion: { finish in
                            UIButton.animate(withDuration: self.durationTime, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
        })
        // Calculates the answer and sets it to the value 'answer'
        if let answer = brain!.calculateIfPossible() {
            previousAnswerLabel.text = answer
            previousAnswerTitle.text = "Previous Answer"
            outputLabel.text = answer
        }
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        UIButton.animate(withDuration: durationTime,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: CGFloat(self.xYValue), y: CGFloat(self.xYValue))
        },
                         completion: { finish in
                            UIButton.animate(withDuration: self.durationTime, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
        })
        // Clears the calculation when tapped
        
        if outputLabel.text == "0" {
            clearTransaction()
            previousAnswerTitle.text = ""
            previousAnswerLabel.text = ""
        }
        
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
        // Clear calculation function
        brain = CalculatorBrain()
        
    }
    
    @IBAction func posNegButtonTapped(_ sender: UIButton) {
        UIButton.animate(withDuration: durationTime,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: CGFloat(self.xYValue), y: CGFloat(self.xYValue))
        },
                         completion: { finish in
                            UIButton.animate(withDuration: self.durationTime, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
        })
        
        // Turns number negative or positive
        if var posNegNumber = Double(outputLabel.text ?? "") {
            posNegNumber = posNegNumber * -1.0
            outputLabel.text = String(posNegNumber)
            brain?.operand1String = String(posNegNumber)
            
        }
    }
    
    @IBAction func percentButtonTapped(_ sender: UIButton) {
        
        UIButton.animate(withDuration: durationTime,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: CGFloat(self.xYValue), y: CGFloat(self.xYValue))
        },
                         completion: { finish in
                            UIButton.animate(withDuration: self.durationTime, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
        })
        // Divides by 100.0 (Double) to return the percentageNumber
        if var percentageNumber = Double(outputLabel.text ?? "") {
            percentageNumber = percentageNumber / 100.0
            outputLabel.text = String(percentageNumber)
            brain?.operand1String = String(percentageNumber)
            
        }
    }
    
    @IBAction func subtractButtonPressed(_ sender: Any) {
        
        // Set color for button pressed
        subtractButton.backgroundColor = .white
        subtractButton.setTitleColor(.black, for: .normal)
        
        // Set default colors back
        divideButton.backgroundColor = .green
        divideButton.setTitleColor(.white, for: .normal)
        multiplyButton.backgroundColor = .green
        multiplyButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .green
        addButton.setTitleColor(.white, for: .normal)
        equalsButton.backgroundColor = .green
        equalsButton.setTitleColor(.white, for: .normal)
        
    }
    
    @IBAction func divideButtonPressed(_ sender: Any) {
        
        // Set color for button pressed
        divideButton.backgroundColor = .white
        divideButton.setTitleColor(.black, for: .normal)
        
        // Set default colors back
        subtractButton.backgroundColor = .green
        subtractButton.setTitleColor(.white, for: .normal)
        multiplyButton.backgroundColor = .green
        multiplyButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .green
        addButton.setTitleColor(.white, for: .normal)
        equalsButton.backgroundColor = .green
        equalsButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func multiplyButtonPressed(_ sender: Any) {
        
        // Set color for button pressed
        multiplyButton.backgroundColor = .white
        multiplyButton.setTitleColor(.black, for: .normal)
        
        // Set default colors back
        subtractButton.backgroundColor = .green
        subtractButton.setTitleColor(.white, for: .normal)
        divideButton.backgroundColor = .green
        divideButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .green
        addButton.setTitleColor(.white, for: .normal)
        equalsButton.backgroundColor = .green
        equalsButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        // Set color for button pressed
        addButton.backgroundColor = .white
        addButton.setTitleColor(.black, for: .normal)
        
        // Set default colors back
        subtractButton.backgroundColor = .green
        subtractButton.setTitleColor(.white, for: .normal)
        multiplyButton.backgroundColor = .green
        multiplyButton.setTitleColor(.white, for: .normal)
        divideButton.backgroundColor = .green
        divideButton.setTitleColor(.white, for: .normal)
        equalsButton.backgroundColor = .green
        equalsButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func equalButtonPressed(_ sender: Any) {
        
        // Set color for button pressed
        equalsButton.backgroundColor = .white
        equalsButton.setTitleColor(.black, for: .normal)
        
        // Set default colors back
        subtractButton.backgroundColor = .green
        subtractButton.setTitleColor(.white, for: .normal)
        multiplyButton.backgroundColor = .green
        multiplyButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .green
        addButton.setTitleColor(.white, for: .normal)
        divideButton.backgroundColor = .green
        divideButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        
        // Default all colors when clear button pressed
        equalsButton.backgroundColor = .green
        equalsButton.setTitleColor(.white, for: .normal)
        subtractButton.backgroundColor = .green
        subtractButton.setTitleColor(.white, for: .normal)
        multiplyButton.backgroundColor = .green
        multiplyButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .green
        addButton.setTitleColor(.white, for: .normal)
        divideButton.backgroundColor = .green
        divideButton.setTitleColor(.white, for: .normal)
    }
}
