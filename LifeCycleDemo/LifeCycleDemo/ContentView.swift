//
//  ContentView.swift
//  LifeCycleDemo
//
//  Created by Miguel Chavez on 6/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TabView {
                FirstTabView()
                .tabItem {
                    Image(systemName: "01.circle")
                    Text("First")
                }
                SecondTabView()
                .tabItem {
                    Image(systemName: "02.circle")
                    Text("Second")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
