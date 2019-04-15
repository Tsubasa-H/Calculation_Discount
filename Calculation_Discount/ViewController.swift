//
//  ViewController.swift
//  Calculation_Discount
//
//  Created by 服部翼 on 2019/04/14.
//  Copyright © 2019 服部翼. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operator {
        case undefined
        case multiplication
    }

    @IBOutlet weak var answerLabel: UILabel!
    var firstValue = 0
    var secondValue = 0
    var currentOperator = Operator.undefined
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        answerLabel.backgroundColor = UIColor.white
        answerLabel.layer.borderWidth = 1.7
        answerLabel.layer.cornerRadius = 7.0
        answerLabel.clipsToBounds = true
        answerLabel.textColor = UIColor.black
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func numberPad(_ sender: UIButton) {
        var valueNumber = 0
        switch sender.currentTitle! {
        case "0":
            valueNumber = 0
        case "1":
            valueNumber = 1
        case "2":
            valueNumber = 2
        case "3" :
            valueNumber = 3
        case "4":
            valueNumber = 4
        case "5":
            valueNumber = 5
        case "6":
            valueNumber = 6
        case "7":
            valueNumber = 7
        case "8":
            valueNumber = 8
        case "9":
            valueNumber = 9
        default:
            valueNumber = 0
        }
        
        if currentOperator == .undefined {  
            firstValue = firstValue * 10 + valueNumber
            answerLabel.text = "\(firstValue)"
        } else {
            secondValue = secondValue * 10 + valueNumber
            answerLabel.text = "\(secondValue)"
        }
        
        
    }
    
    @IBAction func timesButton(_ sender: UIButton) {
        currentOperator = .multiplication
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        var value = 0
        
        let originalPrice = firstValue
        let disPrice = secondValue
        
        let discounted: Double = Double(disPrice) / 100
        let discountedPrice: Double = Double(originalPrice) * discounted
        
        let total: Double? = Double(originalPrice) - discountedPrice
        value = Int(Double(total!) * 1.08)
        
        answerLabel.text = "\(value)"
        
     
        firstValue = 0
        secondValue = 0
        currentOperator = .undefined
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        firstValue = 0
        secondValue = 0
        currentOperator = .undefined
        answerLabel.text = "0"
        
    }
    
    
}

