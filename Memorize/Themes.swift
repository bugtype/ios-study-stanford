import SwiftUI

let themes: [Theme] = [
    Theme(
        id: 0, emojis: ["🇬🇧", "🇺🇸", "🇹🇷", "🇨🇦", "🇯🇵", "🇩🇪", "🇳🇴"],
        color: .blue
    ),
    
    Theme(
        id: 1, emojis: ["🍔", "🍕", "🍝", "🧆", "🍦", "🍿", "🍫", "🍣", "🌮", "🥪", "🍗", "🥓"],
        color: .green
    ),
    
    Theme(
        id: 2, emojis: ["👻", "🎃", "🙀", "😈", "☠️", "💀", "🦇", "🍭", "🕸", "🕷"],
        color: .orange
    ),
    
    Theme(
        id: 3, emojis: ["🏢", "🏤", "🏥", "🏦", "🏨", "🏪", "🏫", "🏛", "⛪️", "🕌", "🕍", "🛕", "⛩"],
        color: .purple
    ),
    
    Theme(
        id: 4, emojis: ["🚗", "🚕", "🏎", "🚜", "🚚", "🚆", "🚊", "🛩", "🚀", "🚁", "🛸", "🚤", "⛵️"],
        color: .blue
    ),
    
    Theme(
        id: 5, emojis: ["😄", "😅", "😂", "😇", "😍", "😘", "😋", "😜", "🤓", "😎", "🥺", "🤬", "🤯", "🥶", "🤢", "😷", "👽"],
        color: .yellow
    ),
]

struct Theme: Identifiable {
    let id: Int
    let emojis: [String]
    let color: Color
}
