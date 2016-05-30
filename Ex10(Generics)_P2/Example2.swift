//
//  Example.swift
//  Alphabet Counter
//
//  Created by macadmin on 2016-05-24.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation

class MyObject {
    var name = ""
    var description = ""
    
    init (name :String, description : String ) {
        self.name = name
        self.description = description
    }
}
var myArr = [
    MyObject(name: "Abc", description: "Lorem ipsum 1."),
    MyObject(name: "Def", description: "Lorem ipsum 2."),
    MyObject(name: "Xyz", description: "Lorem ipsum 3.")
]

func Example() {
    let item = myArr.filter { $0.name == "Def" }.first
    if item != nil {
        // Do something...
        print(item!.description)
    }
    if myArr.contains ({ $0.name == "Def" }) {
        // Do something...
        print("Contains!!")
    }
}
