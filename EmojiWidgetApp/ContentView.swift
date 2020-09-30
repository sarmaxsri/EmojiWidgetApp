//
//  ContentView.swift
//  EmojiWidgetApp
//
//  Created by Sarvesh on 30/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.com.sarmaxsri.EmojiWidgetApp"))
    var emojiData: Data = Data()
    
    let emojis = [
        Emoji(icon: "😂", name: "Laugh", description: "That's so funny!"),
        Emoji(icon: "😍", name: "Love", description: "I'm in love with you!"),
        Emoji(icon: "🥺", name: "Sad", description: "I'm very sad rn!"),
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(emojis) { emoji in
                EmojiView(emoji: emoji)
                    .onTapGesture  {
                        save(emoji)
                    }
            }
        }
    }
    
    func save(_ emoji: Emoji) {
        guard let emojiData = try? JSONEncoder().encode(emoji) else { return }
        self.emojiData = emojiData
        print("SAVED \(emoji)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
