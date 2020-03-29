//
//  Double.extension.swift
//  MarvelApp
//
//  Created by David Penagos on 29/03/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import Foundation

extension Double {
    // Formatting double value to k and M
    // 1000 = 1k
    // 1100 = 1.1k
    // 15000 = 15k
    // 115000 = 115k
    // 1000000 = 1m
    func formatPoints() -> String{
        let thousandNum = self/1000
        let millionNum = self/1000000
        if (self >= 1000 && self < 1000000) || (self <= -1000 && self > -1000000) {
            if(floor(thousandNum) == thousandNum){
                return ("\(Int(thousandNum))k").replacingOccurrences(of: ".0", with: "")
            }
            return("\(thousandNum.roundTo(places: 1))k").replacingOccurrences(of: ".0", with: "")
        }
        if (self > 1000000) || (self < -1000000) {
            if(floor(millionNum) == millionNum){
                return("\(Int(thousandNum))k").replacingOccurrences(of: ".0", with: "")
            }
            return ("\(millionNum.roundTo(places: 1))M").replacingOccurrences(of: ".0", with: "")
        }
        else{
            if(floor(self) == self){
                return ("\(Int(self))")
            }
            return ("\(self)")
        }
    }
    
    /// Returns rounded value for passed places
    ///
    /// - parameter places: Pass number of digit for rounded value off after decimal
    ///
    /// - returns: Returns rounded value with passed places
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
