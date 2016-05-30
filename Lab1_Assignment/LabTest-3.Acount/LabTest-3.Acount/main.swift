//
//  main.swift
//  LabTest-3.Acount
//
//  Created by macadmin on 2016-05-13.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation

class Main{
    
    // Account strcut
    class Account{
        var name : String = ""
        var State : Bool = false
        var Balance : Double = 0
    }
    
    enum Command {
        case None
        case Create
        case Deposit
        case Withdraw
        case ShowBalance
        case Quit
    }
    
    var member = Account()
    
    var cmd = Command.None
    
    var keepPlaying = true
    var inputVal = ""

    
    // How can I help you?
    func PromptCommand() -> Command{
        
        print("------------------------------------")
        print("Input Command Key Please ( C : Create Account, D : Deposit, W : Withdraw, S : Show Balance Q : Quit )")
        print("------------------------------------")
        
        switch(GetInput()){
        case "C", "c":
            return Command.Create
        case "D","d":
            return Command.Deposit
        case "W","w":
            return Command.Withdraw
        case "S","s":
            return Command.ShowBalance
        case "Q","q":
            return Command.Quit
        default:
            return Command.None
        }
        
    }
    func DisplayError()
    {
        print("Not found opened account Information")
    }
    
    
    func Proc_CreateAccount() {
        
        print("input account name !!!");
        let val = GetInput()
        member.State = true
        member.name = val
        
        print("Thank you create account !!!");
    }
    
    // sub routine withdraw
    func Proc_Withdraw() {
        
        // check validate
        if member.State == false {
            DisplayError()
            return
        }
        
        print("input money for deposit!!!");
        if let val = Double(GetInput()) {
            if member.Balance >= val {
                member.Balance -= val
                print("Thank you deposit money !!!");
                return
            }
            else{
                print("Sorry not enough money!!!");
                return
            }
        }
        print("error wrong type!!!");
    }
    
    // sub routine deposit
    func Proc_Deposit() {
        // check validate
        if member.State == false {
            DisplayError()
            return
        }
        
        print("input money  for withdraw!!!");
        if let val = Double(GetInput()) {
            member.Balance += val
            print("Thank you deposit money !!!");
            return
        }
        
        print("error wrong type!!!");
    }
    
    // sub routine show balance
    func Proc_ShowBalance() {
        
        // check validate
        if member.State == false {
            DisplayError()
            return
        }
        print("------------------------------------")
        print("Account Info")
        print("------------------------------------")
        print("Name : \(member.name)")
        print("Balance : \(member.Balance) $")
        
    }
    
    // Main Loop
    func DoMain() {
        
        // loop continue until break this
        while(keepPlaying) {
            
            // input command and process sub routine
            switch PromptCommand() {
            case Command.Create:
                Proc_CreateAccount()
                break
            case Command.Deposit:
                Proc_Deposit()
                break
            case Command.Withdraw:
                Proc_Withdraw()
                break
            case Command.ShowBalance:
                Proc_ShowBalance()
                break
            case Command.Quit:
                keepPlaying = false
                break
           default:
                break
            }
            

        }
        
    }
}


// Do it
Main().DoMain()
