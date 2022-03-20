import SwiftUI
import Foundation

public struct Game {
    var word: String
    var remainedChances: Int
    var guessedLetters: [Character]
    
    var formattedWord: String {
        var guessWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessWord += "\(letter)"
            } else {
                guessWord += "_"
            }
        }
        return guessWord
    }
    
    mutating func playerGuessed(letter: Character) -> Int {
        guessedLetters.append(letter)
        if !word.contains(letter) && remainedChances > 0 {
            remainedChances -= 1
        }
        return remainedChances
    }
}

public func newRound() {
    if !listOfWords.isEmpty {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, remainedChances: remainedLives, guessedLetters: [])
        buttonDisable = buttonEnable(true)
    } else {
        buttonDisable = buttonEnable(false)
    }
//  print(currentGame)
}

func buttonEnable(_ enable: Bool) -> Bool {
    !enable
}

public func letterButtonPressed(_ item: String) -> Int {
    let letter = Character(item.lowercased())
    return currentGame.playerGuessed(letter: letter)
}

public func updateGuessedWord() -> String {
    var letters = [String]()
    for letter in currentGame.formattedWord {
        letters.append(String(letter))
    }
    let wordWithSpacing = letters.joined(separator: " ")
    return wordWithSpacing
}
public func updatedGameState() -> (Int, Int) {
    if currentGame.remainedChances == 0 {
        totalLoses += 1
    } else if currentGame.word == currentGame.formattedWord {
        totalWins += 1
    }
    return (totalWins, totalLoses)
}
