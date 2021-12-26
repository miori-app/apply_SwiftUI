//
//  NavigationBarWithBtn.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2021/12/27.
//

import SwiftUI

struct NavigationBarWithBtn: ViewModifier {
    var title : String = ""
    func body(content: Content) -> some View {
        return content
            .navigationBarItems(
                leading: Text(title)
                    .font(.system(size:  24, weight: .bold))
                    .padding(),
                trailing: Button(
                    action: {
                        print("자산추가 버튼 tapped")
                    },
                    label: {
                        Image(systemName: "plus")
                        Text("자산추가")
                            .font(.system(size: 12))
                    }
                )
                    .accentColor(.black)
                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 8))
                    //버튼 둥글게
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            //내부 색채우는거 없이 테두리만
                            .stroke(Color.black)
                    )
            )
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                let appearance = UINavigationBarAppearance ()
                //투명
                UINavigationBar.appearance().isTranslucent =  false
                appearance.backgroundColor = UIColor(.white)
                UINavigationBar().standardAppearance = appearance
                UINavigationBar().compactAppearance = appearance
                UINavigationBar().scrollEdgeAppearance = appearance
            }
    }
}

extension View {
    func navigationBarWithBtnStyle(_ title : String) -> some View {
        return self.modifier(NavigationBarWithBtn(title: title))
    }
}

struct NavigationBarWithBtn_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Color.gray.edgesIgnoringSafeArea(.all)
                .navigationBarWithBtnStyle("내 자산")
        }
    }
}
