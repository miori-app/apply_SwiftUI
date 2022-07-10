//
//  TrainCell.swift
//  WeightliftingLog
//
//  Created by miori Lee on 2022/07/07.
//

import SwiftUI

struct TrainCell: View {
    @ObservedObject var trLog : WeightliftingLogEntity
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(trLog.trainingLog ?? "")
                .font(.body)
                .lineLimit(1)
            
            Text(trLog.insertDate ?? .now, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct TrainCell_Previews: PreviewProvider {
    static var previews: some View {
        TrainCell(trLog: WeightliftingLogEntity(context: CoreDataManager.shared.mainContext))
    }
}
