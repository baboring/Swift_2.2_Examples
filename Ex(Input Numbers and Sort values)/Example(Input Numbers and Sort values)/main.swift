//
//  main.swift
//  Example(Input Min Max)
//
//  Created by macadmin on 2016-05-11.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation


class Main{
    
    let lstOrder = ["1st","2nd","3rd","4th","5th","6th","7th","8th","9th","10th"]
    var lstInput  = [(Int,Int)]()
    
    // input what you want
    func GetInput() ->String {
        
        // loop for getting available value
        var input = ""
        while(true){
            input = NSString(data: NSFileHandle.fileHandleWithStandardInput().availableData, encoding: NSUTF8StringEncoding) as! String // get keyboard input
            input = input.stringByReplacingOccurrencesOfString("\n",withString: "", options: NSStringCompareOptions.LiteralSearch,range: nil)  // strip off the \n
            break
        }
        
        return input
    }
    
    // Main Loop
    func DoMain() {
        
        
        var inputVal = ""
        var keepPlaying = true
        var continueInput = true
        var userInput : Int?
        
        // loop continue until break this
        while keepPlaying {
            
            var limit = 10
            print("Input some numbers until empty value or 10 times!!")
            
            while continueInput && limit > 0 {
                
                // prompt
                userInput  = Int(GetInput())
                
                // verify value
                if userInput == nil{
                    // ok end
                    print("Ok, It's Final input!!!")
                   break
                }
                --limit
                lstInput += [(lstInput.count,userInput!)]
                
            }
            
            // check values
            if lstInput.count < 1 {
                print("Not enough input data !!!")
            }
            else{
                
                print("--------- sort in descending --------")
                // sort descending
                for var i=0;i < lstInput.count - 1; ++i {
                    for var j=i+1;j < lstInput.count; ++j {
                        
                        if lstInput[i].1 < lstInput[j].1 {
                            swap(&lstInput[i], &lstInput[j])
                        }
                    }
                }
                
                // output
                for val in lstInput {
                    print("\(lstOrder[val.0]) value is \(val.1)")
                }
                print("------------------------------------")

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