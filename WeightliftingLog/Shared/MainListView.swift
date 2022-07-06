//
//  MainListView.swift
//  WeightliftingLog
//
//  Created by miori Lee on 2022/07/05.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store : TrainingLogStore
    
    var body: some View {
        NavigationView {
            List(store.list) { trLog in
                VStack(alignment: .leading) {
                    Text(trLog.trainingLog)
                        .font(.body)
                        .lineLimit(1)
                    
                    Text(trLog.insertDate, style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .listStyle(.plain)
            .navigationTitle("역도기록")
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(TrainingLogStore())
    }
}
