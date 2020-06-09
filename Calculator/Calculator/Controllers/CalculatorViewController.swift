//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Claudia Cavalini Maganhi on 14/04/20.
//  Copyright © 2020 Claudia Cavalini Maganhi. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var resultDisplayLabel: UILabel!
    @IBOutlet weak var pointSignButton: UIButton!
    
    var isFinishedTypingNumber: Bool = true
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculatorPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            guard let strNumber = resultDisplayLabel.text else { return }
            guard let number = Double(strNumber) else { return }
            calculator.setNumber(number)
            guard let result = calculator.calculate(symbol: calcMethod) else { return }
            resultDisplayLabel.text = "\(result)"
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        guard let number = sender.titleLabel?.text else { return }
        
        if isFinishedTypingNumber {
            resultDisplayLabel.text = number
            isFinishedTypingNumber = false
        } else {
            guard let newNumber = resultDisplayLabel.text else { return }
            if number == "." {
                let isInt = floor(Double(newNumber)!) == Double(newNumber)
                if !isInt {
                    return
                }
            }
            resultDisplayLabel.text = newNumber + number
        }
    }
    
    
}

