//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    let calcBrain = CalculatorBrain()
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var numOneButton: UIButton!
    @IBOutlet weak var numTwoButton: UIButton!
    @IBOutlet weak var numThreeButton: UIButton!
    @IBOutlet weak var numFourButton: UIButton!
    @IBOutlet weak var numFiveButton: UIButton!
    @IBOutlet weak var numSixButton: UIButton!
    @IBOutlet weak var numSevenButton: UIButton!
    @IBOutlet weak var numEightButton: UIButton!
    @IBOutlet weak var numNineButton: UIButton!
    @IBOutlet weak var numZeroButton: UIButton!
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    // MARK: - Action Handlers
    var firstNumber = ""
    var secondNumber = ""
    var selectedOperator: OperatorType = .addition
    @IBAction func operandTapped(_ choiceSender: UIButton) {
        if let uNumberOne = choiceSender.currentTitle {
            firstNumber = uNumberOne
        }
        
        outputLabel.text = String(calcBrain.addOperandDigitOne(firstNumber))
        
        calcBrain.operand2String = choiceSender.currentTitle
        if let uNumberTwo = calcBrain.operand2String {
        
            secondNumber = uNumberTwo
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let selecedOperator = title {
            selectedOperator = calcBrain.setOperator(selecedOperator)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        outputLabel.text = calcBrain.calculateIfPossible(digit1: calcBrain.addOperandDigitOne(firstNumber), digit2: calcBrain.addOperandDigitTwo(secondNumber), operatorSelected: calcBrain.setOperator(selectedOperator.rawValue))
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        outputLabel.text = String(0)
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        calcBrain.operand1String = "0"
        calcBrain.operand2String = "0"
    }
}
