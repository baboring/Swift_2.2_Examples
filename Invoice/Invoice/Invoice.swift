//
//  Invoice.swift
//  Invoice
//
//  Created by macadmin on 2016-05-19.
//  Copyright © 2016 macadmin. All rights reserved.
//

import Foundation


public class Invoice : Payable, Printable {
    let partNumber : String
    let partDescription : String
    var quantity : Int
    var price : NSDecimalNumber
    
    public init?(partNumber: String, partDescription : String, quantity : Int, price : NSDecimalNumber){
       
        if partNumber.isEmpty || partDescription.isEmpty || quantity < 0 || (price.compare(NSDecimalNumber.zero()) == NSComparisonResult.OrderedAscending ) {
            return nil
        }
        self.partNumber = partNumber
        self.partDescription = partDescription
        self.quantity = quantity
        self.price = price
    }
    
    
    // implement method paymentAmount
    public var paymentAmount : NSDecimalNumber {
        let quantity = NSDecimalNumber(string: self.quantity.description)
        return quantity.decimalNumberByMultiplyingBy(price)
    }
    
    //
    public var description : String {
        let pricePerItem = NSNumberFormatter.localizedStringFromNumber(price, numberStyle: NSNumberFormatterStyle.CurrencyStyle)
        return String(format: "%0: \n%0: %0  (%0) \n%0: %d\n%0: %0","Invoice","Part Number", partNumber, partDescription, "Quantity", quantity, "Price per item", formatAsCurrency(pricePerItem))
    }
    
    func formatAsCurrency( num : String) ->String {
        
        return num
    }
}