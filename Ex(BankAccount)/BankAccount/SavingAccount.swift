//
//  SavingAccount.swift
//  BankAccount
//
//  Created by macadmin on 2016-05-16.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation


// Saving Account
class SavingAccount : Account {
    
    var years : Int
    
    override init() {
        Account.init()
        years = 0
    }
    
    // create account by base amount of money
    static func OpenAccount( name : String, amount_deposit : Float, interest_rate : Float, total_years : Int) -> SavingAccount? {
        
        if amount_deposit < 0 {
            return nil
        }
        
        let newAccount = SavingAccount()
        newAccount.name = name
        newAccount.interest = interest_rate
        newAccount.balance = amount_deposit
        newAccount.years = total_years
        return newAccount
    }
}