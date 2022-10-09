//
//  File.swift
//  
//
//  Created by Joe Maghzal on 10/9/22.
//

import Foundation

public extension Variable {
    static func +(left: Self, right: Variable) -> Function {
        var components = [Variable]()
        if let function = left as? Function {
            components.append(contentsOf: function.components)
        }
        if let function = right as? Function {
            components.append(contentsOf: function.components)
        }
        if components.isEmpty {
            components = [left, right]
        }
        return Function(components: components)
    }
    static prefix func -(varibale: Self) -> Function {
        return Function(components: [Multiplication(left: -1, right: varibale)])
    }
    static func -(left: Self, right: Variable) -> Function {
        var components = [Variable]()
        if let function = left as? Function {
            components.append(contentsOf: function.components)
        }
        if let function = right as? Function {
            components.append(contentsOf: function.components.map({Multiplication(left: -1, right: $0)}))
        }
        if components.isEmpty {
            components = [left, Multiplication(left: -1, right: right)]
        }
        return Function(components: components)
    }
    static func *(left: Self, right: Variable) -> Function {
        return Function(components: [Multiplication(left: left, right: right)])
    }
    static func /(left: Self, right: Variable) -> Function {
        return Function(components: [Division(top: left, bottom: right)])
    }
    static func ^(left: Self, right: Variable) -> Variable {
        return Power(root: left, power: right)
    }
}
