//
//  AssetData.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2022/01/05.
//

import Foundation


class AssetData : Identifiable, ObservableObject, Decodable {
    let id : Int
    let type : AssetMenu
    let data : [AssetDataArr]
    
    init(id : Int, type : AssetMenu, data : [AssetDataArr]) {
        self.id = id
        self.type = type
        self.data = data
    }
}

class AssetDataArr : Identifiable, ObservableObject, Decodable {
    let id : Int
    let title : String
    let amount : String
    
    init(id : Int , title : String, amount : String) {
        self.id = id
        self.title = title
        self.amount = amount
    }
}
