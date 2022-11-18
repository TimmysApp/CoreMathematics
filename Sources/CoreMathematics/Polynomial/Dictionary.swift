//
//  File.swift
//  
//
//  Created by Joe Maghzal on 11/18/22.
//

import Foundation

internal extension Dictionary where Key == Int, Value == Double {
    var order: Int {
        return keys.max() ?? 0
    }
    subscript(order order: Int) -> Double {
        return self[order] ?? 0
    }
}
