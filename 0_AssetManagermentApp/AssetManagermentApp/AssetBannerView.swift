//
//  AssetBannerView.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2022/01/04.
//

import SwiftUI

struct AssetBannerView: View {
    let bannerList : [AssetBanner] = [
        AssetBanner(title: "SwiftUI"  , description: "스위프트유아이", backgroundColor: .red),
        AssetBanner(title: "rxswift" , description: "이것도 해야지", backgroundColor: .blue),
        AssetBanner(title: "mvvm", description: "요것도 중요한데", backgroundColor: .green),
        AssetBanner(title: "콤바인" , description: "이것도 요즘..", backgroundColor: .yellow)
    ]
    
    @State private var currentPage : Int = 0
    var body: some View {
        let bannerCards = bannerList.map {BannerCard(banner: $0)}
        
        // 우측 아래 위치시키기위해
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: bannerCards, currentPage: $currentPage)
            PageControl(numberOfPages: bannerList.count, currentPage: $currentPage)
                .frame(width: CGFloat(bannerCards.count * 18)) //사이즈 조절
                .padding(.trailing)
        }
        
    }
}

struct AssetBannerView_Previews: PreviewProvider {
    static var previews: some View {
        AssetBannerView()
            .aspectRatio(5/2, contentMode: .fit)
    }
}
