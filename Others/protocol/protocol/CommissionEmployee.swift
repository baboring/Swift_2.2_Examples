//
//  CommissionEmployee.swift
//  protocol
//
//  Created by macadmin on 2016-05-19.
//  Copyright © 2016 macadmin. All rights reserved.
//

import Foundation

public class CommissionEmployee : Employee {
    
    var grossSales : NSDecimalNumber!
    var commissionRate : NSDecimalNumber!
    
    public init?(name: String, grossSales: NSDecimalNumber, commissionRate: NSDecimalNumber) {
        self.commissionRate = commissionRate
        self.grossSales = grossSales
        super.init(name: name)
    }
    
    override public var earnings : NSDecimalNumber {
        return grossSales.decimalNumberByMultiplyingBy(commissionRate)
    }
    
}