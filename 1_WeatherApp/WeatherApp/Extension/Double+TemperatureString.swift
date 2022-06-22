//
//  Double+TemperatureString.swift
//  WeatherApp
//
//  Created by miori Lee on 2022/06/22.
//

import Foundation

fileprivate let formatter: MeasurementFormatter = {
    let f = MeasurementFormatter()
    f.numberFormatter.maximumFractionDigits = 0
    f.unitOptions = .temperatureWithoutUnit
    return f
}()

extension Double {
    var temperatureString : String {
        let temperatrue = Measurement<UnitTemperature>(value: self, unit: .celsius)
        return formatter.string(from: temperatrue)
    }
    
    static var randomTemperatureString : String {
        return Double.random(in: -10 ... 30).temperatureString
    }
}
