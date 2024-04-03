//
//  ContentView.swift
//  UnitConverter
//
//  Created by Trevor Kimble on 2/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0
    @State private var timeUnitInput = "Second"
    @State private var timeUnitOutput = "Second"
    
    let timeUnits = ["Hour", "Minute", "Second"]
    
    var inputInSeconds = 0
    
    var output: Int {
        var inputInSeconds = 0
        
        if(timeUnitInput == "Hour")
        {
            inputInSeconds = input * 3600
        }
        else if(timeUnitInput == "Minute")
        {
            inputInSeconds = input * 60
        }
        else
        {
            inputInSeconds = input
        }
        
        
        
        if(timeUnitOutput == "Hour")
        {
            return inputInSeconds / 3600
        }
        else if(timeUnitOutput == "Minute")
        {
            return inputInSeconds / 60
        }
        else
        {
            return inputInSeconds
        }
    }

    var body: some View {
        Form{
            Section{
                Text("Number")
                TextField("Number input", value: $input, format: .number)
                    .keyboardType(.decimalPad)
                
                Picker("Time Unit", selection: $timeUnitInput){
                    ForEach(timeUnits, id: \.self){
                        Text($0)
                    }
                }
            }
            
            Section{
                Text("Output Time Unit")
                Picker("Time Unit", selection: $timeUnitOutput){
                    ForEach(timeUnits, id: \.self){
                        Text($0)
                    }
                }
            }
            
            Section{
               Text("Ouput: \(output)")
                
            }
        }
    }
}

#Preview {
    ContentView()
}
//struct ContentView: View
//{
//    @State private var checkAmount = 0.0
//    @State private var numberOfPeople = 2
//    @State private var tipPercentage = 20
//    @FocusState private var amountIsFocused: Bool
//    
//    let tipPercentages = [10, 15, 20, 25, 0]
//    
//    
//    
//    var totalPerPerson: Double{
//        let numPeople = Double(numberOfPeople + 2)
//        let tip = Double(tipPercentage)
//        
//        let tipValue = checkAmount / 100 * tip
//        let grandTotal = checkAmount + tipValue
//        let amountPerPerson = grandTotal / numPeople
//        
//        return amountPerPerson
//    }
//    
//    var body: some View
//    {
//        NavigationStack{
//            Form {
//                Section {
//                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//                        .keyboardType(.decimalPad)
//                        .focused($amountIsFocused)
//                    
//                    Picker("number of people", selection: $numberOfPeople){
//                        ForEach(2..<100){
//                            Text("\($0) people")
//                        }
//                    }
//                    .pickerStyle(.navigationLink)
//                    
//                }
//                
//                Section("Tip"){
//              
//                    Picker("Tip percentage", selection: $tipPercentage){
//                        ForEach(tipPercentages, id: \.self){
//                            Text($0, format: .percent)
//                        }
//                    }
//                    .pickerStyle(.segmented)
//                }
//                
//                Section("Amount per person") {
//                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//                }
//                
//                Section("Total") {
//                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//                }
//                
//                
//            }
//            .navigationTitle("Check Splitter")
//            .toolbar{
//                if amountIsFocused{
//                    Button("Done"){
//                        amountIsFocused = false
//                    }
//                }
//            }
//        }
//    }
//}
//
//
////struct ContentView: View {
////
////
////
////}
//
//#Preview {
//    ContentView()
//}
