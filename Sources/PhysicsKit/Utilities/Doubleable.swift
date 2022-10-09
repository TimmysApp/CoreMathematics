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

public extension Doubleable {
    func root(_ order: Doubleable) -> Double {
        return self.double < 0 && abs(order.double.truncatingRemainder(dividingBy: 2)) == 1 ? -pow(-self.double, 1/order.double): pow(self.double, 1/order.double)
    }
    func division(withPrecision error: Double = 1.0E-7) -> Fraction {
        var x = double
        var a = x.rounded(.down)
        var (h1, k1, top, bottom) = (1, 0, Int(a), 1)
        while x - a > error * Double(bottom) * Double(bottom) {
            x = 1.0/(x - a)
            a = x.rounded(.down)
            (h1, k1, top, bottom) = (top, bottom, h1 + Int(a) * top, k1 + Int(a) * bottom)
        }
        return Fraction(top: top, bottom: bottom)
    }
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
