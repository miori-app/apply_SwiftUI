//
//  MainView.swift
//  WeatherApp
//
//  Created by miori Lee on 2022/06/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
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
            
            VStack {
                Text("잠실역")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                
                GeometryReader { reader in
                    ScrollView(showsIndicators: false) {
                        VStack {
                            Color.red // 나머지 높이
                            Color.yellow //실제 내용
                                .frame(height: 200)
                        }
                        .frame(height: reader.size.height)
                        
                        Spacer(minLength: reader.safeAreaInsets.bottom)
                        
                        Color.green //예보부분
                            .frame(height: 1000)
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
