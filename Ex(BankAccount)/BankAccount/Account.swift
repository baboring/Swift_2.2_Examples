//
//  Account.swift
//  BankAccount
//

import Foundation



// account class ( basic )
class Account {
    
    enum StateAccount {
        case None
        case Opened
        case Closed
    }
    var id : String?
    var name : String = ""
    
    var balance : Float
    var interest : Float
    var state : StateAccount = StateAccount.None
    
    // Initialize values
    init() {
        balance = 0     // test 100
        interest = 0    // default is zero
        id = ManagerID.GetNewID()
        state = StateAccount.Opened
    }
    
    // create account by base amount of money
    static func OpenAccount( name : String, amount_deposit : Float, interest_rate : Float) -> Account? {
        
        if amount_deposit < 0 {
            return nil
        }
        
        let newAccount = Account()
        newAccount.name = name
        newAccount.interest = interest_rate
        newAccount.balance = amount_deposit
        
        return newAccount
    }
    
    // Transfer money
    func TransferTo(dest : Account, amount : Float ) -> Bool {
        
        return true
    }
    
    // Close account
    func CloseDown() {
        
        interest = 0
        balance = 0
        state = StateAccount.Closed
    }
    
    
    // Deposit amount of money
    func Deposit( amount : Float ) -> Bool {
        
        if !IsValid() || amount < 0 {
            return false
        }
        balance += amount
        return true
    }
    
    // Withdraw amount of money
    func Withdraw( amount : Float ) -> Bool {
        
        // Check limit
        if !IsValid() || amount > balance || amount < 0 {
            return false
        }
        balance -= amount
        return true
    }
    
    // Show Balance and account information
    func ShowBalance() {
        
        print("===============================================")
        print("Account Name : \(name)")
        print("Account ID : \(id!)")
        print("Account State : \(state)")
        print("Balance : \(balance)")
        print("Interest : \(interest * 100) %")
        print("-----------------------------------------------")
    }
    
    // check validation
    func IsValid() -> Bool {
        
        if id == nil || state != StateAccount.Opened{
            return false
        }
        return true
        
    }
    //
}

