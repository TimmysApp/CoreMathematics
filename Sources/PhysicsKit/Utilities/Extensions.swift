//
//  File.swift
//  
//
//  Created by Joe Maghzal on 10/9/22.
//

import Foundation

extension Int: Variable, Doubleable {
    public var name: String {
        get {
            return "Int"
        }
    }
    public var multiplier: Multiplier? {
        get {
           nil
        }
        set {
        }
    }
    public var double: Double {
        Double(self)
    }
}

extension Double: Variable, Doubleable {
    public var name: String {
        get {
            return "Double"
        }
    }
    public var multiplier: Multiplier? {
        get {
           nil
        }
        set {
        }
    }
    public var double: Double {
        self
    }
}
