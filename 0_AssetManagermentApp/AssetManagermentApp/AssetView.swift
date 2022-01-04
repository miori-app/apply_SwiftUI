//
//  AssetView.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2022/01/03.
//

import SwiftUI

struct AssetView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    Spacer()
                    AssetMenuGridView()
                    AssetBannerView()
                        .aspectRatio(5/2, contentMode: .fit)
                }
            }
            // 미리 만들어둔 네비게이션 합체
            .background(.gray.opacity(0.2))
            .navigationBarWithBtnStyle("내 자산")
        }
    }
}

struct AssetView_Previews: PreviewProvider {
    static var previews: some View {
        AssetView()
    }
}
