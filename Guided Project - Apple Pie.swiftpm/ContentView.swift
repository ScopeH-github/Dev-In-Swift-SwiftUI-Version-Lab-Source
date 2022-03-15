import SwiftUI

public var totalWins = 0
public var totalLoses = 0

let qwerty = [
    ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
    ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
    ["Z", "X", "C", "V", "B", "N", "M"]
]

struct ContentView: View {
    @State var lives = currentGame.remainedChances
    @State var score: String = "Wins : \(totalWins), Loses: \(totalLoses)"
    var body: some View {
        VStack {
            Image(pdf: #fileLiteral(resourceName: "Tree \(lives).pdf"))!
                .resizable()
                .scaledToFit()
            VStack {
                ForEach(qwerty, id: \.self) { row in 
                    HStack {
                        ForEach(row, id: \.self) { item in 
                            Button(action: {
                                print(item)
                            }) {
                                Text(item)
                                    .font(.title2)
                            }.frame(width: 40, height: 40)
                                .padding()
                        }
                    }
                }
            }
            
            //word Label
            Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .foregroundColor(.primary)
            
            //score Label
            Text(score)
                .font(.title2)
                .foregroundColor(.primary)
                .padding(.bottom)
        }
    }
}
