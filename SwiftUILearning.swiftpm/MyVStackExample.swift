import SwiftUI

struct MyVStackExample: View {
    var body: some View {
        VStack{
            Image(systemName: "goforward.10")
            Image(systemName: "goforward.15")
            Image(systemName: "goforward.30")
            MyVStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
        }
    }
}


struct MyVStack<Content: View>:View {
    let content:() -> Content
    init(@ViewBuilder content: @escaping() -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10){
            content()
        }
        .font(.largeTitle)
    }
}
