import SwiftUI

struct ContentView: View {
    @State var lightOn = true
    var body: some View {
        ZStack() {
            lightView(lightOn: $lightOn)
                .edgesIgnoringSafeArea(.all)
            if lightOn {
                lightButton(text: "Off") { toggleLight() }
            } else {
                lightButton(text: "On") { toggleLight() }
            }
        }
    }
    
    func toggleLight() {
        lightOn.toggle()
    }
}

struct lightView: View {
    @Binding var lightOn: Bool
    var body: some View {
        lightOn ? Color.white : Color.black
    }
}

struct lightButton: View {
    @State var text: String
    @State var act: () -> ()
    var body: some View {
        Button(action: act) {
            Text(text)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
        }
    }
}
