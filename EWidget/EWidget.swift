//
//  EWidget.swift
//  EWidget
//
//  Created by 최최광현 on 2023/08/27.
//

import WidgetKit
import SwiftUI

// Widget

struct WidgetEntry: TimelineEntry {
    var date: Date
    var stepData: [StepModel] = []
    
    init(date: Date) {
        self.date = date
        let currentDate = Date.now
        let startOfDay = Calendar.current.startOfDay(for: currentDate)
        for i in 0 ..< 7 {
            let date = Calendar.current.date(byAdding: DateComponents(day: i), to: startOfDay)!
            stepData.append(.init(date: date, step: i * 100))
        }
    }
}

struct StepModel: Hashable {
    var date: Date
    var step: Int
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(date: Date.now)
    }

    func getSnapshot(in context: Context, completion: @escaping (WidgetEntry) -> ()) {
        var entry = WidgetEntry(date: Date())
        let currentDate = Date.now
        let startOfDay = Calendar.current.startOfDay(for: currentDate)
        for i in 0 ..< 7 {
            let date = Calendar.current.date(byAdding: DateComponents(day: i), to: startOfDay)!
            entry.stepData.append(.init(date: date, step: i * 50))
        }
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entry = WidgetEntry(date: Date.now)
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date.now
        let startOfDay = Calendar.current.startOfDay(for: currentDate)
        for i in 0 ..< 7 {
            let date = Calendar.current.date(byAdding: DateComponents(day: i), to: startOfDay)!
            entry.stepData.append(.init(date: date, step: i * 50))
        }
        
        // Create a date that's 15 minutes in the future.
        let nextUpdateDate = Calendar.current.date(byAdding: .second, value: 30, to: currentDate)!

        let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct EWidgetEntryView : View {
    var entry: Provider.Entry
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter
    }()
    

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Steps of Week")
                .font(.title)
                .fontWeight(.bold)
            
            if entry.stepData.count > 0 {
                HStack(spacing: 15) {
                    ForEach(entry.stepData, id: \.self) { step in
                        GeometryReader { g in
                            VStack(spacing: 5) {
                                Spacer()
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(height: getHeight(value: CGFloat(step.step), height: g.frame(in: .global).height) - 30)
                                Text("\(dateFormatter.string(from: step.date))")
                                    .font(.caption)
                                    .fontWeight(.light)
                            }
                        }
                    }
                }
            } else {
                Text("step data is empty")
                    .font(.body)
                    .fontWeight(.regular)
            }
        }
        .padding(10)
    }
    
    func getHeight(value: CGFloat, height: CGFloat) -> CGFloat {
        let maxStep = entry.stepData.map { $0.step }.max() ?? .zero
        let percent = value / CGFloat(maxStep)
        return percent * height
    }
}

struct EWidget: Widget {
    
    let provider = Provider()
    
    let kind: String = "EWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: provider) { entry in
            EWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemLarge])
    }
}

struct EWidget_Previews: PreviewProvider {
    static var previews: some View {
        EWidgetEntryView(entry: WidgetEntry(date: Date.now))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
