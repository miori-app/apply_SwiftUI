//
//  TrainingLog.swift
//  WeightliftingLog
//
//  Created by miori Lee on 2022/07/05.
//

import Foundation

class TrainingLog : Identifiable, ObservableObject {
    let id: UUID
    @Published var trainingLog: String
    let insertDate: Date
    
    init(trainingLog: String, insertDate: Date = Date.now) {
        id = UUID()
        self.trainingLog = trainingLog
        self.insertDate = insertDate
    }
}
