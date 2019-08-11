//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

var brain: CalculatorBrain?

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let unwrappedBrain = brain, let senderTitle = sender.currentTitle {
            outputLabel.text = unwrappedBrain.addOperandDigit(senderTitle)
            
        } else {
            outputLabel.text = "Error: (001) Invalid button"
            sleep(3)
            clearTransaction()
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let unwrappedBrain = brain, let title = sender.currentTitle, let text = outputLabel.text else {
            outputLabel.text = "Error: (002) Invalid button"
            sleep(3)
            clearTransaction()
            return
        }
        outputLabel.text = "\(text) \(title)"
        unwrappedBrain.setOperator(title)
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let unwrappedBrain = brain {
            outputLabel.text = unwrappedBrain.calculateIfPossible()
            unwrappedBrain.operatorSelected = false
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    @IBAction func percentTapped(_ sender: UIButton) {
        if let unwrappedBrain = brain {
            if (unwrappedBrain.operatorSelected) {
                guard let operand2: Double = Double(unwrappedBrain.operand2String) else { return }
                unwrappedBrain.operand2String = "\(operand2 / 100)"
            } else {
                guard let operand1: Double = Double(unwrappedBrain.operand1String) else { return }
                unwrappedBrain.operand1String = "\(operand1 / 100)"
            }
            if let _ = unwrappedBrain.operatorType {
                outputLabel.text = "\(unwrappedBrain.operand2String)"
            } else {
                outputLabel.text = "\(unwrappedBrain.operand1String)"
            }
        }
    }
    
    @IBAction func positiveNegativePressed(_ sender: Any) {
        if let unwrappedBrain = brain {
            if (unwrappedBrain.operatorSelected) {
                if (unwrappedBrain.operand2String.isEmpty) {
                    return
                } else {
                    if (unwrappedBrain.operand2String[unwrappedBrain.operand2String.startIndex] == "-") {
                        unwrappedBrain.operand2String.remove(at: unwrappedBrain.operand2String.startIndex)
                    } else {
                        unwrappedBrain.operand2String = "-\(unwrappedBrain.operand2String)"
                    }
                }
            } else {
                if (unwrappedBrain.operand1String.isEmpty) {
                    return
                } else {
                    if (unwrappedBrain.operand1String[unwrappedBrain.operand1String.startIndex] == "-") {
                        unwrappedBrain.operand1String.remove(at: unwrappedBrain.operand1String.startIndex)
                    } else {
                        unwrappedBrain.operand1String = "-\(unwrappedBrain.operand1String)"
                    }
                }
            }
            if let _ = unwrappedBrain.operatorType {
                outputLabel.text = "\(unwrappedBrain.operand2String)"
            } else {
                outputLabel.text = "\(unwrappedBrain.operand1String)"
            }
        }
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
        outputLabel.text = "0"
    }
}
