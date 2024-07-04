//
//  ContentView.swift
//  UnitConversion
//
//  Created by Elena Kholodilina on 7/3/24.
//

import SwiftUI

enum Unit: String, CaseIterable {
    case temperature = "Temperature", length = "Length", time = "Time"
}

enum TemperatureUnits: String, CaseIterable {
    case meters = "Meters", kilometers = "Kilometers", miles = "Miles"
    case yards = "Yards"
}

enum TimeUnits: String, CaseIterable {
    case meters = "Meters", kilometers = "Kilometers", miles = "Miles"
    case yards = "Yards"
}

struct ContentView: View {
    @State private var value: Double?
    @State private var typeOfUnit: Unit = .temperature
    private var result: String {
        if let value {
            let imputMeasurement = Measurement(value: value, unit: inputUnit)
            let outputMeasurement = imputMeasurement.converted(to: outputUnit)
            return formatter.string(from: outputMeasurement)
        }
        return ""
    }
    
    @State private var inputUnit: UnitLength = .meters
    @State private var outputUnit: UnitLength = .kilometers
    
    @FocusState private var focus: Bool
    
    let length: [UnitLength] = [.feet, .kilometers, .meters, .yards]
    let temperature: [UnitTemperature] = [.fahrenheit, .celsius, .kelvin]
    let time: [UnitTemperature] = []
    let formatter: MeasurementFormatter
    
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Unit Conversion")
                    .font(.title.bold())
                    .padding(.bottom)
                Picker("Units", selection: $typeOfUnit) {
                    ForEach(Unit.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                HStack {
                    Text("From:")
                        .fontWeight(.bold)
                    Picker("From:", selection: $inputUnit) {
                        ForEach(length, id: \.self) {
                            Text(formatter.string(from: $0))
                        }
                    }
                    .accentColor(.accent)
                    Spacer()
                }
                HStack {
                    Text("To:")
                        .fontWeight(.bold)
                    Picker("To:", selection: $outputUnit) {
                        ForEach(length, id: \.self) {
                            Text(formatter.string(from: $0))
                        }
                    }
                    .accentColor(.accent)
                    Spacer()
                }
                TextField("Enter value", value: $value, format: .number)
                    .padding()
                    .overlay() {
                        RoundedRectangle(cornerRadius: 7).stroke(lineWidth: 1)
                    }
                    .keyboardType(.decimalPad)
                    .focused($focus)
                HStack {
                    Text("Result:")
                        .fontWeight(.bold)
                        .padding(.trailing)
                    Text(result)
                    Spacer()
                }
                Spacer()
            }
            .padding()
            .toolbar {
                if focus {
                    Button {
                        focus = false
                    } label: {
                        Text("Done")
                    }
                }
            }
            .foregroundColor(.main)
        }
    }
}

#Preview {
    ContentView()
}
