//
//  Emplyee.swift
//  protocol
//
//  Created by macadmin on 2016-05-19.
//  Copyright © 2016 macadmin. All rights reserved.
//

import Foundation

//Employee class that conforms to the Payable protocol via extensions
public class Employee {
    public var name: String!
    
    //failable initializer
    public init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    
    //earnings computed property
    public var earnings: NSDecimalNumber {
        return NSDecimalNumber.zero()
    }
    
    //description computed property
    public var description: String {
        return name
    }
}

//add Payable conformance to entire employee hierarchy
extension Employee : Payable {
    var paymentAmount: NSDecimalNumber {
        return earnings
    }
}

//add CustomStringConvertible conformance to entire employee hierarchy;
extension Employee : CustomStringConvertible {}