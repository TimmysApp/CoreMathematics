//
//  File.swift
//  
//
//  Created by Joe Maghzal on 10/9/22.
//

import Foundation

struct Equation {
    var left: Function
    var right: Function
    func solve() -> Double {
        let function = left - right
        return secant(b1: 2, a1: 0.02, function: function)
    }
}

func secant(b1: Double, a1: Double, function: Function) -> Double {
    var i = 0
    var b = b1
    var a = a1
    var value = 0.0
    var error = 1.0
    while error > 0.01 {
        let top = function.computing(with: (x, b))! * function.computing(with: (x, b - a))!
        let bottom = function.computing(with: (x, b))! - function.computing(with: (x, a))!
        value = b - (top/bottom)
        error = abs((value - b)/value)
        a = b
        b = value
    }
    return value
}

let x = Basic(name: "X")
let y = Basic(name: "Y")

struct Basic: Variable {
    var name: String
    var value: Double?
}
