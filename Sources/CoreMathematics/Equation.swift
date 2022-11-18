//
//  File.swift
//  
//
//  Created by Joe Maghzal on 10/9/22.
//

import Foundation

public struct Equation<Left: Variable, Right: Variable> {
//MARK: - Properties
    internal var left: Left
    internal var right: Right
    var function: Function {
        return left - right
    }
//MARK: - Initializer
    public init(left: Left, right: Right) {
        self.left = left
        self.right = right
    }
//MARK: - Functions
    public func solve() -> [Double] {
        if let polynomial = function.polynomial {
            return polynomial.root
        }
        return []
    }
    internal func secant() {
        
    }
}
