//
//  File.swift
//  
//
//  Created by Joe Maghzal on 10/9/22.
//

import Foundation

public struct Power: Variable {
    public var name = "Power"
    public var root: Variable
    public var power: Variable
    public var value: Double?
}

public struct Multiplication: Variable {
    public var name = "Multiplication"
    public var left: Variable
    public var right: Variable
    public var value: Double?
}

public struct Division: Variable {
    public var name = "Division"
    public var top: Variable
    public var bottom: Variable
    public var value: Double?
}

public struct AbsoluteValue: Variable {
    public var name = "AbsoluteValue"
    public var root: Variable
    public var value: Double?
}
