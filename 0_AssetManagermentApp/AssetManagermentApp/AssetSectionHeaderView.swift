//
//  AssetSectionHeaderView.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2022/01/06.
//

import SwiftUI

struct AssetSectionHeaderView: View {
    
    let title : String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.accentColor)
            // 구분선
            Divider()
                .frame(height: 2)
                .background(.primary)
        }
    }
}

struct AssetSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AssetSectionHeaderView(title: "은행")
    }
}
