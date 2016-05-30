//
//  SalariedEmployee.swift
//  protocol
//
//  Created by macadmin on 2016-05-19.
//  Copyright © 2016 macadmin. All rights reserved.
//

import Foundation

//Salaried employee subclass of Employee
public class SalariedEmployee : Employee {
    var weeklySalary : NSDecimalNumber
    
    //failable initializer
    public init?(name:String, weeklySalary: NSDecimalNumber){
        self.weeklySalary = weeklySalary
        super.init(name: name)
    }
    
    //overide earnings atribute to comply with the salaried
    override public var earnings : NSDecimalNumber {
        return weeklySalary
    }
}