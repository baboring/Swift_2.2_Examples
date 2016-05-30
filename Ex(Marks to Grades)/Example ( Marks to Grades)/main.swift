//
//  main.swift
//  Example(Input Min Max)
//
//  Created by macadmin on 2016-05-11.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation


class Main{
    
    // Convert Mark to Grade
    func MarkToGrade( mark : Float ) -> String {
        
        switch mark {
        case 81...100:
            return "A"
        case 70...80:
            return "B"
        case 60...69:
            return "C"
        case 50...59:
            return "D"
        default:
            if mark > 100{
                return "A"
            }
            return "F"
        }
    }
    
    // Main Loop
    func DoMain() {
        
        var inputVal = ""
        var keepPlaying = true
        var continueInput = true
        var userInput : Float?
        
        // loop continue until break this
        while keepPlaying {
            
            print("Input Student's Mark !!! ex) 90")
            
            while continueInput {
                
                // prompt
                userInput  = Float(GetInput())
                
                // verify value
                if userInput == nil{
                    // ok end
                    print("Ok, It's not number !!! try again !")
                    continue
                }
                print("Student's Grade is '\(MarkToGrade(userInput!))' from \(userInput!)");
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