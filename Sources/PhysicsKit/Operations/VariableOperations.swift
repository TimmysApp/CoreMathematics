//
//  File.swift
//  
//
//  Created by Joe Maghzal on 10/9/22.
//

import Foundation

public extension Variable {
    static func +(left: Self, right: Variable) -> Equation {
        return Equation(components: [left, right])
    }
    static func -(left: Self, right: Variable) -> Equation {
        return Equation(components: [left, right.with(multiplier: .multiplication(-1))])
    }
    static prefix func -(varibale: Self) -> Variable {
        return varibale.with(multiplier: .multiplication(-1))
    }
    static func *(left: Self, right: Variable) -> Equation {
        if (right is Double) || (right is Int) {
            return Equation(components: [left.with(multiplier: .multiplication(right))])
        }
        return Equation(components: [right.with(multiplier: .multiplication(left))])
    }
    static func /(left: Self, right: Variable) -> Equation {
        if (left is Double) || (left is Int) {
            return Equation(components: [right.with(multiplier: .division(left, true))])
        }
        return Equation(components: [left.with(multiplier: .division(right, false))])
    }
    static func ^(left: Self, right: Equation) -> Variable {
        return Power(value: left, power: right)
    }
}

extension Equation {
    static func ^(left: Self, right: Equation) -> Equation {
        return Equation(components: [Power(value: left, power: right)])
    }
}

struct Power<T: Variable>: Variable {
    var name = "Power"
    var multiplier: Multiplier?
    var value: T
    var power: Equation
    func compute(with substitutions: [(Variable, Double)]) {
        guard let powerValue = power.evaluating(with: substitutions), let variableValue = substitutions.first(where: {$0.0.name == value.name}) else {
            return
        }
        
    }
}

struct Multiplication: Variable {
    var name = "Multiplication"
    var left: Variable
    var right: Variable
}

struct Division: Variable {
    var name = "Division"
    var top: Variable
    var bottom: Variable
}
