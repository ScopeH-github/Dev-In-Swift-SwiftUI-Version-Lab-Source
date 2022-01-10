import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear(perform: viewDidLoad)
    }
    
    func viewDidLoad( {
        var sample = "sample"
        print(sample)
        
        if false {
            print("will this line of code ever be reached?")
            someMetho()
        }
    }
    
    func someMethod() {
        
    }
}
