//
//  FirstExample.swift
//  SwiftUILearning
//
//  Created by Miguel Chavez on 6/24/23.
//

import SwiftUI

struct FirstExample: View {

    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black-0", "Red-1", "Green-2", "Blue-3"]
    @State private var colorIndex = 2
    @State private var rotation: Double = 0
    @State private var textTitle = "Welcome to SwiftUI"
    var body: some View {
        VStack{
            Spacer()
            Text(textTitle)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(colors[colorIndex])
                .rotationEffect(.degrees(rotation))
                .animation(.easeOut(duration: 5), value: rotation)
            Spacer()
            Divider()
            Slider(value: $rotation, in: 0...360)
                .padding()
            
            TextField("Enter title", text: $textTitle) .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach (0 ..< colornames.count, id:\.self) {
                    Text(colornames[$0])
                        .foregroundColor(colors[$0])
                }
            }
            .pickerStyle(.segmented)
            .padding()
            Spacer()
        }
    }
}

struct FirstExample_Previews: PreviewProvider {
    static var previews: some View {
        FirstExample()
    }
}
