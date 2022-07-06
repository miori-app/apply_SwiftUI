//
//  TrainingLogStore.swift
//  WeightliftingLog
//
//  Created by miori Lee on 2022/07/05.
//

import Foundation

class TrainingLogStore: ObservableObject {
    @Published  var list : [TrainingLog]
    
    init(){
        list = [
            TrainingLog(trainingLog: "푸시프레스", insertDate: Date.now),
            TrainingLog(trainingLog: "스내치", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            TrainingLog(trainingLog: "클쩍", insertDate: Date.now.addingTimeInterval(3600 * -48))
        ]
    }
    
    //MARK: CRUD
    //create
    func insert(log: String){
        list.insert(TrainingLog(trainingLog: log), at: 0)
    }
    //update
    func update(log: TrainingLog?, content: String){
        guard let log = log else {
            return
        }
        log.trainingLog = content
    }
    //delete (memo, index)
    func delete(log: TrainingLog){
        list.removeAll { $0.id == log.id }
    }
    func delete(set: IndexSet){
        for index in set {
            list.remove(at: index)
        }
    }
}
