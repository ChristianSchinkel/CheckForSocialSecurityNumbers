//
//  CheckingSecurityNumberFormat.swift
//  
//
//  Created by Christian Schinkel on 2023-08-14.
//

import Foundation
import RegexBuilder

@available(macOS 13.0, *)
struct SecurityNumberFormatChecker {
    /// Regex for a Swedish social security number `YYYYMMDD-NNNN`.
    let regEx0 = Regex {
        Capture {
            Anchor.wordBoundary
            Repeat(count: 8) {
                One(.digit)
            }
            "-"
            Repeat(count: 4) {
                One(.digit)
            }
        }
    }
    /// Regex for a Swedish social security number `YYMMDD-NNNN`.
    let regEx1 = Regex {
        Capture {
            Anchor.wordBoundary
            Repeat(count: 6) {
                One(.digit)
            }
            "-"
            Repeat(count: 4) {
                One(.digit)
            }
        }
    }
    /// Regex for a Swedish social security number `YYYYMMDDNNNN`.
    let regEx0_1 = Regex {
        Capture {
            Anchor.wordBoundary
            Repeat(count: 8) {
                One(.digit)
            }
            Repeat(count: 4) {
                One(.digit)
            }
        }
    }
    /// Regex for a Swedish social security number `YYMMDDNNNN`.
    let regEx1_1 = Regex {
        Capture {
            Anchor.wordBoundary
            Repeat(count: 6) {
                One(.digit)
            }
            Repeat(count: 4) {
                One(.digit)
            }
        }
    }
    /// Enumerated types of available formats of Swedish social security number.
    enum FormatTypeOfSwedishSocialSecurityNumber {
        case twelveDigitsWithHyphen, tenDigitsWithHyphen, twelveDigits, tenDigits
        
        var id: Self { self }
        
    }
    /// Function to call on text, checks if the function has a valid format for Swedish social security number.
    /// - Parameter swedishSocialSecurityNumber: Swedish social security number as String.
    /// - Returns: **true** if string contains right format for the Swedish social security number, else **false**.
    func checkFormatOfSwedishSocialSecurityNumber(_ swedishSocialSecurityNumber: String, withFormat format: FormatTypeOfSwedishSocialSecurityNumber) -> Bool {
        let swedishSocialSecurityNumberHasValue = !swedishSocialSecurityNumber.isEmpty // for better readability the negation stores in a let-konstant.
        
        guard swedishSocialSecurityNumberHasValue else { // If this fails the rest will not be executed.
            print("There is no value to check.")
            
            return false
        }
        
        var formatCheckResult = false // Tracks the result of the function.
        
        switch format { // switches the code and changes the value of the tracking-variable.
            
        case .twelveDigitsWithHyphen:
            if swedishSocialSecurityNumber.contains(regEx0) {
                print("Swedish social security number: \(true)")
                formatCheckResult = true
                
                return formatCheckResult
            }
        case .tenDigitsWithHyphen:
            if swedishSocialSecurityNumber.contains(regEx1) {
                formatCheckResult = true
                
                return formatCheckResult
            }
        case .twelveDigits:
            if swedishSocialSecurityNumber.contains(regEx0_1) {
                print("Swedish social security number: \(true)")
                formatCheckResult = true
                
                return formatCheckResult
            }
        case .tenDigits:
            if swedishSocialSecurityNumber.contains(regEx1_1) {
                print("Swedish social security number: \(true)")
                formatCheckResult = true
                
                return formatCheckResult
            }
            
        }
        // Global returning of the tracking variable.
        return formatCheckResult
    }
}
