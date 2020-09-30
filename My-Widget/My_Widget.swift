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
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
    
}

//struct Provider: TimelineProvider {
//    @AppStorage("widget", store: UserDefaults(suiteName: "group.com.sarmaxsri.SM-Greetings"))
//    var widgetData: Data = Data()
//
//    func placeholder(in context: Context) -> WidgetOneEntry {
//        return WidgetOneEntry(data: Widgett(mainText: "Hello", subText: "loading", imageName: "1bg"))
//    }
//
//    func getSnapshot(in context: Context, completion: @escaping (WidgetOneEntry) -> Void) {
//        guard let widget = try? JSONDecoder().decode(Widgett.self, from: widgetData) else {return}
//        let entry = WidgetOneEntry(data: widget)
//        completion(entry)
//    }
//
//    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetOneEntry>) -> Void) {
//        guard let widget = try? JSONDecoder().decode(Widgett.self, from: widgetData) else {return}
//        let entry = WidgetOneEntry(data: widget)
//        let timeline = Timeline(entries: [entry], policy: .never)
//        completion(timeline)
//    }
//}
//
//struct PlaceholderView: View {
//    var body: some View {
//        WidgetView(widget: Widgett(mainText: "Loading@@", subText: "Same", imageName: "1bg"))
//    }
//}
//
//struct WidgetEntryView: View {
//    let entry: Provider.Entry
//
//    var body: some View {
//        WidgetView(widget: entry.data)
//    }
//}
//
//@main
//struct MyWidget: Widget {
//
//    private let kind  = "SM_Widget"
//
//    var body: some WidgetConfiguration {
//        StaticConfiguration (
//            kind: kind,
//            provider: Provider()
////            placeholder: PlaceholderView()
//            ) { entry in
//            WidgetEntryView(entry: entry)
//        }
//    }
//}
