import SwiftUI

struct ContentView: View {
    @State var lightOn = true
    var body: some View {
        ZStack() {
            LightView(lightOn: $lightOn)
                .edgesIgnoringSafeArea(.all)
            if lightOn {
                LightButton(text: "Off") { toggleLight() }
            } else {
                LightButton(text: "On") { toggleLight() }
            }
        }
    }
    
    func toggleLight() {
        lightOn.toggle()
    }
}

struct LightView: View {
    @Binding var lightOn: Bool
    var body: some View {
        lightOn ? Color.white : Color.black
    }
}

struct LightButton: View {
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
