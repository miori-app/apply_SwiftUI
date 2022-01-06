//
//  AssetSummaryData.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2022/01/06.
//

// 데이터 모델
import SwiftUI

class AssetSummaryData: ObservableObject {
    // 어떤 데이터 내보낼지
    @Published var assets : [AssetData] = load("assets.json")
    

}

// MARK: - Decodabel 이 가능한 제네릭
/*
 - 어떤 파일을 입력하면 내가 원하는 형태로 디코딩해줌
 */
func load<T : Decodable>(_ fileName : String) -> T {
    let data : Data
    
    guard let file : URL = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("\(fileName)을 찾을수 없음")
    }
    
    do {
         data = try Data(contentsOf: file)
    } catch {
        fatalError("\(fileName)을 찾을수 없음")
    }
    
    // data 까지 잘 갖고왔으면 디코딩
    do {
        let decoder : JSONDecoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("\(fileName)을 \(T.self)로 디코딩 할 수 없음")
    }
}
 
