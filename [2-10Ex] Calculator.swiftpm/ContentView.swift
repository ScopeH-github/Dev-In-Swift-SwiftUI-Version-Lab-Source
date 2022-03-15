import SwiftUI

enum CalcButtons: String {
    case clear="Clear", change="+/-", percent="%"
    case zero="0", one="1", two="2", three="3", four="4", five="5", six="6", seven="7", eight="8", nine="9", point="."
    case plus="+", minus="-", multiply="x", divide="÷", equal="="
    
    
    var buttonColor: Color {
        switch self {
        case .clear, .change, .percent:
            return .init(
                red: 0x2C/0xFF,
                green: 0x2C/0xFF,
                blue: 0x2C/0xFF
            )
        case .plus, .minus, .multiply, .divide, .equal:
            return .red
        default:
            return .gray
        }
    }
}

struct ContentView: View {
    @State var calcText = ""
    let buttons: [[CalcButtons]] = [
        [.clear, .change, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .point, .equal]
    ]
    var body: some View {
        GeometryReader { _ in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(calcText.isEmpty ? "0" : calcText)
                        .multilineTextAlignment(.trailing)
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
        .frame(height: 300)
        GeometryReader { screen in
            VStack(spacing: 1) {
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 1) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                addText(item, &calcText)
                            }) {
                                Text(item.rawValue)
                                    .font(.title3)
                                    .frame(
                                        width: buttonWidth(item, screen.size.width),
                                        height: buttonHeight(screen.size.width)
                                    )
                                    .foregroundColor(.black)
                            }
                            .background(item.buttonColor)
                        }
                    }
                }
            }
        }
    }
    
    func addText(_ item: CalcButtons, _ text: inout String) {
        switch item {
            case .zero, .point, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
                text += item.rawValue
            case .clear:
                text = ""
            default:
                break
        }
    }
    
    func buttonWidth(_ item: CalcButtons, _ size: CGFloat) -> CGFloat {
        if item == .zero {
            return (size - 3) / 4 * 2 + 1
        }
        return (size - 3) / 4
    }
    
    func buttonHeight(_ size: CGFloat) -> CGFloat {
        (size - 3) / 4
    }
}
