//
//  main.swift
//  Lab-FinalTest
//
//  Created by macadmin on 2016-05-25.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation




//////////////////////////////////////////////////////////////////////////////
func Main1() {
    
    let lstStockHoldings = [
        StockHolding("Microsoft"        , 2.30, 4.50, 40),
        StockHolding("Apple"            , 12.19, 10.56, 90),
        StockHolding("IBM"              , 45.10, 49.51, 210)
    ]
    print("\nOutput #1 ------------------------------------------------------")
    for val in lstStockHoldings.sort({ $0!.companyName.localizedCaseInsensitiveCompare($1!.companyName) == NSComparisonResult.OrderedAscending }) {
        print( val!.description)
    }
    
}

//////////////////////////////////////////////////////////////////////////
func Main2() {
    let lstStockHoldings = [
        StockHolding("Microsoft"        , 2.30, 4.50, 40),
        StockHolding("Apple"            , 12.19, 11.56, 90),
        StockHolding("IBM"              , 45.10, 49.51, 210),
        ForeignStockHolding("SAMSUNG"   , 38.10, 39.51, 110, 0.95),
        ForeignStockHolding("Sony"      , 25.10, 29.51, 60, 0.85)

    ]
    
   print("\nOutput #2 ------------------------------------------------------")
   for val in lstStockHoldings.sort({ $0!.companyName.localizedCaseInsensitiveCompare($1!.companyName) == NSComparisonResult.OrderedDescending }) {
        print( val!.description)
    }
    
}

