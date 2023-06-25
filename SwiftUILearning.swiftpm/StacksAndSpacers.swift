//
//  StacksAndSpacers.swift
//  SwiftUILearning
//
//  Created by Miguel Chavez on 6/23/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct StacksAndSpacers: View {
    @State var myLayout: AnyLayout = AnyLayout(VStackLayout())
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Text("Financial Results")
                .font(.title)
            HStack(alignment: .top) {
                Text("Q1 Sales")
                    .font(.headline)
                Spacer()
                VStack(alignment: .leading) {
                    Text("January")
                    Text("February")
                    Text("March")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("$1000")
                    Text("$200")
                    Text("$3000")
                }
                .padding(5)
            }
            .padding(5)
            
        }
        .padding(5)
        
    }
}

struct StacksAndSpacers_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            StacksAndSpacers()
        } else {
            // Fallback on earlier versions
        }
    }
}
