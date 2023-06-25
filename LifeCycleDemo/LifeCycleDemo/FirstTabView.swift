//
//  FirstTabView.swift
//  LifeCycleDemo
//
//  Created by Miguel Chavez on 6/24/23.
//

import SwiftUI

struct FirstTabView: View {
    @State var title = "View One"
    var body: some View {
        Text(title)
        .onAppear(perform: {
            print("onAppear triggered")
        })
        .onDisappear(perform: {
            print("onDisappeared triggered")
        })
        .task(priority: .background) {
            title = await changeTitle()
        }
    }
    func changeTitle() async -> String {
        sleep(5)
        return "Async task complete"
    }
}
struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView()
    }
}
