//
//  FormControls.swift
//  SwiftUILearning
//
//  Created by Miguel Chavez on 6/24/23.
//

import SwiftUI


struct FormControls: View {
    @State private var isOn = true
    @State private var textFieldData = "This is a text field"
    var body: some View {
        Form {
            Section (header: SectionHeader (name: "Controls in a Form")) {
                Text ("This will give you an idea of how different controls are rendered in a Form.")
            }
        }
        Section {
            Button (action: {}) { Text ("Button") }
            Toggle(isOn: $isOn) { Text ("Toggle") }
            Stepper (onIncrement: {}, onDecrement: {}) { Text("Stepper") }
            TextField("", text: $textFieldData)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Image (systemName:"leaf.arrow.circlepath")
                .font(.title)
            Circle()
            Text("Notice shapes are centered a ")
            TextField("", text: $textFieldData)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
struct SectionHeader: View {
    var name: String
    var body: some View {
        Text (name)
            .font(.largeTitle)
            .foregroundColor (Color.gray)
    }
}


struct FormControls_Previews: PreviewProvider {
    static var previews: some View {
        FormControls()
    }
}



