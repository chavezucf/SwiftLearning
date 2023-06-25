//
//  StateProperties.swift
//  SwiftUILearning
//
//  Created by Miguel Chavez on 6/23/23.
//

import SwiftUI
import Combine

class DemoData : ObservableObject {
    @Published var userCount = 0
    @Published var currentUser = "Miguel"
    init() {
        // Code here to initialize data
        updateData()
    }
    func updateData() {
        // Code here to keep data up to date
    }
}

class SpeedSetting: ObservableObject {
    @Published var speed = 0.0
}

struct SpeedControlView: View {
    @EnvironmentObject var speedsetting: SpeedSetting
    
    var body: some View {
        Slider(value: $speedsetting.speed, in: 0...100)
    }
}

struct SpeedDisplayView: View {
    @EnvironmentObject var speedsetting: SpeedSetting
    var body: some View {
        Text("Speed = \(speedsetting.speed)")
    }
}


struct StateProperties: View {
    @State private var userName = "123"
    @State private var wifiEnabled = true
    @StateObject var demoData : DemoData = DemoData()
    let speedsetting = SpeedSetting()
    var body: some View {
        
        VStack() {
            SpeedControlView()
            SpeedDisplayView()
            Text("\(demoData.currentUser), you are user number \(demoData.userCount)")
            Toggle(isOn: $wifiEnabled) {
                Text("Enable Wi-Fi")
            }
            VStack() {
                TextField("Enter user name", text: $userName)
                Text(userName)
                WifiImageView(wifiEnabled: $wifiEnabled)
            }
        }
        .environmentObject(speedsetting)
        .padding(5)
    }
    
}
struct WifiImageView: View {
    @Binding var wifiEnabled: Bool
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
            .imageScale(.large)
    }
}


struct StateProperties_Previews: PreviewProvider {
    static var previews: some View {
        StateProperties()
    }
}
