//
//  DetailView.swift
//  WeightliftingLog
//
//  Created by miori Lee on 2022/07/08.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var trLog: WeightliftingLogEntity
    @EnvironmentObject var manager: CoreDataManager
    @State var showComposeView: Bool = false
    @State private var showDeleteAlert: Bool = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(trLog.trainingLog ?? "")
                            .padding()
                        Spacer(minLength: 0)
                    }
                    Text(trLog.insertDate ?? .now, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("기록보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    showDeleteAlert = true
                } label: {
                    Image(systemName: "trash")
                }
                .foregroundColor(.red)
                .alert("삭제 확인", isPresented: $showDeleteAlert) {
                    Button(role: .destructive) {
                        manager.delete(trLog: trLog)
                        dismiss()
                    } label: {
                        Text("삭제")
                    }
                } message: {
                    Text("메모를 삭제할까요?")
                }


                Button {
                    showComposeView = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $showComposeView) {
            ComposeView(trLog: trLog)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(trLog: WeightliftingLogEntity(context: CoreDataManager.shared.mainContext))
                .environmentObject(CoreDataManager.shared)
        }
    }
}
