//
//  main.swift
//  rusty-calculator
//
//  Created by Flatiron School on 9/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


let input1: String = "21+3*2"
let input2: String = "2*4*3+9*3+5"



func rustyCalculator(input: String) -> String {
    
    // store output result here
    var output: String = ""
    
    // valid chars can be in equation
    let numbers: String = "012345679"
    let operations: String = "+*"
    
    // check validity of input equation
    if input.characters.count < 3 {
        print("Wrong input: equation has to have at least two operands and operation sign!")
    } else if operations.characters.contains(input.characters.first!) == true {
        print("Equation has to begin from number, not operation!")
    }
    
    for (index, char) in input.characters.enumerate() {
        
        
        
        // counters to hold operations as "+" and "*"
        var counterForPluses: Int = 0
        var counterForMultipliers: Int = 0
        
        // check the validity of input based on valid chars
        if numbers.characters.contains(char) == false && operations.characters.contains(char) == false {
            print("There is not valid input: providing char \"\(char)\" is not valid!")
        }
        
        // work with first char in equation
        if index == 0 && numbers.characters.contains(char) {
            output.append(char)
        }
        
        // work with chars at even positions in equation
        if index % 2 == 0 && operations.characters.contains(char) {
            if char == "*" {
                counterForMultipliers += 1
            } else if char == "+" {
                counterForPluses += 1
            }
        } else {
            print("Wrong input: equation and not contain number with more then onw digit!")
        }
            
            
        // work with chars at odd positions in equation
        if index % 2 != 0 && numbers.characters.contains(char) {
            if counterForMultipliers != 0 {
                
            }
        }
    
        
    }
    
    return output
    
}


print(rustyCalculator(input1))

