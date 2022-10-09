//
//  File.swift
//  
//
//  Created by Joe Maghzal on 10/3/22.
//

import Foundation

public struct Equation: Variable {
    public var name = "Equation"
    public var value: Double?
    public var multiplier: Multiplier?
    public var components: [Variable]
}

//MARK: - Public Functions
public extension Equation {
    mutating func evaluate(with substitutions: (Variable, Double)...) {
        value = evaluating(with: substitutions)
    }
    mutating func evaluating(with substitutions: (Variable, Double)...) {
        value = evaluating(with: substitutions)
    }
}

//MARK: - Internal Functions
internal extension Equation {
    func evaluating(with substitutions: [(Variable, Double)]) -> Double? {
        var containsNil = false
        var i = 0
        var toReturn: Double = 0
        while !containsNil && i < components.count {
            let component = components[i]
            if let rawValue = component.rawValue(with: substitutions) {
                toReturn += rawValue
            }else {
                if let value = substitutions.first(where: {$0.0.name == component.name}) {
                    if let multiplier = component.multiplier {
                        if let rawValue = multiplier.variable.rawValue(with: substitutions) {
                            let divisionValue = multiplier.isInverted ? (rawValue/value.1): (value.1/rawValue)
                            toReturn += multiplier.multiply ? (value.1 * rawValue): divisionValue
                        }else if let sub = substitutions.first(where: {$0.0.name == multiplier.variable.name}) {
                            let divisionValue = multiplier.isInverted ? (sub.1/value.1): (value.1/sub.1)
                            toReturn += multiplier.multiply ? (value.1 * sub.1): divisionValue
                        }else {
                            containsNil = true
                        }
                    }else {
                        toReturn += value.1
                    }
                }else {
                    containsNil = true
                }
            }
            i += 1
        }
        if containsNil {
            return nil
        }else {
            if let multiplier, !multiplier.multiply {
                if let rawValue = multiplier.variable.rawValue(with: substitutions) {
                    let divisionValue = multiplier.isInverted ? (rawValue/toReturn): (toReturn/rawValue)
                    toReturn = multiplier.multiply ? (toReturn * rawValue): divisionValue
                }else if let sub = substitutions.first(where: {$0.0.name == multiplier.variable.name}) {
                    let divisionValue = multiplier.isInverted ? (sub.1/toReturn): (toReturn/sub.1)
                    toReturn = multiplier.multiply ? (toReturn * sub.1): divisionValue
                }else {
                    containsNil = true
                }
            }
            return toReturn
        }
    }
}
