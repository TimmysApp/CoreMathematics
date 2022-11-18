//
//  File.swift
//  
//
//  Created by Joe Maghzal on 10/3/22.
//

import Foundation

public struct Function: Variable {
//MARK: - Properties
    public var name = "Function"
    public var components: [Variable]
    public var value: Double?
}

//MARK: - Internal Functions
internal extension Function {
    func value(with substituations: [(Variable, Double)]) -> Double? {
        var containsNil = false
        var i = 0
        var toReturn = 0.0
        while !containsNil && i < components.count {
            let component = components[i]
            if let evaluatedValue = component.evaluate(with: substituations) {
                toReturn += evaluatedValue
            }else {
                containsNil = true
            }
            i += 1
        }
        if containsNil {
            return nil
        }
        return toReturn
    }
}
