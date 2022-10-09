import Foundation

public protocol Variable {
    var name: String {get}
    var multiplier: Multiplier? {get set}
}

public extension Variable {
    func with(multiplier: Multiplier) -> Variable {
        if multiplier.multiply {
            let multiplierValue = (multiplier.variable as? Double) ?? Double(multiplier.variable as? Int ?? 1)
            if let double = self as? Doubleable {
                return double.double * multiplierValue
            }
        }
        var new = self
        if let oldMultiplier = new.multiplier {
            new.multiplier = multiplier.with(multiplier: oldMultiplier)
        }else {
            new.multiplier = multiplier
        }
        return new
    }
    func rawValue(with substitutions: [(Variable, Double)]) -> Double? {
        if let int = self as? Int {
            return Double(int)
        }else if let double = self as? Double {
            return double
        }else if let equation = self as? Equation {
            let equationValue = equation.evaluating(with: substitutions)
            if let equationMultiplier = equation.multiplier, let equationValue {
                let toEvaluate = equationMultiplier.multiply ? (equationValue * equationMultiplier.variable): (equationValue / equationMultiplier.variable)
                return toEvaluate.evaluating(with: substitutions)
            }
            return equationValue
        }else {
            return nil
        }
    }
}

public enum Multiplier {
    case division(Variable, Bool)
    case multiplication(Variable)
    public var variable: Variable {
        switch self {
            case .division(let variable, _):
                return variable
            case .multiplication(let variable):
                return variable
        }
    }
    public var multiply: Bool {
        switch self {
            case .division:
                return false
            case .multiplication:
                return true
        }
    }
    public var isInverted: Bool {
        switch self {
            case .division(_, let inverted):
                return inverted
            case .multiplication:
                return false
        }
    }
    public func with(multiplier: Multiplier) -> Multiplier {
        switch self {
            case .division(let variable, let inverted):
                return .division(variable.with(multiplier: multiplier), inverted)
            case .multiplication(let variable):
                return .multiplication(variable.with(multiplier: multiplier))
        }
    }
}
