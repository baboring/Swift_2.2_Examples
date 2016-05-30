//
//  main.swift
//  Alphabet Counter
//
//  Created by macadmin on 2016-05-24.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation

///////////////////////////////////////////////////////////////////////////
// No.1  String "Hello Class " - > Length
func LengthOfString( sentence : String ) -> Int {
    return sentence.characters.count
}

// using closure
var TestCode1 = {
    
    let text1 = "Hello class!!!!"
    let count = LengthOfString(text1)
    print("No.1 :'\(count)' of characters from text '\(text1)'.")
}
// execute
TestCode1()

///////////////////////////////////////////////////////////////////////////
// No.2  String Contains "Characters"

func CountContains( sentence : String , letter : Character ) -> Int {
    return sentence.characters.filter({$0 == letter}).count
}

// using closure
var TestCode2 = {
    
    let text1 = "Characters"
    let char : Character = "a"
    let count = CountContains(text1,letter: char)
    print("No.2 :'\(text1)' contain letter '\(char)', \(count) time(s).")
}
// execute
TestCode2()

///////////////////////////////////////////////////////////////////////////
// No.3  String "Hello Class "
func CountAlphabet( sentence : String ) -> Int {
    let alphabetSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMOPQRSTUVWXYZ"
    var cnt = 0
    for data in sentence.characters {
        //find out alphabet in the alphabetSet
        if alphabetSet.characters.filter({$0 == data}).count > 0 {
            ++cnt
        }
    }
    return cnt
}
// using closure
var TestCode3 = {
    
    let text = "Hello class"
    let count = CountAlphabet(text)
    print("No.3 : There is consisted '\(count)' letter(s) in this '\(text)'.")
}
// execute
TestCode3()

//////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
// No.4  Swap A,B
func Swap<T>( inout a : T , inout _ b : T ) {
    let t = b
    b = a
    a = t
}

// using closure
func TestCodeSwap<T>(var a : T, var _ b : T)  {
    print ("before : a = \(a), b = \(b)")
    Swap( &a , &b)
    print ("after : a = \(a), b = \(b)")
}
// execute
TestCodeSwap("Hello","Class")
TestCodeSwap(100, 300)
//////////////////////////////////////////////////////////////////////////

func printArray<T>(array : [T]){
    
    var output = "["
    for var i=0;i<array.count;++i {
        output += ( i < array.count - 1 ? "\(array[i])," : "\(array[i])");
    }
    output += "]"
    print(output)
}

printArray([Int]())
printArray([1,2,3,4,5])
printArray([1.0,2.0,3.0,4.0,5.0])
printArray(["A","B","C","D"])
