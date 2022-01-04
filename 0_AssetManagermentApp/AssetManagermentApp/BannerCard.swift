//
//  BannerCard.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2022/01/04.
//

import SwiftUI

struct BannerCard: View {
    var banner : AssetBanner
    
    var body: some View {
//        Ztack {
//            Color(banner.backgroundColor)
//            VStack{
//                Text(banner.title)
//                    .font(.headline)
//                Text(banner.description)
//                    .font(.subheadline)
//            }
//        }
        Color(banner.backgroundColor)
            .overlay {
                VStack {
                    Text(banner.title)
                        .font(.headline)
                    Text(banner.description)
                        .font(.subheadline)
                }
            }
    }
}

struct BannerCard_Previews: PreviewProvider {
    static var previews: some View {
        let banner0 = AssetBanner(title: "공지사항", description: "메롱", backgroundColor: .red)
        BannerCard(banner: banner0)
    }
}
