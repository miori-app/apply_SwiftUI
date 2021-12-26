//
//  MyView.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2021/12/07.
//

import SwiftUI

struct MyView: View {
    
    let helloFont : Font
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(helloFont)
            Text("자 이제 시작이야")
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(helloFont: .title)
    }
}
