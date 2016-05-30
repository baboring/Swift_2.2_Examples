//
//  Payable.swift
//  protocol
//
//  Created by macadmin on 2016-05-19.
//  Copyright © 2016 macadmin. All rights reserved.
//

import Foundation

//Declare Payable Protocol
protocol Payable {
    //Declare variable to store the amount due to be payed
    var paymentAmount : NSDecimalNumber {get}
}
