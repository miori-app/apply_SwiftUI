//
//  DetailView.swift
//  WeightliftingLog
//
//  Created by miori Lee on 2022/07/08.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var trLog: TrainingLog
    @EnvironmentObject var store: TrainingLogStore
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(trLog.trainingLog)
                            .padding()
                        Spacer(minLength: 0)
                    }
                    Text(trLog.insertDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("기록보기")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(trLog: TrainingLog(trainingLog: "Dummy"))
            .environmentObject(TrainingLogStore())
    }
}
