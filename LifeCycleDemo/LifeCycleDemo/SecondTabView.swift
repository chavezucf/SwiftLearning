//
//  SecondTabView.swift
//  LifeCycleDemo
//
//  Created by Miguel Chavez on 6/24/23.
//

import SwiftUI

struct SecondTabView: View {
    @State private var text: String = ""
    var body: some View {
        TextEditor(text: $text)
        .padding()
        .onChange(of: text, perform: {
            value in print("onChange triggered")
            
        })
    }
}


struct SecondTabView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTabView()
    }
}
