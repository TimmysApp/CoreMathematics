//
//  File.swift
//  
//
//  Created by Joe Maghzal on 11/18/22.
//

import Foundation

extension Variable {
    var polynomial: Polynomial? {
        if let multiplication = self as? Multiplication {
            guard let leftValue = multiplication.left.polynomial?.coefficients, let rightValue = multiplication.right.polynomial?.coefficients else {
                return nil
            }
            var temp: [Int: Double] = [:]
            leftValue.forEach { element in
                for i in 0..<rightValue.count {
                    let key = rightValue.keys.map({Int($0)})[i]
                    let newOrder = element.key + key
                    let newCoefficient: Double = element.value * (rightValue[key] ?? 1)
                    temp[newOrder] = newCoefficient + (temp[newOrder] ?? 0)
                }
            }
            return Polynomial(coefficients: temp)
        }else if let division = self as? Division {
            return division.top.polynomial
        }else if let power = self as? Power {
            if let order = power.power as? Int {
                var lastElement = Multiplication(left: power.root, right: power.root)
                for _ in 2..<order {
                    lastElement = Multiplication(left: lastElement, right: power.root)
                }
                return lastElement.polynomial
            }
        }else if let absoluteValue = self as? AbsoluteValue {
        }else if let function = self as? Function {
            var temp: [Int: Double] = [:]
            function.components.forEach { component in
                let computed = component.polynomial?.coefficients ?? [:]
                for i in 0..<computed.count {
                    let key = computed.keys.map({Int($0)})[i]
                    if let exist = temp[key] {
                        temp[key] = exist + (computed[key] ?? 0)
                    }else {
                        temp[key] = computed[key]
                    }
                }
            }
            return Polynomial(coefficients: temp)
        }else if let doubleable = self as? Doubleable {
            return Polynomial(coefficients: [0: doubleable.double])
        }
        return Polynomial(coefficients: [1: 1])
    }
}
