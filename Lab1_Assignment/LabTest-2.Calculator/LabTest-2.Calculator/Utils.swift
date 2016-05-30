//
//  Utils.swift
//  LabTest-2.Calculator
//
//  Created by macadmin on 2016-05-13.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation

// input what you want
func GetInput() ->String {
    
    // loop for getting available value
    var input = ""
    while(true){
        input = NSString(data: NSFileHandle.fileHandleWithStandardInput().availableData, encoding: NSUTF8StringEncoding) as! String // get keyboard input
        input = input.stringByReplacingOccurrencesOfString("\n",withString: "", options: NSStringCompareOptions.LiteralSearch,range: nil)  // strip off the \n
        if input.characters.count < 1{
            continue
        }
        break
    }
    
    return input
}
