//
//  ChartsView.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/08/29.
//

import SwiftUI
import Charts

struct ChartsView: View {
    let barColors: [Color] = [.red, .black, .blue, .green, .yellow, .pink, .teal]
    
    var body: some View {
//        Chart {
//            ForEach(downloadDataList) { item in
//                BarMark(x: .value("day", item.day),
//                        y: .value("Number of downloads", item.downloads))
//            }
//        }
//        .frame(height: 300)
        Chart(downloadDataList) {
            AreaMark(
                x: .value("day", $0.day),
                y: .value("Number of downloads", $0.downloads)
            )
            .symbol(by: .value("day", $0.day))
            
            RuleMark(
                y: .value("Mid", 50)
            )
        }
        .frame(height: 300)
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}

struct DownloadData: Identifiable {
    var id = UUID()
    var day: String
    var downloads: Double
}

var downloadDataList: [DownloadData] = [
    DownloadData(day: "2022-01-01", downloads: Double.random(in: 0..<100)),
    DownloadData(day: "2022-01-02", downloads: Double.random(in: 0..<100)),
    DownloadData(day: "2022-01-03", downloads: Double.random(in: 0..<100)),
    DownloadData(day: "2022-01-04", downloads: Double.random(in: 0..<100)),
    DownloadData(day: "2022-01-05", downloads: Double.random(in: 0..<100)),
]
