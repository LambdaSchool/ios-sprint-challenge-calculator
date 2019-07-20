//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

//class DepartureBoard {
//    var departureFlights: String
//    var currentAirport: String
//    private (set) var flights: [JFKAirports]
//
//    init(departureFlights: String, currentAirport: String) {
//        self.departureFlights = departureFlights
//        self.currentAirport = currentAirport
//        self.flights = []
//
//    }
//
//    func alertPassengers() {
//        for flight in flights {
//            if flight.terminal == nil {
//                "TBD"
//            } else {
//                switch flight.flightStatus {
//                case .canceled:
//                    print("We're sorry your flight to \(flight.destination) was canceled, here is a $500 voucher")
//                case .boarding:
//                    print("Your flight is boarding, please head to terminal: \(flight.terminal!) immediately. The doors are closing soon.")
//                case .scheduled:
//                    print("Your flight to \(flight.destination) is scheduled to depart at \(flight.departureTime!) from terminal: \(flight.terminal!)")
//                case .delayed:
//                    print("Im sorry your flight was delayed")
//                case .enRoute:
//                    print("Your flight is En Route, YAY!")
//                }
//            }
//        }
//    }
//
//
//    func add(flight: JFKAirports) {
//        flights.append(flight)
//    }
//}
//


import Foundation

enum OperatorType: String {
    case addition = "+"
    case subtraction = "-"
    case multiplaction = "*"
    case division = "/"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    init(operand1String: String, operand2String: String, operatorType: String) {
        self.operand1String = operand1String
        self.operand2String = operand2String
        self.operatorType = OperatorType(rawValue: operatorType)
    }
    func addOperandDigit(_ digit: String) -> String {
        for 
       
        
        
        
        CalculatorBrain(operand1String: "", operand2String: "", operatorType: "\(OperatorType.self)")
    }
    
    func setOperator(_ operatorString: String) {
        
    }
    
    func calculateIfPossible() -> String? {
       
    }
}
