import SwiftUI

let qwerty = [
    ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
    ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
    ["Z", "X", "C", "V", "B", "N", "M"]
]

public var totalWins = 0 {
    didSet {
        newRound()
    }
}
public var totalLoses = 0 {
    didSet {
        newRound()
    }
}

public var buttonDisable = false

struct ContentView: View {
    @State var lives = currentGame.remainedChances
    @State var score: String = "Wins : \(totalWins), Loses: \(totalLoses)" {
        didSet {
            guessedWord = updateGuessedWord()
            lives = currentGame.remainedChances
        }
    }
    @State var guessedWord = updateGuessedWord()
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
                                if !currentGame.guessedLetters.contains(Character(item.lowercased())) {
                                    lives = letterButtonPressed(item)
                                    guessedWord = updateGuessedWord()
                                    score = "Wins : \(updatedGameState().0), Loses: \(updatedGameState().1)"
                                }
                            }) {
                                Text(item)
                                    .font(.title2)
                                    .foregroundColor(
                                        currentGame.guessedLetters.contains(Character(item.lowercased())) ? .secondary : .accentColor
                                    )
                            }.frame(width: 40, height: 40)
                                .padding()
                                .disabled(buttonDisable)
                        }
                    }
                }
            }
            
            //word Label
            Text(guessedWord)
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
