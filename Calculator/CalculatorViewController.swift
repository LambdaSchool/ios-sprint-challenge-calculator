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
    
    var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        outputLabel.text = "0"
        if let brain = brain,
            let operand = sender.currentTitle {
            outputLabel.text = brain.addOperandDigit(operand)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let brain = brain {
            brain.setOperator(sender.currentTitle!)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let brain = brain {
            outputLabel.text = brain.calculateIfPossible()?.truncate(10)
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        guard let brain = brain else { return }
        
        brain.operand1String = ""
        brain.operand2String = ""
        brain.operatorType = nil
        outputLabel.text = "0"
    }
}

extension String {
    func truncate(_ length: Int, trailing: String = "") -> String {
        return (self.count > length) ? self.prefix(length) + trailing : self
    }
}
