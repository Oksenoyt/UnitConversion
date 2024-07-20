//
//  ContentView.swift
//  UnitConversion
//
//  Created by Elena Kholodilina on 7/3/24.
//

import SwiftUI

struct MainView: View {
    @State private var viewModel = MainViewModel()
    @FocusState private var focus: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Unit Conversion")
                    .font(.title.bold())
                    .padding(.bottom)
                Picker("Units", selection: $viewModel.typeOfUnit) {
                    ForEach(Unit.allCases, id: \.self) {
                        Text($0.rawValue.capitalized)
                    }
                }
                .padding(.bottom)
                .pickerStyle(.segmented)
                CustomPickerView(
                    title: "From:",
                    formatter: viewModel.formatter,
                    typeOfUnit: $viewModel.typeOfUnit,
                    selectedUnit: $viewModel.inputUnit
                )
                CustomPickerView(
                    title: "To:",
                    formatter: viewModel.formatter,
                    typeOfUnit: $viewModel.typeOfUnit,
                    selectedUnit: $viewModel.outputUnit
                )
                TextField("Enter value", value: $viewModel.value, format: .number)
                    .padding()
                    .overlay() {
                        RoundedRectangle(cornerRadius: 7).stroke(lineWidth: 1)
                    }
                    .keyboardType(.decimalPad)
                    .focused($focus)
                    .toolbar {
                        if focus {
                            ToolbarItemGroup(placement: .keyboard) {
                                HStack {
                                    Spacer()
                                    Button {
                                        focus = false
                                    } label: {
                                        Text("Done")
                                    }
                                }
                            }
                        }
                    }
                HStack {
                    Text("Result:")
                        .fontWeight(.bold)
                        .padding(.trailing)
                    Text(viewModel.result)
                    Spacer()
                }
                .padding(.top)
                Spacer()
            }
            .padding()
            .foregroundColor(.main)
            .onChange(of: viewModel.typeOfUnit) {
                viewModel.inputUnit = viewModel.typeOfUnit.value[0]
                viewModel.outputUnit = viewModel.typeOfUnit.value[1]
            }
        }
    }
}

#Preview {
    MainView()
}
