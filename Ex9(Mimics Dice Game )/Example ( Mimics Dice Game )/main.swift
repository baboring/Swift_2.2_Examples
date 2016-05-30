//
//  main.swift
//  Example(Calculate)
//
//  Created by macadmin on 2016-05-12.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation

class Main{
    
    // Calculate Fomula
    func RollADice() -> Int {
        
        return Int(arc4random_uniform(6)) + 1
    }
    
    // Main Loop
    func DoMain() {
        
        var inputVal = ""
        var keepPlaying = true
        var continueInput = true
        
        print("*****************************************")
        print("\t\tWelcome to the Death Dice Game")
        print("*****************************************")
            
        // loop continue until break this
        while keepPlaying {
            
            let com_number = RollADice()
            print("Computer Roll a dice !!")
            print("com's dice number is \(com_number) ")
            
            print("Push enter to roll a dice !! good luck!!")
            while continueInput {
                
                inputVal = GetInput();
                let my_number = RollADice()
                
                print("your dice number is \(my_number)")
                
                if my_number > com_number {
                    print("you won !!")
                }
                else if my_number < com_number {
                    print("you lose !!")
                }
                else {
                    print("draw !!)")
                }
                break
            }
            
            // prompt continue
            print("\nPlay Again ? ( Y or N )")
            inputVal = GetInput()
            if inputVal == "N" || inputVal == "n" {
                keepPlaying = false
            }
            
            continueInput = true
            
        }
        
    }
}


// Do it
Main().DoMain()

