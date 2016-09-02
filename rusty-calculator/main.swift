//
//  main.swift
//  rusty-calculator
//
//  Created by Flatiron School on 9/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


let input1: String = "2+3*2"
let input2: String = "2*3+2"
let input3: String = "2*4*3+9*3+5"
let input4: String = "2+"
let input5: String = "*3+2"
let input6: String = "24*3+5"



func rustyCalculator(input: String) -> String {
    
    // store output result here
    var output: String = ""
    
    // valid chars can be in equation
    let numbers: String = "0123456789"
    let operations: String = "+*"
    
    // counters to hold operations as "+" and "*"
    var counterForPluses: Int = 0
    var counterForMultipliers: Int = 0
    
    // check validity of input equation
    if input.characters.count % 2 == 0 {
        return "Wrong input: equation has to have at least two operands and operation sign!"
    }
    
    for (index, char) in input.characters.enumerate() {
        
        // check the validity of input based on valid chars
        if numbers.characters.contains(char) == false && operations.characters.contains(char) == false {
            return "There is not valid input: providing char \"\(char)\" is not valid!"
        }
        
        // work with first char in equation
        if index == 0 {
            if numbers.characters.contains(char) {
                output.append(char)
            } else {
                return "Equation has to begin from number, not operation!"
            }
        }
        
        // work with chars at odd positions in equation
        if index % 2 != 0 && index > 0 && operations.characters.contains(char) {
            if char == "*" {
                counterForMultipliers += 1
            } else if char == "+" {
                counterForPluses += 1
                if counterForMultipliers > 0 {
                    for _ in 0...counterForMultipliers - 1 {
                        output += "*"
                    }
                    counterForMultipliers = 0
                }
            } else {
                return "Wrong input: equation can not contain number with more then one digit! There is not an operation at position \(index), have to be a operation!"
            }
        }
            
            
        // work with chars at even positions in equation
        if index % 2 == 0 && index > 0 {
            if numbers.characters.contains(char) {
                output.append(char)
            } else {
                return "Wrong input: equation can not contain number with more then one digit! There is not a number at position \(index), have to be a number!"
            }
        }
    }
    
    if counterForMultipliers > 0 {
        for _ in 0...counterForMultipliers - 1 {
            output.appendContentsOf("*")
        }
    }
    
    for _ in 0...counterForPluses - 1 {
        output.appendContentsOf("+")
    }
    return output
    
}


print(rustyCalculator(input1))
// 232*+

print(rustyCalculator(input2))
// 23*2+

print(rustyCalculator(input3))
// 243**93*5++

print(rustyCalculator(input4))
// Wrong input: equation has to have at least two operands and operation sign!

print(rustyCalculator(input5))
// Equation has to begin from number, not operation!

print(rustyCalculator(input6))
// Wrong input: equation can not contain number with more then one digit! 
// There is not a number at position 2, have to be a number!
