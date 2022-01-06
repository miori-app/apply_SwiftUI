//
//  AssetSectionView.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2022/01/06.
//

import SwiftUI

struct AssetSectionView: View {
    //observalbe연결위해
    @ObservedObject var assetSection : AssetData // 내가 관찰할게
    // AssetData : 관찰할수 있는
    // @ObservedObject : 관찰하는
    // ObservableObject type의 클래스를 @ObservedObject 프로퍼티래퍼를 통해서 연결
    var body: some View {
        VStack(spacing : 20) {
            AssetSectionHeaderView(title: assetSection.type.title)
            ForEach(assetSection.data) { asset in
                HStack {
                    Text(asset.title)
                        .font(.title)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(asset.amount)
                        .font(.title3)
                        .foregroundColor(.primary)
                }
                Divider()
            }
        }
        // VStack 에 해당
        .padding()
    }
}

struct AssetSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let asset = AssetData(id: 0, type: .bankAccount, data: [
            AssetDataArr(id: 0, title: "미연은행", amount: "1000원"),
            AssetDataArr(id: 1, title: "미연1은행", amount: "2000원"),
            AssetDataArr(id: 2, title: "미연2은행", amount: "3000원")])
        AssetSectionView(assetSection: asset)
    }
}
