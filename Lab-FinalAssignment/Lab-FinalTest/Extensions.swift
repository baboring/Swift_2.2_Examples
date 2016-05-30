//
//  Extensions.swift
//  Lab-FinalTest
//
//  Created by macadmin on 2016-05-26.
//  Copyright © 2016 Lambton College. All rights reserved.
//

import Foundation


extension String {
    func stringByLeftPaddingToLength(newLength : Int) -> String {
        let length = self.characters.count
        if length < newLength {
            // Prepend `newLength - length` space characters:
            return String(count: newLength - length, repeatedValue: Character(" ")) + self
        } else {
            // Truncate to the rightmost `newLength` characters:
            return self.substringFromIndex(startIndex.advancedBy(length - newLength))
        }
    }
}

extension String {
    func stringByRightPaddingToLength(newLength : Int) -> String {
        let length = self.characters.count
        if length < newLength {
            // Prepend `newLength - length` space characters:
            return self + String(count: newLength - length, repeatedValue: Character(" "))
        } else {
            // Truncate to the rightmost `newLength` characters:
            return self.substringFromIndex(startIndex.advancedBy(length - newLength))
        }
    }
}