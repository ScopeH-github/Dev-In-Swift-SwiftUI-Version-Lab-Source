import SwiftUI

struct ContentView: View {
    @State var isLightOn = true
    var body: some View {
        ZStack {
            LightView(isLightOn: $isLightOn)
                .edgesIgnoringSafeArea(.all)
            LightButton(isLightOn: $isLightOn)
        }
    }
}

struct LightButton: View {
    @Binding var isLightOn: Bool
    var body: some View {
        Button(action: toggleLight) {
            Text(isLightOn ? "On" : "Off")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    func toggleLight() {
        isLightOn.toggle()
    }
}

struct LightView: View {
    @Binding var isLightOn: Bool
    var body: some View {
        isLightOn ? Color.white : Color.black
    }
}
