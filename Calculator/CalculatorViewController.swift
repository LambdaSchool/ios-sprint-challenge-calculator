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
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnSubtract: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    
    private let brain = CalculatorBrain()
    private var equalBtnLassedPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let operand = sender.titleLabel?.text else { return }

        noOpsSelected()
        
        if equalBtnLassedPressed {
            // if the last button pressed was = and the user
            // starts entering another number, we want to start fresh
            brain.clear()
        }
        
        outputLabel.text = brain.addOperandDigit(operand)
        equalBtnLassedPressed = false
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let op = sender.titleLabel?.text else { return }
        let wasSelected = sender.isSelected
        
        noOpsSelected()
        
        if !wasSelected {
            sender.isSelected = true
            outputLabel.text = brain.setOperator(op)
            if outputLabel.text == "Error" {
                noOpsSelected()
                brain.clear()
            }
        }
        
        equalBtnLassedPressed = false
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if !equalBtnLassedPressed {
            if let newOutput = brain.calculateIfPossible() {
                outputLabel.text = newOutput
            }
        }
        equalBtnLassedPressed = true
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        equalBtnLassedPressed = false
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        noOpsSelected()
        brain.clear()
        outputLabel.text = "0"
    }
    
    private func noOpsSelected() {
        btnDivide.isSelected = false
        btnMultiply.isSelected = false
        btnSubtract.isSelected = false
        btnAdd.isSelected = false
    }
    
    
}
