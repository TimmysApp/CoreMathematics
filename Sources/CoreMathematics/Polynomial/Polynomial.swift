//
//  File.swift
//  
//
//  Created by Joe Maghzal on 10/10/22.
//

import Foundation

public struct Polynomial {
//MARK: - Properties
    internal var coefficients: [Int: Double] = [:]
    public var order: Int {
        coefficients.order
    }
    public var root: [any Variable] {
        guard order > 0 else {return []}
        if order == 1 {
            return [(-coefficients[order: 0])/coefficients[order: 1]]
        }else if order == 2 {
            let delta = pow(coefficients[order: 1], 2.0) - 4 * coefficients[order: 0] * coefficients[order: 2]
            if delta >= 0 {
                let root1 = (-coefficients[order: 1] - sqrt(delta)) / 2 * coefficients[order: 2]
                let root2 = (-coefficients[order: 1] + sqrt(delta)) / 2 * coefficients[order: 2]
                return [root1, root2]
            }else {
                let root1 = (-coefficients[order: 1] - (sqrt(abs(delta)) * i)) / 2 * coefficients[order: 2]
                let root2 = (-coefficients[order: 1] + (sqrt(abs(delta)) * i)) / 2 * coefficients[order: 2]
                return [root1, root2]
            }
        }
        return []
    }
    internal func secant() -> [any Variable] {
        return []
    }
}
