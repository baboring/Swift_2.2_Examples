//
//  main.swift
//  Example(Calculate)
//
//  Created by macadmin on 2016-05-12.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation

class Main{
    
    var lstFomula : String?
    
    // group of number entries
    var lstOperandEntries : [Character] = ["0","1","2","3","4","5","6","7","8","9","."]
    
    var lstOperatorEntries : [Character] = ["+","-","*","/"]
   
    // it's better but change later
    var lstOperatorEntries2 : String = "+-*/"
    
    
    // Determin Op or Or or error ( if result is nill than error )
    func CheckOpOr(data : Character) -> Bool? {
        
        var result : Bool? = nil
        
        // first check operand
        for op in lstOperandEntries{
            
            if op == data{
                result = true   // operand
            }
        }
        
        // second check operand
        if IsOperator(data) {
            result = false   // operator

        }
       
        return result
        
    }
    
    func IsOperator(val : Character) ->Bool {
        // second check operand
        for op in lstOperatorEntries{
            
            if op == val{
                return true
            }
        }
        return false
    }
    
    // tokenize fomula
    func TokenizeNumbers(fomula : String) -> [String]? {
        
        let contents = (fomula as NSString).stringByReplacingOccurrencesOfString(" ",withString: "")
        
        var tokens = [String]()
        var inp : String = ""
        // status operand and operator
        var curr_state_number = true
        // jsut split number and operand
        for data in contents.characters{
            
            // check or get state
            let check_code = CheckOpOr(data)
            if check_code == nil {
                print("Fomula is wrong1 !!")
                return nil
            }
            
            // operand part
            if curr_state_number != check_code {
                
                // add
                tokens.append(inp)
                
                // clear
                curr_state_number = check_code!
                inp = ""
            }
            
            // check operater verity ( unknown operator )
            if curr_state_number == false && !inp.isEmpty {
                print("Fomula is wrong2 !!")
                return nil
            }
            // make a param
            inp.append(data)
            
            //print(data)
        }
        // last one check
        if !inp.isEmpty {
            tokens.append(inp)
        }
        
        return tokens
    }
    
    // Calculate Add
    func CalculateAdd( a : String, b : String ) -> Double {
        
        return (Double(a)! + Double(b)!)
    }
    
    // Calculate Subtract
    func CalculateSubtract( a : String, b : String ) -> Double {
        
        return (Double(a)! - Double(b)!)
    }
    // Calculate Divide
    func CalculateDivide( a : String, b : String ) -> Double {
        
        if Double(b) == 0 {
            return 0
        }
        return (Double(a)! / Double(b)!)
    }
    // Calculate Multiply
    func CalculateMultiply( a : String, b : String ) -> Double {
        
        return (Double(a)! * Double(b)!)
    }
    
    // Calculate Fomula
    func CalculatePowerOf( a : Int, b : Int ) -> Int {
        
        var result : Int = b > 0 ? 1 : 0
        
        for var i=0;i < b; ++i{
            result *= a
        }
        return result
    }
    
    // find highest
    func FindHighPriortyOp(szFormat : [String]) -> Int{
        
        var first = 0
        for var i=0; i<szFormat.count; ++i {
            
            let op = szFormat[i].characters.first!
            
            // find operator
            if IsOperator(op) {
                if first == 0{
                    first = i
                }
                
                // each case calc
                switch op {
                case "*":
                    return i
                case "/":
                    return i
                default:
                    break
                }
            }
        }
        return first
    }
    
    // calc all
    func CalculateFormat( szArray : [String]) -> Int {
        
        var szFormat = szArray
        // routine calc
        // find priorty high and calc
        // not smart way
        while(szFormat.count > 1 ){
            // test
            /* 
            var display = "Check = "
            for t in szFormat {
                display += ( t + " ")
            }
            // result
            print(display)
            */
            
            let i = FindHighPriortyOp(szFormat)
            let op = szFormat[i].characters.first!
            if IsOperator(op) {
                
                let op1 = szFormat[i-1]
                let op2 = szFormat[i+1]
                
                var calc_op3 : Double = 0
                // each case calc
                switch op {
                case "+":
                    calc_op3 = CalculateAdd(op1,b: op2)
                    break
                case "-":
                    calc_op3 = CalculateSubtract(op1,b: op2)
                    break
                case "*":
                    calc_op3 = CalculateMultiply(op1,b: op2)
                    break
                case "/":
                    calc_op3 = CalculateDivide(op1,b: op2)
                    break
                default:
                    print("Error operator \(op)")
                    break
                }
                szFormat.removeAtIndex(i+1)
                szFormat.removeAtIndex(i)
                szFormat.removeAtIndex(i-1)
                szFormat.insert(String(calc_op3), atIndex: i - 1)
            }
            else
            {
                print("error #1")
            }
            
        }
        if let result_val = Double(szFormat[0]) {
            return Int(floor(result_val))

        }
        return 0
    }
    
    // Main Loop
    func DoMain() {
        
        var inputVal = ""
        var keepPlaying = true
        
        // loop continue until break this
        while keepPlaying {
            
            print("Input Format( e.g. 2 ^ 3 ) not allowed ( or )")
            
            // prompt
            let fomula = GetInput()
                
            let operand = TokenizeNumbers(fomula);
            
            // verify
            if operand == nil {
                print("Fomula is wrong !!")
            }
            else {
                // display input formula and result
                var display = "Format = "
                for t in operand! {
                    display += ( t + " ")
                }
                
                // result
                print(display,"= \(CalculateFormat(operand!))")
            }
            
            // prompt continue
            print("\nPlay Again ? ( Y or N )")
            inputVal = GetInput()
            if inputVal == "N" || inputVal == "n" {
                keepPlaying = false
            }
            
        }
        
    }
}


// Do it
Main().DoMain()

