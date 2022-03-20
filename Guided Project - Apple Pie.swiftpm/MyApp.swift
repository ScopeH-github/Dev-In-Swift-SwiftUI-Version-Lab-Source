import SwiftUI

let remainedLives = 7
public var currentGame = Game(word: String(), remainedChances: Int(), guessedLetters: [])
var listOfWords = ["apple", "macintosh", "swift", "scopeh", "eggman", "sonic", "tails", "amy", "knuckles", "iphone"]

@main
struct MyApp: App {
    init() {
        newRound()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    
    
}
