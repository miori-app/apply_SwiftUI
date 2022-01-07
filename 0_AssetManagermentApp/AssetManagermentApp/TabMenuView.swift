//
//  TabMenuView.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2022/01/07.
//

import SwiftUI

struct TabMenuView: View {
    var tabs : [String]
    // 선택된 탭
    @Binding var selectedTab :Int
    // 업데이트 된 값이 있다면 빨간점으로 표현하기 위해
    @Binding var updated : CreditCardAmounts?
    
    var body: some View {
        HStack {
            ForEach(0..<tabs.count, id : \.self) { row in
                Button(
                    action: {
                        selectedTab = row
                        // 업데이트된 값 누르면 빨간점 사라지게끔
                        UserDefaults.standard.set(true, forKey: "creditcard_update_checked : \(row)")
                    },
                    label: {
                        VStack(spacing : 0) {
                            HStack {
                                if updated?.id == row {
                                    // 빨간점 표시
                                    let checked : Bool = UserDefaults.standard.bool(forKey: "creditcard_update_checked : \(row)")
                                    Circle()
                                        .fill(
                                            !checked ? .red : .clear
                                        )
                                        .frame(width:6, height: 6)
                                        .offset(x:2, y:-8)
                                } else {
                                    Circle()
                                        .fill(.clear)
                                        .frame(width:6, height: 6)
                                        .offset(x:2, y:-8)
                                }
                                
                                Text(tabs[row])
                                    .font(.system(.headline))
                                    .foregroundColor(
                                        selectedTab == row ? .accentColor : .gray
                                    )
                                    .offset(x:-4, y:0)
                            }
                            .frame(height : 52)
                            Rectangle()
                                .fill(selectedTab == row ? Color.secondary : .clear)
                                .frame(height : 3)
                                .offset(x:4, y:0)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(height : 52)
    }
}

struct TabMenuView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabMenuView(tabs: ["지난달 결제", "이번달 결제", "다음달 결제"], selectedTab: .constant(0), updated: .constant(.previousMonth(amount: "11,000원")))
        }
    }
}
