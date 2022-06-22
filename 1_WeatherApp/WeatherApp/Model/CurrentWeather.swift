//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by miori Lee on 2022/06/22.
//

import Foundation

struct CurrentWeather {
    let icon : String
    let weather : String
    let temperature : String
    let maxTemperature : String
    let minTemperature : String
    let sunrise : String
    let sunset : String
    let forecastedDate : Date
}

//preview 에서 사용할 데이터
extension CurrentWeather {
    static var preview : CurrentWeather {
        return CurrentWeather(icon: "sun.max.fill",
                              weather: "맑음",
                              temperature: Double.randomTemperatureString,
                              maxTemperature: Double.randomTemperatureString,
                              minTemperature: Double.randomTemperatureString,
                              sunrise: "오전 6:00",
                              sunset: "오후 6:00",
                              forecastedDate: .now)
    }
}
