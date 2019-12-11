import UIKit
import Darwin
import Foundation

enum ScientificFunctions: String{
    case square = "x2"
    case cube = "x3"
    case raiseXToY = "xy"
    case raiseEToX = "ex"
    case raise10ToX = "10x"
    case xInto1 = "1/x"
    case squareRoot = "2sqrtx"
    case cubeRoot = "3sqrtx"
    case yRootOfX = "yrootx"
    case naturalLog = "ln"
    case log10 = "log10"
    case xFactorial = "x!"
    case sin = "sin"
    case cos = "cos"
    case tan = "tan"
    case e = "e"
    case EE = "EE"
    case sinh = "sinh"
    case cosh = "cosh"
    case tanh = "tanh"
    case pi = "pie"
    case Rand = "rand"
    case YofX = "y^x"
    case _2x = "2x"
    case logy = "logy"
    case log2 = "log2"
    case arcSin = "arcSin"
    case arcCos = "arcCos"
    case arcTan = "arcTan"
    case arcSinh = "arcSinh"
    case arcCosh = "arcCosh"
    case arcTanh = "arcTanh"
    
    var function: Function? {
    switch self{
    case .square:
        return Function(name: self, needsY: false)
    case .cube:
        return Function(name: self, needsY: false)
    case .raise10ToX:
        return Function(name: self, needsY: false)
    case .raiseXToY:
        return Function(name: self, needsY: true)
    case .raiseEToX:
        return Function(name: self, needsY: true)
    case .xInto1:
        return Function(name: self, needsY: false)
    case .squareRoot:
        return Function(name: self, needsY: false)
    case .cubeRoot:
        return Function(name: self, needsY: false)
    case .naturalLog:
        return Function(name: self, needsY: false)
    case .log10:
        return Function(name: self, needsY: false)
    case .xFactorial:
        return Function(name: self, needsY: false)
    case .sin:
        return Function(name: self, needsY: false)
    case .cos:
        return Function(name: self, needsY: false)
    case .tan:
        return Function(name: self, needsY: false)
    case .EE:
        return Function(name: self, needsY: false)
    case .sinh:
        return Function(name: self, needsY: false)
    case .cosh:
        return Function(name: self, needsY: false)
    case .tanh:
        return Function(name: self, needsY: false)
    case ._2x:
        return Function(name: self, needsY: false)
    case .log2:
        return Function(name: self, needsY: false)
    case .arcSin:
        return Function(name: self, needsY: false)
    case .arcCos:
        return Function(name: self, needsY: false)
    case .arcTan:
        return Function(name: self, needsY: false)
    case .arcSinh:
        return Function(name: self, needsY: false)
    case .arcCosh:
        return Function(name: self, needsY: false)
    case .arcTanh:
        return Function(name: self, needsY: false)
    case .yRootOfX:
        return Function(name: self, needsY: true)
    case .logy:
        return Function(name: self, needsY: true)
    default:
        return nil
    }
    }
}
//do something with me, maybe
class TrigonomicFunctions{
    
}
struct Function{
    var name: ScientificFunctions
    var evaluatedFunctionTotal: Double? = nil
    var needsY: Bool
    var x: Double? = nil
    var y: Double? = nil
    var preview: Bool = true
    func evaluate(_ x: Double, _ y: Double, _ function: ScientificFunctions)->Double?{
        //Closures
        let degreesToRadians: (Double) -> Double? = { (degrees) in  //gotta figure out the best place to put this, use if degree are on
            return degrees * Double.pi / 180
        }
        let logy: (Double, Double) -> (Double?) = { (x, base) in
            return (log(x) / log(base)); //y is the base
        }
        let factorial: (Double) -> (Double?) = { (x) in
            //avoid fractions
            let isInteger: Bool = floor(x) == x
            guard isInteger else { return nil }
            
            var total: Int = 1
            for n in 1...Int(x){
                total *= n
            }
            return (Double(total))
        }
        //return evaluated function
        switch function.self{
        case .square:
            return pow(x, 2)
        case .cube:
            return pow(x, 3)
        case .raiseXToY:
            return pow(x, y)
        case .raiseEToX:
            return pow(x, Darwin.M_E)
        case .raise10ToX:
            return pow(x, 10)
        case .xInto1:
            return 1 / x
        case .squareRoot:
            return sqrt(x)
        case .cubeRoot:
            return cbrt(x)
        case .yRootOfX:
            return pow(y, (1/x))
        case .naturalLog:
            return log(x)
        case .log10:
            return log10(x)
        case .xFactorial:
            return factorial(x)
        case .sin:
            return sin(x)
        case .cos:
            return cos(x)
        case .tan:
            return tan(x)
        case .e:
            return Darwin.M_E
        case .EE:
            return pow(x, 10) * x
        case .sinh:
            return sinh(x)
        case .cosh:
            return cosh(x)
        case .tanh:
            return tanh(x)
        case .pi:
            return Double.pi
        case .Rand:
            return Double.random(in: 0..<1)
        case .YofX:
            return pow(y,x)
        case ._2x:
            return pow(2, x)
        case .logy:
            return logy(x,y)
        case .log2:
            return log2(x)
        case .arcSin:
            return asin(x)
        case .arcCos:
            return acos(x)
        case .arcTan:
            return atan(x)
        case .arcSinh:
            return asinh(x)
        case .arcCosh:
            return acosh(x)
        case .arcTanh:
            return atanh(x)
        }
    }
}
