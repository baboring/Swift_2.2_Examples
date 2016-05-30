//
//  main.swift
//  Test
//
//  Created by macadmin on 2016-05-10.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation

class Main{
    
    var randomNumber = 1
    var userGuess : Int?
    var continueGuessing = true
    var keepPlaying = true
    var inputVal = ""
    
    // input what you want
    func GetInput() ->String {
        
        // loop for getting available value
        var input = ""
        while(true){
            input = NSString(data: NSFileHandle.fileHandleWithStandardInput().availableData, encoding: NSUTF8StringEncoding) as! String // get keyboard input
            input = input.stringByReplacingOccurrencesOfString("\n",withString: "", options: NSStringCompareOptions.LiteralSearch,range: nil)  // strip off the \n
            if input.characters.count < 1{
                continue
            }
            break
        }
        
        return input
    }
    
    
    
    // Main Loop
    func DoMain() {
        
        // loop continue until break this
        while(keepPlaying) {
            
            randomNumber = Int(arc4random_uniform(101))
            print("The random number to guess is \(randomNumber)")
            
            while(continueGuessing){
                
                // prompt
                print("Pick a number between 0 and 100.")
                userGuess  = Int(GetInput())
                
                // verify value
                if userGuess == nil{
                    print("It's not a number!!! Try Again!!!")
                    continue
                }
                
                if userGuess! > randomNumber {
                    print("Your guess is too high")
                }
                else if userGuess! < randomNumber {
                    print("Your guess is too low")
                }
                else {
                    print("Currect number!!!")
                    continueGuessing = false
                }
            }
            
            // prompt continue
            print("Play Again ? ( Y or N )")
            inputVal = GetInput()
            if inputVal == "N" || inputVal == "n" {
                keepPlaying = false
            }
            
            continueGuessing = true
            
        }
        
        
        
    }
}

// Do it
Main().DoMain()

