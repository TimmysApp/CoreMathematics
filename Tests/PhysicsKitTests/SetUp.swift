//
//  File.swift
//  
//
//  Created by Joe Maghzal on 10/9/22.
//

import Foundation
@testable import PhysicsKit

struct Basic: Variable {
    var name: String
    var multiplier: Multiplier?
}


let x = Basic(name: "X")
let y = Basic(name: "Y")