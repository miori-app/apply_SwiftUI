//
//  WeightliftingLogApp.swift
//  Shared
//
//  Created by miori Lee on 2022/07/05.
//

import SwiftUI

@main
struct WeightliftingLogApp: App {
    //저장소 속성으로 저장
    //모든뷰에서 동일한 객체 쉽게 사용가능
    //@StateObject var store = TrainingLogStore()
    let manager = CoreDataManager.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, manager.mainContext)
                //.environmentObject(store)
                .environmentObject(manager)
        }
    }
}
