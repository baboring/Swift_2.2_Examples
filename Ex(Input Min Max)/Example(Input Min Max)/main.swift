//
//  main.swift
//  Example(Input Min Max)
//
//  Created by macadmin on 2016-05-11.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation


struct OrderNumber {
    var num : Int?
    var value : Int?
}

class Main{
    
    var lstOrder = ["1st","2nd","3rd","4th","5th","6th","7th","8th","9th","10th"]
    var lstInput  = [Int]()
    
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
        while(keepPlaying) {
            
            print("Input some numbers until space !!")
            
            while(continueInput){
                
                // prompt
                userInput  = Int(GetInput())
                
                // verify value
                if userInput == nil{
                    // ok end
                    print("Ok, It's Final input!!!")
                    print("------------------------")
                    break
                }
                
                lstInput += [userInput!]
                
            }
            
            // check values
            if lstInput.count < 1 {
                print("Not enough input data !!!")
            }
            else{

                var min = OrderNumber()
                var max = OrderNumber()

                // calc min/max
                for var i = 0; i < lstInput.count; ++i {
                
                    let val = lstInput[i]
                    // check first value
                    if min.num == nil {
                        min.num = i
                        min.value = val
                    }
                    else if(min.value! > val) {
                        min.num = i
                        min.value = val
                    }
                
                    // check first value
                    if max.num == nil {
                        max.num = i
                        max.value = val
                    }
                    else if(max.value! < val) {
                        max.num = i
                        max.value = val
                    }
                    
                    print("\(lstOrder[i]) value is \(val)")
                
                }
                print("------------------------")
                
                // output min,max
                print("Minimum value is '\(lstOrder[min.num!])' one and value is \(min.value!)")
                print("Maximum value is '\(lstOrder[max.num!])' one and value is \(max.value!)")
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