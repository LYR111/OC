//
//  ViewController.swift
//  猜数游戏
//
//  Created by 刘亚茹 on 2019/1/28.
//  Copyright © 2019 LIUYARU. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    var answer =  GKRandomSource.sharedRandom().nextInt(upperBound:100)+1
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    
    
    @IBOutlet weak var messageLable: UILabel!
    
    
    @IBOutlet weak var inputTextField: UITextField!
    
    
    @IBAction func makeAGuess(_ sender: UIButton) {
        if isOver == false{
            
            
            print(answer)
            let inputText =  inputTextField.text!
            inputTextField.text = ""
            
            
            print("inputText = \(inputText)")
            let inputNumber = Int(inputText)
            if inputNumber == nil
            {
                messageLable.text = "No input!Guess a number between \(minNumber)-\(maxNumber)"
            }else
            {
                messageLable.text = "input number =\(inputNumber!)"
            }
            if inputNumber! > maxNumber
            {
                messageLable.text =  "too large!Guess a number between \(minNumber)-\(maxNumber)"
            }else if inputNumber! < minNumber{
                messageLable.text =  "too small!Guess a number between \(minNumber)-\(maxNumber)"
                
            }else if inputNumber! == answer{
                messageLable.text = "You are right,Please [Guess] to play again!"
                isOver = true
                
         
            }
            else{
                
                if inputNumber! > answer
                {
                    maxNumber = inputNumber!
                }else
                {
                    minNumber = inputNumber!
                }
                messageLable.text = "Try again!Guess a Number between \(minNumber)- \(maxNumber)"
            }
            
        }
        
        else{
            maxNumber = 100
            minNumber = 0
            answer =  GKRandomSource.sharedRandom().nextInt(upperBound:100)+1
            isOver = false
        }
     
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.becomeFirstResponder()
      
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

