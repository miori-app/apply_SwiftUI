//
//  ComposeView.swift
//  WeightliftingLog
//
//  Created by miori Lee on 2022/07/08.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: TrainingLogStore
    @Environment(\.dismiss) var dismiss
    //입력한 텍스트 바인딩
    //state variable
    @State private var content : String = ""
    var body: some View {
        NavigationView {
            VStack {
                //투웨이 바인딩
                TextEditor(text: $content)
                    .padding()
            }
            .navigationTitle("새 일지")
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
                        //저장
                        store.insert(log: content)
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
            .environmentObject(TrainingLogStore())
    }
}
