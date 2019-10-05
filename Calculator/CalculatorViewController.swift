//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import AVFoundation

class CalculatorViewController: UIViewController {
    
    var brain: CalculatorBrain?
    var YSBW: AVAudioPlayer?
    var plusMinusCounter = 0
    var decimalToggle = false
    

    
    @IBOutlet weak var outputLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()

    }
    // MARK: - Action Handlers
    
    
    
    
    
    
    
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if outputLabel?.text == "0"  {
            if let unwrapper = sender.titleLabel?.text {
                
            if unwrapper == "." && decimalToggle == false {
                    decimalToggle = true
                    outputLabel.text = unwrapper
            } else if unwrapper == "." && decimalToggle == true {
                outputLabel.text = outputLabel.text
            } else {
                outputLabel.text = unwrapper
            }
        }
                
//        else {
//            if let unwrapper = sender.titleLabel?.text {
//                outputLabel.text = (outputLabel.text ?? "") + unwrapper
            }
        else {
            if let unwrapper = sender.titleLabel?.text {
                outputLabel.text = (outputLabel.text ?? "") + unwrapper
                
    }
    }
    }
    
        
        
        
        
        
        
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let unwrapper = sender.titleLabel?.text
        {
            brain?.setOperator(unwrapper)
            if let unwrapper2 = outputLabel?.text {
                brain?.operand1String = "\(unwrapper2)"
                outputLabel.text = "0"
        }
        }
    }
    
    @IBAction func plusMinusTapped(_ sender: UIButton) {
        let path = Bundle.main.path(forResource: "VIBRATIONS.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            YSBW = try AVAudioPlayer(contentsOf: url)
            YSBW?.play()
        } catch {
            // couldn't load file :(
        }
        
        if plusMinusCounter == 0 {
        plusMinusCounter += 1
        outputLabel.text = "-" + (outputLabel.text ?? "")
        }
//        if plusMinus == false {
//            if let unwrapper = outputLabel.text {
//                outputLabel.text = outputLabel.text?.remove(at: outputLabel.text?.startIndex)
//        }
//        }
    }
    
    @IBAction func percentageTapped(_ sender: UIButton) {
        
//        var YSBW: AVAudioPlayer?
        let path = Bundle.main.path(forResource: "SIREN.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        outputLabel.text = "IRIE"
     
        do {
            YSBW = try AVAudioPlayer(contentsOf: url)
            YSBW?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        let path = Bundle.main.path(forResource: "JAH.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            YSBW = try AVAudioPlayer(contentsOf: url)
            YSBW?.play()
        } catch {
            // couldn't load file :(
        }
        
        if let unwrapper = outputLabel?.text {

                brain?.operand2String = "\(unwrapper)"
                outputLabel.text = "420"
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        plusMinusCounter = 0
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
        outputLabel.text = "0"
    }
}
