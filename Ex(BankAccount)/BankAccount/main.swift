//
//  main.swift
//  BankAccount
//
//  Created by macadmin on 2016-05-16.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation

class Main{
    
    enum Command {
        case None
        case Open
        case Deposit
        case Withdraw
        case Transfer
        case ShowBalance
        case Close
        case Quit
    }
    
    
    var member = Member()
    var work_account : Account?
    var Saving_account : SavingAccount?
    
    var cmd = Command.None
    
    var keepPlaying = true
    var inputVal = ""
    
    
    // How can I help you?
    func PromptCommand() -> Command{
        
        print("-----------------------------------------------------")
        print("Input Command Key Please")
        print("-----------------------------------------------------")
        print("O : Open Account, \nC : Close Account \nT : Transfer To SavingAccount \nD : Deposit, \nW : Withdraw, \nS : Show Balance \nQ : Quit ")
        print("-----------------------------------------------------")
        
        switch(GetInput()){
        case "O", "o":
            return Command.Open
        case "D","d":
            return Command.Deposit
        case "W","w":
            return Command.Withdraw
        case "S","s":
            return Command.ShowBalance
        case "C","c":
            return Command.Close
        case "T","t":
            return Command.Transfer
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
    
    
    func Proc_OpenAccount() {
        
        print("input new account name !!!");
        let val = GetInput()
        if val.characters.count < 1 {
            print("Error : need a name !!!");
            return
        }
        
        if let newAccount = Account.OpenAccount(val, amount_deposit: 100, interest_rate: 0.05) {
            if member.AddAccount(newAccount) {
                print("Thank you create account !!!");
                work_account = newAccount
                work_account?.ShowBalance()
            }
           
            return;
        }
    }
    
    
    func Proc_CloseAccount() {
        
        // check validate
        if !CheckWorkAccount() {
            return
        }
        
        print("Are you sure!!!");
        let yesno = GetInput()
        
        if yesno == "Y" || yesno == "y" {
            
            if member.CloseAccount(work_account!) {
                work_account = nil
            }
            member.Show()
        }
    }
    

    
    func Proc_OpenSavingAccount() {
        
        // check validate
        if !CheckWorkAccount() {
            return
        }
        print("How much money do you transfer? !!!");
        let saving_money = Float(GetInput())
        if  saving_money == nil {
            print("Error : not number!!!");
            return
        }
        
       
        print("input new Saving account name !!!");
        let name = GetInput()
        if name.characters.count < 1 {
            print("Error : need a name !!!");
            return
        }
        
        print("How many years do you want? !!!");
        let years = Int(GetInput())
        if  years == nil {
            print("Error : not number!!!");
            return
        }
        

        // Check Balance
        if !work_account!.Withdraw(saving_money!){
            print("Error : not enough money!!!");
            return
        }
        
        if nil == Saving_account {
            
            // Open Saving Account
            if let newAccount = SavingAccount.OpenAccount(name, amount_deposit: saving_money!, interest_rate: 0.15,total_years: years!) {
                if member.AddAccount(newAccount) {
                    print("Thank you create account !!!");
                    Saving_account = newAccount
                    work_account?.ShowBalance()
                    Saving_account?.ShowBalance()
                }
                
                return;
            }
        }
        else  {
            Saving_account!.Deposit(saving_money!)
            work_account?.ShowBalance()
            Saving_account?.ShowBalance()
        }
       
    }
    
    // sub routine withdraw
    func Proc_Withdraw() {
        
        // check validate
        if !CheckWorkAccount() {
            return
        }
        
        
        print("input amount of money for withdraw!!!");
        if let val = Float(GetInput()) {
            
            if work_account!.Withdraw(val){
                print("Thank you withdraw money !!!");
                work_account!.ShowBalance()
                return
            }
            print("Sorry not enough money!!!");
            return
        }
        print("error wrong type!!!");
    }
    
    // sub routine deposit
    func Proc_Deposit() {
        // check validate
        if !CheckWorkAccount() {
            return
        }
       
        print("input amount of money for deposit!!!");
        if let val = Float(GetInput()) {
            
            if work_account!.Deposit(val) {
                print("Thank you deposit money !!!");
                work_account!.ShowBalance()
                return
            }

            print("Sorry occured error!!");
            return
        }
        
        print("error wrong type!!!");
    }
    
    // sub routine show balance
    func Proc_ShowBalance() {
        
        //print("\u{001B}[2J")
        member.Show()
    }
    
    func CheckWorkAccount() ->Bool {
        if nil == work_account {
            print("Account is not ready !!")
            return false
        }
        // check validate
        if !work_account!.IsValid(){
            DisplayError()
            return false
        }
        return true
    }
    
    // Main Loop
    func DoMain() {
        
        member.Show()
        
        // loop continue until break this
        while(keepPlaying) {
            
            // input command and process sub routine
            switch PromptCommand() {
            case Command.Open:
                Proc_OpenAccount()
                break
            case Command.Close:
                Proc_CloseAccount()
                break
            case Command.Transfer:
                Proc_OpenSavingAccount()
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
