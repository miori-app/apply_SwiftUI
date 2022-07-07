//
//  MainListView.swift
//  WeightliftingLog
//
//  Created by miori Lee on 2022/07/05.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store : TrainingLogStore
    @State private var showCompseView: Bool = false
    var body: some View {
        NavigationView {
            List(store.list) { trLog in
                TrainCell(trLog: trLog)
            }
            .listStyle(.plain)
            .navigationTitle("역도기록")
            .toolbar {
                Button {
                    showCompseView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showCompseView) {
                ComposeView()
            }
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(TrainingLogStore())
    }
}
