//
//  File.swift
//  
//
//  Created by Joe Maghzal on 11/18/22.
//

import Foundation

public struct Basic: Variable {
    public var name: String
    public var value: Double?
}

public let x = Basic(name: "X")
public let y = Basic(name: "Y")
public let z = Basic(name: "Z")