//////////////////////////////////////////////////////////////////////////
func Main3() {
    
    var lstHoldings = [StockHolding]()
    
    // How can I help you?
    func PromptAmount() -> Int {
        
        while(true) {
            print("How many stocks do you want ?")

            if let count = Int(GetInput()) {
                if count > 8 {
                    print("Error : It's too many amount of number!! ( maximum 8 stock )")
                    continue
                }
                return count
            }
            else {
                print("Error : It's not number !!")
            }
        }
    }
    enum TypeOfStock {
        case NormalStock
        case ForiengStock
    }
    
    // declare input sequence types
    enum InputType {
        case TypeOfStock
        case NameOfCompany
        case PriceOfPurchase
        case PriceOfCurrent
        case AmountOfShares
        case CoversionRate
        case Done
    }
    // normal case
    var seqNormal = [
        InputType.NameOfCompany,
        InputType.PriceOfPurchase,
        InputType.PriceOfCurrent,
        InputType.AmountOfShares,
    ]
    // normal case
    var seqForeign = [
        InputType.NameOfCompany,
        InputType.PriceOfPurchase,
        InputType.PriceOfCurrent,
        InputType.AmountOfShares,
        InputType.CoversionRate,
    ]
    
    // text key
    var textAsk = [
        InputType.TypeOfStock : "which is wnat you want ( 1.Normal Stock , 2.Foreign Stock )",
        InputType.NameOfCompany : "Input Name of Company",
        InputType.PriceOfPurchase : "Input Price of Purchase",
        InputType.PriceOfCurrent : "Input Price of Current",
        InputType.AmountOfShares : "Input Amount of Shares",
        InputType.CoversionRate : "Input ConversionRate Rate ( only Foreign stock )",
        InputType.Done : "-----------------------"
    ]
    
    struct InputVar {
        var seq : [InputType]?
        var typeOfStock : TypeOfStock?
        var nameOfCompany : String?
        var pricePurchase : Float?
        var priceCurrent : Float?
        var amount : Int?
        var convRate : Float?
    }

    func InputFillStock(inout info : InputVar, _ typeOfnum : InputType, _ input : String){
        
        switch(typeOfnum) {
        case InputType.NameOfCompany:
            info.nameOfCompany = input
            break
        case InputType.PriceOfPurchase:
            info.pricePurchase = Float(input)
            break
        case InputType.PriceOfCurrent:
            info.priceCurrent = Float(input)
            break
        case InputType.AmountOfShares:
            info.amount = Int(input)
            break
        case InputType.CoversionRate:
            info.convRate = Float(input)
            break
        case InputType.Done:
            break
        default:
            break
        }
    }

    func IsValidType( val : InputType, _ input : String) -> Bool {
        // valid check
        switch(val) {
        case InputType.TypeOfStock:
            if let _ = Int(input) {
                return true
            }
            break
        case InputType.NameOfCompany:
            return true
        case InputType.PriceOfPurchase:
            if let _ = Float(input) {
                return true
            }
            break
        case InputType.PriceOfCurrent:
            if let _ = Float(input) {
                return true
            }
            break
        case InputType.AmountOfShares:
            if let _ = Int(input) {
                return true
            }
            break
        case InputType.CoversionRate:
            if let _ = Float(input) {
                return true
            }
            break
        case InputType.Done:
            break
        }
        return false
    }
    
    // input stock informations
    func ProcInputStockInformations(var inpVar : InputVar) {

        /////////////////////////////////////////
        for val in inpVar.seq!  {
            
            // display text
            print(textAsk[val]!)
            
            while(true) {
                let input = GetInput()
                
                // error check

                if false == IsValidType(val, input) {
                    print("Error : It's not wrong!")
                    continue
                }

                // input data 
                InputFillStock( &inpVar, val, input)
                break
            }

        }
        // create
        let newStock = ( inpVar.typeOfStock! == TypeOfStock.NormalStock ) ? StockHolding(
                inpVar.nameOfCompany!,
                inpVar.pricePurchase!,
                inpVar.priceCurrent!,
                inpVar.amount!
            ) : ForeignStockHolding(
                inpVar.nameOfCompany!,
                inpVar.pricePurchase!,
                inpVar.priceCurrent!,
                inpVar.amount!,
                inpVar.convRate!
        )
        
        
        lstHoldings.append( newStock! )

    }
    
    // total count
    let total = PromptAmount()
    for var i=0;i<total;++i {
        
        var inpVar = InputVar()
        print("which is wnat you want ( 1.Normal Stock , 2.Foreign Stock )")
        while(true) {
            let input = GetInput()
            
            // error check
            if false == IsValidType(InputType.TypeOfStock, input) {
                print("Error : It's not wrong!")
                continue
            }
            if input == "1" {
                inpVar.typeOfStock = TypeOfStock.NormalStock
                inpVar.seq = seqNormal
            }
            else {
                inpVar.typeOfStock = TypeOfStock.ForiengStock
                inpVar.seq = seqForeign
            }
            break
        }
       
        ProcInputStockInformations( inpVar)
    }
        

    print("\nOutput #3 ------------------------------------------------------")
    // lowest value company
    let lowest = lstHoldings.reduce(lstHoldings[0],combine: {($0.currentSharePrice < $1.currentSharePrice) ? $1 : $0})
    let higest = lstHoldings.reduce(lstHoldings[0],combine: {($0.currentSharePrice > $1.currentSharePrice) ? $1 : $0})
    let worth = lstHoldings.reduce(lstHoldings[0],combine: {($0.profit < $1.profit) ? $1 : $0})
    let worst = lstHoldings.reduce(lstHoldings[0],combine: {($0.profit > $1.profit) ? $1 : $0})
    
    print("1)Lowest value Complay : \(lowest.companyName), price is \(lowest.currentSharePrice)")
    print("2)Highest value Complay : \(higest.companyName), price is \(higest.currentSharePrice)")
    print("3)Worth value Complay : \(worth.companyName), prifit is \(worth.profit)")
    print("4)worst value Complay : \(worst.companyName), prifit is \(worst.profit)")
    print("----------------------------------------------------------------")
    print("5)list of companeis ascending sort")
    print("----------------------------------------------------------------")
    for val in lstHoldings.sort({ $0.companyName.localizedCaseInsensitiveCompare($1.companyName) == NSComparisonResult.OrderedAscending }) {
        print( val.description)
    }
    print("----------------------------------------------------------------")
    print("6)list of companeis descending sort")
    print("----------------------------------------------------------------")
    for val in lstHoldings.sort({ $0.companyName.localizedCaseInsensitiveCompare($1.companyName) == NSComparisonResult.OrderedDescending }) {
        print( val.description)
    }
    
  

}

Main1()
Main2()
Main3()