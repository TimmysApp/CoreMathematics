import Foundation

public protocol Variable {
    var name: String {get}
    var value: Double? {get set}
}

//MARK: - Public Functions
public extension Variable {
    mutating func compute(with substituations: (Variable, Double)...) {
        value = Function(components: [self]).value(with: substituations)
    }
    func computing(with substituations: (Variable, Double)...) -> Double? {
        return Function(components: [self]).value(with: substituations)
    }
    func evaluate(with substituations: [(Variable, Double)]) -> Double? {
        if let multiplication = self as? Multiplication {
            guard let leftValue = multiplication.left.evaluate(with: substituations), let rightValue = multiplication.right.evaluate(with: substituations) else {
                return nil
            }
            return leftValue * rightValue
        }else if let division = self as? Division {
            guard let topValue = division.top.evaluate(with: substituations), let bottomValue = division.bottom.evaluate(with: substituations) else {
                return nil
            }
            return topValue / bottomValue
        }else if let power = self as? Power {
            guard let rootValue = power.root.evaluate(with: substituations), let powerValue = power.power.evaluate(with: substituations) else {
                return nil
            }
            return pow(rootValue, powerValue)
        }else if let absoluteValue = self as? AbsoluteValue {
            guard let rootValue = absoluteValue.root.evaluate(with: substituations) else {
                return nil
            }
            return abs(rootValue)
        }else if let function = self as? Function {
            guard let functionValue = function.value(with: substituations) else {
                return nil
            }
            return functionValue
        }else if let doubleable = self as? Doubleable {
            return doubleable.double
        }
        guard let value = substituations.first(where: {$0.0.name == name})?.1 else {
            return nil
        }
        return value
    }
}
