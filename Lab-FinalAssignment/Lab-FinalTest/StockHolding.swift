//
//  StockHolding.swift
//  Lab-FinalTest
//
//  Created by macadmin on 2016-05-25.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation


// StockHolding class ( basic )
class StockHolding : StockInfo {
    
    // declear variables
    let companyName : String
    var purchaseSharePrice  : Float
    var currentSharePrice   : Float
    var numberOfShares : Int
    
    // from protocol
    var costInDollars : Float {
        return purchaseSharePrice * Float(numberOfShares)
    }
    var valueInDollars : Float {
        return currentSharePrice * Float(numberOfShares)
    }
    
    // profit value
    var profit : Float {
        return valueInDollars - costInDollars
    }
    
    // describe information
    var description : String {
        var output : String = ""
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        output += String(format: "companyName %@",companyName.stringByRightPaddingToLength(10))
        output += String(format: "| cost %@",formatter.stringFromNumber(NSNumber(float: costInDollars))!)
        output += ",value \(formatter.stringFromNumber(NSNumber(float: valueInDollars))!)"
        output += ",amount \(numberOfShares)"
        output += ",profit \(formatter.stringFromNumber(NSNumber(float: profit))!)"
        return output
    }
    
    // overload initialize func
    init?(_ name : String, _ purchasePrice : Float, _ currentPrice : Float, _ numOfShares : Int) {
        
        companyName = name
        purchaseSharePrice = purchasePrice
        currentSharePrice = currentPrice
        numberOfShares = numOfShares
        // verify values
        if purchasePrice < 0 || purchasePrice < 0 || numOfShares < 0 {
            return nil
        }
    }
    

}

// hierarchy from stockholding
class ForeignStockHolding : StockHolding {
    
    // declear variables
    var conversionRate : Float
    
    
    // override calculating
    override var costInDollars : Float {
        return super.costInDollars * conversionRate
    }
    override var valueInDollars : Float {
        return super.valueInDollars * conversionRate
    }
    
    // overload initialize func
    init?(_ name : String, _ purchasePrice : Float, _ currentPrice : Float, _ numOfShares : Int,  _ conversionRate : Float) {
        
        self.conversionRate = conversionRate
        
        super.init(name, purchasePrice, currentPrice, numOfShares)
        
        // verify values
        if conversionRate < 0 {
            return nil
        }

    }
}