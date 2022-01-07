//
//  AssetSummaryView.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2022/01/06.
//

import SwiftUI

struct AssetSummaryView: View {
    // 외부에서 AssetSummaryData 전체를 받아서 전체상태를 변경시키고 표현함
    @EnvironmentObject var assetData : AssetSummaryData
    var assets : [AssetData]  {
        //readOnly
        return assetData.assets
    }
    var body: some View {
        VStack(spacing : 20) {
            ForEach(assets) { asset in
                switch asset.type {
                case .creditCard:
                    TabContentsView(asset: asset)
                        .frame(idealHeight : 250)
                default :
                    AssetSectionView(assetSection: asset)
                }
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
        }
    }
}

struct AssetSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        AssetSummaryView()
            //AssetSummaryData 서 assets을 내뱉어줌 (published)
            .environmentObject(AssetSummaryData())
            .background(.gray.opacity(0.2))
    }
}
