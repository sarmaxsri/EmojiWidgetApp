//
//  EmojiView.swift
//  EmojiWidgetApp
//
//  Created by Sarvesh on 30/09/20.
//

import SwiftUI

struct EmojiView: View {
    
    let emoji: Emoji
    
    var body: some View {
        Text(emoji.icon)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Circle())
    }
}
