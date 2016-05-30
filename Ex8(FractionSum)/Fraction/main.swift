//
//  main.swift
//  Fraction
//
//  Created by macadmin on 2016-05-17.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation

class ExampleFraction {
    
    // declare variables
    var lstFraction = [(Int,Int)]()
    let total = 3
    
    // debug function
    func debugOut(tuple : (Int, Int)) ->String {
        return "\(tuple.0)/\(tuple.1)"
    }
    
    
    func Initialize() {
        // make input fractions
        for var i=0;i<total;++i {
            let demo = Int(arc4random_uniform(4)) + 2
            let mo = Int(arc4random_uniform(UInt32(demo-1))) + 1
            lstFraction += [(mo,demo)]
        }
    }
    
    // Main Function
    func DoMain() {
        
        Initialize()
        
        let sum = Sum(lstFraction)
        
        // display
        var display = "sum : "
        for var i=0;i<lstFraction.count;++i {
            display += "\(lstFraction[i].0)/\(lstFraction[i].1)"
            if i < lstFraction.count - 1 {
                display += " + "
            }
        }
        
        display += " = \(sum.0)/\(sum.1)"
        print(display)
    }
    
    // Sum of Fraction
    func Sum(fractions : [(Int,Int)]) -> (Int,Int) {
        
        var frac1 : (Int,Int)?
        //
        for var i=1;i<fractions.count;++i{
            if frac1 == nil {
                frac1 = fractions[0]
            }
            frac1 = SumFraction(frac1!, b: fractions[i])
            
            //print("sum ",debugOut(frac1!))
        }
        
        if frac1 == nil {
            return (0,0)
        }
        
        // reduce....
        return Normalize(frac1!)
    }
    
    // input pair tuple value
    func SumFraction( a : (Int,Int), b : (Int,Int)) -> (Int,Int) {
        
        // find max comm
        let max_comm = FindMaxCommon((a.1, b.1))
        
        //print("max common = \(debugOut(a)),\(debugOut(b)),\(max_comm)")
        return ( a.0 * (max_comm / a.1) + b.0 * (max_comm / b.1) , max_comm)
    }
    
    // check integral number
    func IsableDivide( a : Int,  b : Int ) ->Bool {
        if Float(a / b) == Float(a) / Float(b) {
            return true
        }
        return false
    }
    
    // Find common max divide value
    func FindMaxCommon( val : (Int, Int) ) -> Int {
        
        for var i=1;i<100;++i {

            if IsableDivide(i , b : val.0) && IsableDivide(i , b : val.1) {
                return i;
            }
        }
        return 0
    }
    
    // make to minimum value
    func Normalize( fraction : (Int,Int) ) -> (Int,Int) {
        
        var max_common = 0
        var frac = fraction
        
        repeat {
            
            max_common = 0
            for var i=2;i<100;++i {
                if i > frac.0 || i > frac.1 {
                    break
                }
                else if IsableDivide(frac.0, b: i) && IsableDivide(frac.1, b: i) {
                    frac = (frac.0 / i, frac.1 / i)
                    max_common = i
                    //print( "divide = \(i)")
                    break
                }
            }
            
        } while(max_common > 0)
        
        return frac
    }

}

// Do Run
ExampleFraction().DoMain()



