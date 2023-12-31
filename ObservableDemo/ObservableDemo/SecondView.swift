//
//  SecondView.swift
//  ObservableDemo
//
//  Created by Miguel Chavez on 6/24/23.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var timerData: TimerData
    var body: some View {
        VStack {
            Text("Second View")
            .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
            .font(.headline)
        }
        .padding()
    }
}
struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView().environmentObject(TimerData())
    }
}
