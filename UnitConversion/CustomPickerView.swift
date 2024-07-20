//
//  CustomPickerView.swift
//  UnitConversion
//
//  Created by Elena Kholodilina on 7/19/24.
//

import SwiftUI

struct CustomPickerView: View {
    let title: String
    let formatter: MeasurementFormatter
    
    @Binding var typeOfUnit: Unit
    @Binding var selectedUnit: Dimension
    
    var body: some View {
        HStack {
            Text("From:")
                .fontWeight(.bold)
            Picker(title, selection: $selectedUnit) {
                ForEach(typeOfUnit.value, id: \.self) {
                    Text(formatter.string(from: $0).capitalized)
                }
            }
            .accentColor(.accent)
            Spacer()
        }
    }
}

#Preview {
    CustomPickerView(
        title: "From",
        formatter: MeasurementFormatter(),
        typeOfUnit: .constant(.length),
        selectedUnit: .constant(UnitLength.centimeters)
    )
    .padding()
}
