//
//  Shape.swift
//  Lab2_Junghwan Park_c0661374
//
//  Created by macadmin on 2016-05-20.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation


protocol commonShape {
    var numberOfSides : Int { get }
    
    func description() ->String
    
    init()
}

class Shape : commonShape {
    var numberOfSides : Int
    
    required init() {
        numberOfSides = 0
    }
    
    func description() -> String {
        return "This is a Shape and has \(numberOfSides) side"
    }
}


// Rectangle shape
class Rectangle : Shape {
    
    // Length and Width
    var length : Int
    var width : Int
    
   
    // Initialize function
    init(length : Int, width : Int) {
        
        self.length = length
        self.width = width
        
        // parent call
        super.init()
        
        if length * width < 1 {
           return
        }
        self.numberOfSides = 4

    }
    
    convenience required init() {
        self.init( length: 0, width : 0)
    }
    
    // implement description
    override func description() -> String {
        return "This is a Rectangle and has \(numberOfSides) sides ( Length : \(length) / Width : \(width)) "
    }
}

// square shape
class Square : Rectangle {
    
    // Length and Width
    var depth : Int
    
    // Initialize function
    init(length : Int) {
        
         self.depth = length
        // parent call
        super.init(length:length, width : length)
        
        if length < 1 {
            return
        }
        self.numberOfSides = 12

    }

    convenience required init() {
        self.init( length: 0 )
    }
    
    // implement description
    override func description() -> String {
        return "This is a Square and has \(numberOfSides) sides ( Length : \(length) / Width : \(width) / Depth : \(depth) )"
    }
}