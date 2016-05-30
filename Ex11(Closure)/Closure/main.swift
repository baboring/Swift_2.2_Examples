//
//  main.swift
//  Closure
//
//  Created by macadmin on 2016-05-18.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation

func ascendingOrder( s1: String, s2:String) -> Bool {
    return s1 < s2
}

let colors = ["red","orange","yellow"]

print("Array of colors unsorted : \n\(colors.description)\n")

// sort asceding - function
let sortedColor1 = colors.sort(ascendingOrder)
print("Array of colors sorted : \n\(sortedColor1.description)\n")

// Fully typed closure expression - descending
let sortedColor2 = colors.sort({(s1:String, s2:String) -> Bool in s1 > s2 })
print("Array of colors sorted : \n\(sortedColor2.description)\n")

// write a closure to sort numbers 
let numbers = [-9, 2,3,10,200,30]

// soted ascending
let sortedNumbers1 = numbers.sort({(s1:Int,s2:Int) -> Bool in s1 < s2 })
print("Array of number sorted : \n\(sortedNumbers1.description)\n")

// inferred type
let sortedNumbers2 = numbers.sort({(s1,s2) -> Bool in s1 > s2 })
print("Array of number sorted : \n\(sortedNumbers2.description)\n")

// implicit return
// shorthand closure
print("Test \(numbers.sort({$0 > $1}))")

// trailing closure
print("Test \(numbers.sort(){$0 > $1})")

// operator closure
print("Test \(numbers.sort( > ))")

let testStr = "afbcddddabc"
print("reverse =\(String(testStr.characters.reverse()))")

let reverse_color = colors.map { String($0.characters.reverse())}
print("reverse =\(reverse_color)")





















var sortedNumbers3 = numbers
var tuples = [(Int,Int)]()

sortedNumbers3 += [1]
tuples += [(1,1)]
tuples += [(2,2)]

func DebugPrint( lst : (Int,Int)...) ->() {
    for val in lst {
        print("val = \(val)")
    }
}
func DebugPrint2( lst : Int...) ->() {
    for val in lst {
        print("val = \(val)")
    }
}
//DebugPrint2( sortedNumbers3 )
//DebugPrint( tuples )
