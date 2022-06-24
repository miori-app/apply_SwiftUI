//
//  BackgroundView.swift
//  WeatherApp
//
//  Created by miori Lee on 2022/06/25.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        //이미지 너비 디바이스 너비에 맞추기
        GeometryReader { reader in
            Image("bkg")
                .resizable()
                .scaledToFill() // 전체 채우기
                .frame(width: reader.size.width)
                .ignoresSafeArea() //여백 무시
                .overlay {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
