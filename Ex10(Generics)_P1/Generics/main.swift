//
//  main.swift
//  Generics
//
//  Created by macadmin on 2016-05-18.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation

// filter map reduce
let values = [1,2,4,6,9,5]
print("\(values.description)")

let evenVal = values.filter(){$0 % 2 == 0}.sort(>)
print("\(evenVal.description)")

// map
let sqrVal = values.map(){$0 * $0}
print(sqrVal)

let sumVal = values.reduce(0, combine:{$0 + $1})
print(sumVal)

// sum the squares of the even integers
let result = values.filter({$0 % 2 == 0}).reduce(0,combine: {$0+$1})
print("sum the squares of the even integers is \(result)")

// sum the squares of the even integers
let max = values.reduce(values[0],combine: {($0 < $1) ? $1 : $0})
print("max number is \(max)")

// join all the strings into one string using reduce ( and space in between )
var lstString = ["Junghwan", "Park", "and", "Swift"]
print("\(lstString.reduce("",combine: {$0 + $1 + " "}))")





