//
//  main.swift
//  Example(Calculate)
//
//  Created by macadmin on 2016-05-12.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation

class Main{
    
    // tokenize fomula
    func TokenizeNumbers(fomula : String) -> [String]? {
        
        let contents = (fomula as NSString).stringByReplacingOccurrencesOfString(" ",withString: "")
        
        return contents.componentsSeparatedByString("^")
        
    }
    
    // Calculate Fomula
    func CalculatePowerOf( a : Int, b : Int ) -> Int {
        
        var result : Int = b > 0 ? 1 : 0
        
        for var i=0;i < b; ++i{
            result *= a
        }
        return result
    }
    
    // Main Loop
    func DoMain() {
        
        var inputVal = ""
        var keepPlaying = true
        var continueInput = true
        
        // loop continue until break this
        while keepPlaying {
            
            print("Input foluma (Only power fomula)!! ( e.g. 2 ^ 3 )")
            
            while continueInput {
                
                // prompt
                let fomula = GetInput()
                
                let operand = TokenizeNumbers(fomula);
                
                // verify value
                if operand?.count > 1 && Int((operand!)[0]) != nil && Int((operand!)[1]) != nil {
                    
                    let val1 = Int((operand!)[0])!
                    let val2 = Int((operand!)[1])!
                    let result = CalculatePowerOf(val1, b: val2)
                    // ok end
                    print("'\(val1) ^ \(val2)' = \(result)")
                    break
                }
                print("It's not fomula or impossible, try again!!");
                continue
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

