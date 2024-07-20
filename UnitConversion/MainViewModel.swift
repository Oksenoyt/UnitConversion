//
//  MainViewModel.swift
//  UnitConversion
//
//  Created by Elena Kholodilina on 7/19/24.
//

import Foundation

@Observable
final class MainViewModel {
    let formatter: MeasurementFormatter
    var value: Double?
    var typeOfUnit: Unit = .temperature
    var inputUnit: Dimension = UnitLength.meters
    var outputUnit: Dimension = UnitLength.kilometers
    
    var result: String {
        if let value {
            let imputMeasurement = Measurement(value: value, unit: inputUnit)
            let outputMeasurement = imputMeasurement.converted(to: outputUnit)
            return formatter.string(from: outputMeasurement)
        }
        return ""
    }
    
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
}
