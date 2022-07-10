//
//  MainListView.swift
//  WeightliftingLog
//
//  Created by miori Lee on 2022/07/05.
//

import SwiftUI

struct MainListView: View {
    //@EnvironmentObject var store : TrainingLogStore
    @EnvironmentObject var manager : CoreDataManager
    @State private var showCompseView: Bool = false
    
    //데이터 읽어오기
    //FetchRequest 는 항상 viw 안에서
    @FetchRequest(sortDescriptors: [SortDescriptor(\WeightliftingLogEntity.insertDate, order: .reverse)])
    var trLogList: FetchedResults<WeightliftingLogEntity>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(trLogList) { trLog in
                    NavigationLink {
                        DetailView(trLog: trLog)
                    } label: {
                        TrainCell(trLog: trLog)
                    }
                }
                .onDelete(perform: delete)
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
    
    func delete(set: IndexSet) {
        for index in set {
            manager.delete(trLog: trLogList[index])
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(CoreDataManager.shared)
    }
}
