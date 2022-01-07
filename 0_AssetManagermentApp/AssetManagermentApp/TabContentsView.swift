//
//  TabContentsView.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2022/01/07.
//

import SwiftUI

struct TabContentsView: View {
    @State private var selectedTab : Int = 1
    @ObservedObject var asset : AssetData
    
    var assetData : [AssetDataArr] {
        // 이거만 뽑아쓸거야
        return asset.data
    }
    var body: some View {
        VStack{
            AssetSectionHeaderView(title: asset.type.title)
            TabMenuView(tabs: ["지난달 결제", "이번달 결제", "다음달 결제"], selectedTab: $selectedTab, updated: .constant(.nextMonth(amount: "10,000")))
            TabView(selection: $selectedTab) {
                ForEach(0...2, id:\.self){ i in
                    VStack {
                        ForEach(assetData) { data in
                            HStack {
                                Text(data.title)
                                    .font(.title)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text(data.creditCardAmounts![i].amount)
                                    .font(.title3)
                                    .foregroundColor(.primary)
                            }
                            Divider()
                        }
                    }
                    .tag(i)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .padding()
    }
}

struct TabContentsView_Previews: PreviewProvider {
    static var previews: some View {
        let asset = AssetSummaryData().assets[5]
        TabContentsView(asset: asset)
    }
}
