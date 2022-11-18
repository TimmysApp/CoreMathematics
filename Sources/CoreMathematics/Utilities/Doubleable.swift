//
//  File.swift
//  
//
//  Created by Joe Maghzal on 10/9/22.
//

import Foundation

public protocol Doubleable: Variable {
    var double: Double {get}
}

extension Doubleable {
    public var name: String {
        get {
            return "Double"
        }
    }
    public var value: Double? {
        get {
           double
        }
        set {
        }
    }
}
