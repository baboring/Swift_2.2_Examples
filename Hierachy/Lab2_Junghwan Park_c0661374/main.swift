//
//  main.swift
//  Lab2_Junghwan Park_c0661374
//
//  Created by macadmin on 2016-05-20.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation


class Program {
    
    func DoMain() {
        
        print(" -------------------------")
        let square1 =  Square()
        let square2 =  Square(length : 7)

        let rect1 =  Rectangle()
        let rect2 =  Rectangle(length : 10, width: 5)
        
        print("squre1 : \(square1.description())")
        print("squre1 : \(square2.description())")
        
        print("rect1 : \(rect1.description())")
        print("rect2 : \(rect2.description())")
        
    }
}


Program().DoMain()