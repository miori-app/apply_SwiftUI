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
    let creditCardAmounts : [CreditCardAmounts]?
    
    init(id : Int , title : String, amount : String, creditCardAmounts : [CreditCardAmounts]? = nil) {
        self.id = id
        self.title = title
        self.amount = amount
        self.creditCardAmounts = creditCardAmounts
    }
}

enum CreditCardAmounts : Identifiable, Decodable {
    
    var id: Int {
        switch self {
        case .previousMonth :
            return 0
        case .currentMonth :
            return 1
        case .nextMonth :
            return 2
            
        }
    }
    
    case previousMonth(amount : String)
    case currentMonth(amount : String)
    case nextMonth(amount : String)
    
    var amount : String {
        switch self {
        case .previousMonth(let amount),
                .currentMonth(let amount),
                .nextMonth(let amount) :
            return amount
        }
    }
    
    // decodable 할 수 있게
    enum CodingKeys : String, CodingKey {
        case previousMonth
        case currentMonth
        case nextMonth
    }
    
    init(from decoder : Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try? values.decode(String.self, forKey: .previousMonth) {
            self = .previousMonth(amount : value)
            return
        }
        
        if let value = try? values.decode(String.self, forKey: .currentMonth) {
            self = .currentMonth(amount : value)
            return
        }
        
        if let value = try? values.decode(String.self, forKey: .nextMonth) {
            self = .nextMonth(amount : value)
            return
        }
        
        throw fatalError("creditCartAmounts 디코딩 중 에러남")
    }
    
}

