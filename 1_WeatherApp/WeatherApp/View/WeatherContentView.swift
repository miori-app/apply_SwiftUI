//
//  WeatherContentView.swift
//  WeatherApp
//
//  Created by miori Lee on 2022/06/25.
//

import SwiftUI

struct WeatherContentView: View {
    var body: some View {
        VStack {
            Text("잠실역")
                .font(.title2)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
            
            GeometryReader { reader in
                ScrollView(showsIndicators: false) {
                    VStack {
                        Color.clear // 나머지 높이
                        CurrentWeatherView(model: .preview) //실제 내용
                    }
                    .frame(height: reader.size.height)
                    
                    Spacer(minLength: reader.safeAreaInsets.bottom)
                    
                    ForecastView() //예보부분
                     
                }
            }
        }
    }
}

struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherContentView()
            .preferredColorScheme(.dark)
    }
}
