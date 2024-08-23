//
//  RepsView.swift
//  StanceTestSwiftUI
//
//  Created by Pau Ruiz Perez on 22/08/2024.
//

import SwiftUI
import Charts
import Combine

struct RepsView: View {
    @StateObject var repsViewModel = RepsViewModel(networkService: NetworkService())
    var body: some View {
        VStack {
            Text("Repetitions")
            ForEach(repsViewModel.data.sets, id: \.self) { set in
                Chart (0..<set.reps.count, id: \.self){ index in
                    LineMark(x: .value( "Date", set.reps[index].timestamp
                                        ),
                             y: .value("Intensity", set.reps[index].intensity)
                    )
                }
            }
            Image(ImageResource(name: "stancelogo_black", bundle: Bundle.main)).foregroundStyle(.tint)
            Text("Lift Stronger,\nLift Smarter.")
        }
        .onAppear() {
            repsViewModel.fetchData()
        }
        .padding()
    }
}

#Preview {
    RepsView()
}
