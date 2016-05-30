//
//  Member.swift
//  BankAccount
//
//  Created by macadmin on 2016-05-16.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation

class ManagerID {
    
    static func GetNewID() -> String {
        
        return NSUUID().UUIDString
    }
}

// member class
class Member {
    
    var name : String = "Benjamin"
    
    var lstAccount = [Account]()
    
    func AddAccount(newAccount : Account) -> Bool {
        lstAccount.append(newAccount)
        return true
    }
    
    // Close Account
    func CloseAccount(info : Account) -> Bool {
        
        for var i=0;i<lstAccount.count;++i {
            if info.id == lstAccount[i].id {
                lstAccount.removeAtIndex(i)
                return true
            }
        }
        return false
    }
    
    // Show Accounts list
    func Show() {
        // Display member's account list
        print("*******************************************")
        print("member name is \(name)")
        print("Total accounts : \(lstAccount.count)")
        print("*******************************************")
        for var i=0;i < lstAccount.count;++i {
            print(" No : \(i+1)")
            lstAccount[i].ShowBalance()
            print("////////////////////////////////////////////")
        }
        
    }
}
