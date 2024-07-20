//
//  Unit.swift
//  UnitConversion
//
//  Created by Elena Kholodilina on 7/19/24.
//

import Foundation

enum Unit: String, CaseIterable {
    case temperature, length, time
    
    var value: [Dimension] {
        switch self {
        case .length:
            return [
                UnitLength.feet,
                UnitLength.kilometers,
                UnitLength.meters,
                UnitLength.yards
            ]
        case .temperature:
            return [
                UnitTemperature.fahrenheit,
                UnitTemperature.celsius,
                UnitTemperature.kelvin
            ]
        case .time:
            return [
                UnitDuration.hours,
                UnitDuration.minutes,
                UnitDuration.seconds
            ]
        }
    }
}
