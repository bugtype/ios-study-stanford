import SwiftUI

let themes: [Theme] = [
    Theme(
        id: 0, name:"A", emojis: ["🇬🇧", "🇺🇸", "🇹🇷", "🇨🇦", "🇯🇵", "🇩🇪", "🇳🇴"],
        color: .blue
    ),
    
    Theme(
        id: 1, name:"B", emojis: ["🍔", "🍕", "🍝", "🧆", "🍦", "🍿", "🍫", "🍣", "🌮", "🥪", "🍗", "🥓"],
        color: .green
    ),
    
    Theme(
        id: 2, name:"C", emojis: ["👻", "🎃", "🙀", "😈", "☠️", "💀", "🦇", "🍭", "🕸", "🕷"],
        color: .orange
    ),
    
    Theme(
        id: 3, name:"D", emojis: ["🏢", "🏤", "🏥", "🏦", "🏨", "🏪", "🏫", "🏛", "⛪️", "🕌", "🕍", "🛕", "⛩"],
        color: .purple
    ),
    
    Theme(
        id: 4, name:"E", emojis: ["🚗", "🚕", "🏎", "🚜", "🚚", "🚆", "🚊", "🛩", "🚀", "🚁", "🛸", "🚤", "⛵️"],
        color: .blue
    ),
    
    Theme(
        id: 5, name:"F", emojis: ["😄", "😅", "😂", "😇", "😍", "😘", "😋", "😜", "🤓", "😎", "🥺", "🤬", "🤯", "🥶", "🤢", "😷", "👽"],
        color: .yellow
    ),
]

struct Theme: Identifiable {
    let id: Int
    let name: String
    let emojis: [String]
    let color: Color
}
