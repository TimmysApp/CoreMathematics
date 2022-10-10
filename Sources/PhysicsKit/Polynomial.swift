//
//  File.swift
//  
//
//  Created by Joe Maghzal on 10/10/22.
//

import Foundation

struct Polynomial {
    var coefficients: [Int: Double] = [:]
}

extension Function {
    var polynomial: Polynomial? {
        var temp: [Int: Double] = [:]
        components.forEach { component in
            let computed = component.computeElement() ?? [:]
            let range = computed.count > 1 ? computed.count: (computed.count + 1)
            let initial = computed.count > 1 ? 0: 1
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
    }
}
extension Variable {
    func computeElement() -> [Int: Double]? {
        if let multiplication = self as? Multiplication {
            guard let leftValue = multiplication.left.computeElement(), let rightValue = multiplication.right.computeElement() else {
                return nil
            }
            var temp: [Int: Double] = [:]
            leftValue.forEach { element in
//                let range = rightValue.count > 1 ? rightValue.count: (rightValue.count + 1)
//                let initial =  rightValue.count > 1 ? 0: 1
                for i in 0..<rightValue.count {
                    let key = rightValue.keys.map({Int($0)})[i]
                    let newOrder = element.key + key
                    let newCoefficient: Double = element.value * (rightValue[key] ?? 1)
                    temp[newOrder] = newCoefficient + (temp[newOrder] ?? 0)
                }
            }
            return temp
        }else if let division = self as? Division {
            return division.top.computeElement()
        }else if let power = self as? Power {
            if let order = power.power as? Int {
                var lastElement = Multiplication(left: power.root, right: power.root)
                for _ in 1..<order {
                    lastElement = Multiplication(left: lastElement, right: power.root)
                }
                return lastElement.computeElement()
            }
        }else if let absoluteValue = self as? AbsoluteValue {
        }else if let function = self as? Function {
            return function.polynomial?.coefficients
        }else if let doubleable = self as? Doubleable {
            return [0: doubleable.double]
        }
        return [1: 1]
    }
}
