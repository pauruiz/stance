//
//  RepsView.swift
//  StanceTestSwiftUI
//
//  Created by Pau Ruiz Perez on 22/08/2024.
//

import SwiftUI
import Charts
import Combine


struct data {
    let date: Date
    let speed: Float
}

struct RepsView: View {
    @StateObject var repsViewModel = RepsViewModel(networkService: NetworkService())
    var body: some View {
        VStack {
            Text(repsViewModel.data.first?.sets.first?.reps.first?.speed.description ?? "DEFAULT")
            
//            Chart {
//                ForEach(respViewModel.data.sets, id: \.id) { item in
//                                    LineMark(
//                                        x: .value(, item.date),
//                                        y: .value("Count", item.value)
//                                    )
//                                }
//            }
            
//            Chart{
//                LineMark(
//                    x: .value("Month", Date(timeIntervalSince1970: TimeInterval(1))),
//                    y: .value("speed", 0.33)
//                )
////                BarMark(
////                    x: .value("", 0.33),
////                    y: .value("", 0.33)
////                )
//            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear() {
            repsViewModel.fetchDataNoNetwork()
        }
        .padding()
    }
}

#Preview {
    RepsView()
}
