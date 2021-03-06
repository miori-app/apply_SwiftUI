//
//  ComposeView.swift
//  WeightliftingLog
//
//  Created by miori Lee on 2022/07/08.
//

import SwiftUI

struct ComposeView: View {
    //@EnvironmentObject var store: TrainingLogStore
    @EnvironmentObject var manager: CoreDataManager
    @Environment(\.dismiss) var dismiss
    //var trLog: TrainingLog? = nil
    var trLog: WeightliftingLogEntity? = nil
    //입력한 텍스트 바인딩
    //state variable
    @State private var content : String = ""
    var body: some View {
        NavigationView {
            VStack {
                //투웨이 바인딩
                TextEditor(text: $content)
                    .padding()
                    .onAppear {
                        //이전내용 표시위함
                        //화면이 표시되는 시점에 초기화 코드
                        if let trLog = trLog?.trainingLog {
                            content = trLog
                        }
                    }
            }
            .navigationTitle(trLog != nil ? "기록 편집" : "새 일지")
            .navigationBarTitleDisplayMode(.inline) //large Title 안써
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        if let trLog = trLog {
                            manager.update(trLog: trLog, newTrLog: content)
                        } else {
                            //저장
                            manager.addTrLog(trLog: content)
                        }
                        dismiss()
                    } label: {
                        Text("저장")
                    }

                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(CoreDataManager.shared)
    }
}
