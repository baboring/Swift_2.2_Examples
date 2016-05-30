//
//  Invoice.swift
//  protocol
//
//  Created by macadmin on 2016-05-19.
//  Copyright © 2016 macadmin. All rights reserved.
//

import Foundation

//Declare the Invoice class that implements the Payavle and CustomStringConvertible protocols
public class Invoice : Payable, CustomStringConvertible {
    
    //Declare the variables and constants to receive the information about the item
    let partNumber: String! //Reference ID
    let partDescription : String! //Description of the item
    var quantity : Int! //Number of items
    var price : NSDecimalNumber! //Price of each item
    
    //Initializes the Invoice and takes in the reference ID, description of the item, quantity of items and price of the items
    public init?(partNumber: String, partDescription: String, quantity: Int, price: NSDecimalNumber) {
        
        self.partNumber = partNumber
        self.partDescription = partDescription
        self.quantity = quantity
        self.price = price
        //If any of the values is invalid, the object isn't created
        if (partNumber.isEmpty || partDescription.isEmpty || quantity < 0 || (price.compare(NSDecimalNumber.zero()) == NSComparisonResult.OrderedAscending)) {
            return nil
        }
        
    }
    
    //Implements the payment amount to comply with the Payable protocol
    public var paymentAmount: NSDecimalNumber {
        let quantity = NSDecimalNumber (string: self.quantity.description)
        return quantity.decimalNumberByMultiplyingBy(price)
    }
    
    //Implements the description to comply with the CustomStirngConvertible protocol
    public var description : String {
        let pricePerItem = NSNumberFormatter.localizedStringFromNumber(price, numberStyle: .CurrencyStyle)
        return String(format:"%@:\n%@: %@ (%@) \n%@: %d\n%@: %@", "Invoice", "Part number", partNumber, partDescription, "Quantity", quantity, "Price per item", formatAsCurrency(pricePerItem))
    }
    
}