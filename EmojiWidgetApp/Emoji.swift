//
//  Emoji.swift
//  EmojiWidgetApp
//
//  Created by Sarvesh on 30/09/20.
//

import Foundation

struct Emoji: Codable, Identifiable {
    let icon: String
    let name: String
    let description: String
    var id: String { icon }
}
