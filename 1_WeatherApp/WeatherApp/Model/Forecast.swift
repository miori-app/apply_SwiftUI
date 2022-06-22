//
//  Forecast.swift
//  WeatherApp
//
//  Created by miori Lee on 2022/06/23.
//

import Foundation

struct Forecast : Identifiable {
    var id = UUID()
    
    let date : String
    let time : String
    let icon : String
    let weather : String
    let temperature : String
    let minTemperature : String
    let maxTemperatrue : String
    let forcastedDate : Date
}

extension Forecast {
    static var preview : [Forecast] {
        return (0..<10).map {
            let dt = Date.now.addingTimeInterval(TimeInterval($0 * 3600 * 24))
            
            return Forecast(date: dt.formatted(.dateTime.month().day()),
                            time: dt.formatted(.dateTime.hour().minute()),
                            icon: "sun.max.fill",
                            weather: "맑음",
                            temperature: Double.randomTemperatureString,
                            minTemperature: Double.randomTemperatureString,
                            maxTemperatrue: Double.randomTemperatureString,
                            forcastedDate: .now)
        }
    }
}
