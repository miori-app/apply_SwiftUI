//
//  ForecastView.swift
//  WeatherApp
//
//  Created by miori Lee on 2022/06/25.
//

import SwiftUI

struct ForecastView: View {
    var body: some View {
        ForEach(Forecast.preview) { forecast in
            HStack {
                VStack(alignment: .leading) {
                    Text(forecast.date)
                    Text(forecast.time)
                }
                .font(.caption)
                
                Spacer()
                
                Image(systemName: forecast.icon)
                    .font(.title3)
                
                Text(forecast.weather)
                    .font(.title3)
                
                Spacer()
                
                Text(forecast.temperature)
                    .font(.system(size: 40, weight: .ultraLight))
                    .frame(minWidth: 70, alignment: .trailing)
                
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForecastView()
        }
            .preferredColorScheme(.dark)
    }
}
