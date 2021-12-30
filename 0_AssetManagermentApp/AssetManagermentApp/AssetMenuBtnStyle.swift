//
//  AssetMenuBtnStyle.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2021/12/29.
//

import SwiftUI

struct AssetMenuBtnStyle: ButtonStyle {
    let menu : AssetMenu
    
    func makeBody(configuration: Configuration) -> some View {
        return VStack {
            Image(systemName: menu.systemImageName)
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .padding([.leading,.trailing],10)
            Text(menu.title)
                .font(.system(size: 12, weight: .bold))
        }
        .padding(10)
        .foregroundColor(.blue)
        .background(Color.white)
        //전체모양 오려내듯이
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct AssetMenuBtnStyle_Previews: PreviewProvider {
    static var previews: some View {
        // 수평
        HStack(spacing : 24) {
            Button("") {
                print("")
            }
            .buttonStyle(AssetMenuBtnStyle(menu: .creditScore))
            Button("") {
                print("")
            }
            .buttonStyle(AssetMenuBtnStyle(menu: .bankAccount))
            Button("") {
                print("")
            }
            .buttonStyle(AssetMenuBtnStyle(menu: .investment))
            Button("") {
                print("")
            }
            .buttonStyle(AssetMenuBtnStyle(menu: .loan))
        }
        .background(Color.gray.opacity(0.2))
    }
}
