//
//  main.swift
//  protocol
//
//  Created by macadmin on 2016-05-19.
//  Copyright © 2016 macadmin. All rights reserved.
//

import Foundation

//Create function to format a NSDecimalNumber as a Currency String
func formatAsCurrency(amount: NSDecimalNumber) -> String{
    return "$" + String(amount)
}

//Create function to format a String as a Currency String
func formatAsCurrency(amount: String) -> String {
    return "$" + amount
}

func main() {
    //Declare the constant used to test the code
    let payableObjects: [Payable] = [
        SalariedEmployee(name: "John Smith", weeklySalary: NSDecimalNumber(string: "800.00"))!,
        Invoice(partNumber: "01234", partDescription: "seat", quantity: 2, price: NSDecimalNumber(string: "375.00"))!,
        CommissionEmployee(name: "Sue Jones", grossSales: NSDecimalNumber(string: "10000.00"), commissionRate: NSDecimalNumber(string: "0.06"))!,
        Invoice(partNumber: "56789", partDescription: "tire", quantity: 4, price: NSDecimalNumber(string: "79.95"))!,
        BasePlusCommissionEmployee(name: "Bob Lewis", grossSales: NSDecimalNumber(string: "5000.00"), commissionRate: NSDecimalNumber(string: "0.04"), baseSalary: NSDecimalNumber(string: "300.00"))!
    ]
    
    print("INVOICES AND EMPLOYEES PROCESSED POLYMORPHICALLY\n")
    
    for currentPayable in payableObjects {
        print(currentPayable)
        let paymentAmount = formatAsCurrency(currentPayable.paymentAmount)
        print("Payment Due: \(paymentAmount)")
    }
}

main()