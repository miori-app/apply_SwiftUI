//
//  AssetMenuGridView.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2021/12/30.
//

import SwiftUI

struct AssetMenuGridView: View {
    let menuList : [[AssetMenu]] = [[.creditScore,.bankAccount,.investment,.loan],[.insurance,.creditCard,.cash,.realEstate]]
    
    var body: some View {
        // 수직
        VStack(spacing : 20) {
            ForEach(menuList, id : \.self) { row in
                // 수평
                HStack(spacing : 10) {
                    ForEach(row) { menu in
                        Button("") {
                            print("\(menu.title) tapped")
                        }
                        .buttonStyle(AssetMenuBtnStyle(menu: menu))
                    }
                }
            }
        }
    }
}

struct AssetMenuGridView_Previews: PreviewProvider {
    static var previews: some View {
        AssetMenuGridView()
    }
}
