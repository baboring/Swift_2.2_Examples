//
//  payable.swift
//  Invoice
//
//  Created by macadmin on 2016-05-19.
//  Copyright © 2016 macadmin. All rights reserved.
//

import Foundation


protocol Payable {
    var paymentAmount : NSDecimalNumber { get }
}