//
//  BasePlusCommissionEmployee.swift
//  protocol
//
//  Created by macadmin on 2016-05-19.
//  Copyright © 2016 macadmin. All rights reserved.
//

import Foundation

public class BasePlusCommissionEmployee : Employee {
    
    var grossSales : NSDecimalNumber!
    var commissionRate : NSDecimalNumber!
    var baseSalary : NSDecimalNumber!
    
    public init?(name: String, grossSales: NSDecimalNumber, commissionRate: NSDecimalNumber, baseSalary: NSDecimalNumber) {
        
        self.grossSales = grossSales
        self.commissionRate = commissionRate
        self.baseSalary = baseSalary
        super.init(name: name)
    }
    
    override public var earnings : NSDecimalNumber {
        return baseSalary.decimalNumberByAdding(grossSales.decimalNumberByMultiplyingBy(commissionRate))
    }
    
}