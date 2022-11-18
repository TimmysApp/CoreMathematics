//
//  File.swift
//  
//
//  Created by Joe Maghzal on 10/9/22.
//

import Foundation

extension Int: Variable, Doubleable {
    public var double: Double {
        Double(self)
    }
}

extension Double: Variable, Doubleable {
    public var double: Double {
        self
    }
}
