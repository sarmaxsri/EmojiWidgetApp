//
//  My_Widget.swift
//  My-Widget
//
//  Created by Sarvesh on 30/09/20.
//

import WidgetKit
import SwiftUI

struct EmojiEntry: TimelineEntry {
    var date = Date()
    let emoji: Emoji
}

struct Provider: TimelineProvider {
    
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.com.sarmaxsri.EmojiWidgetApp"))
    var emojiData: Data = Data()
    
    func placeholder(in context: Context) -> EmojiEntry {
        let placeholderEntry = EmojiEntry(emoji: Emoji(icon: "🤨", name: "N/A", description: "N/A"))
        return(placeholderEntry)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (EmojiEntry) -> Void) {
        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }
        let entry = EmojiEntry(emoji: emoji)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<EmojiEntry>) -> Void) {
        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }
        let entry = EmojiEntry(emoji: emoji)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
    
}

struct WidgetEntryView: View {
    let entry: Provider.Entry
    
    var body: some View {
        EmojiView(emoji: entry.emoji)
    }
}


@main
struct MyWidget: Widget {
    private let kind = "My_Widget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetEntryView(entry: entry)
        }
    }
}
