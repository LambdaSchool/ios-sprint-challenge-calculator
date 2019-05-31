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
    
    @IBAction func operandTapped(_ choiceSender: UIButton) {
        var firstNumber = ""
        if let uNumberOne = choiceSender.currentTitle {
            firstNumber = String(uNumberOne)
        }
        
        outputLabel.text = calcBrain.addOperandDigitOne(firstNumber)
        
        
        //var secondNumber = ""
        //calcBrain.operand2String = choiceSender.currentTitle
        //if let uNumberTwo = calcBrain.operand2String {
        //
        //    secondNumber = uNumberTwo
        //}
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        calcBrain.setOperator(<#T##operatorString: String##String#>)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
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
