//
//  WeatherService.swift
//  WeatherApp
//
//  Created by miori Lee on 2022/06/25.
//

import Foundation
import CoreLocation

class WeatherService : NSObject, ObservableObject {
    //NSObject : delegate 구현할거니까
    //ObservableObject : 뷰에서 감시할 수 있도록
    
    //location manager
    let locationManager : CLLocationManager
    
    //현재위치 저장하는 속성 (뷰에서 감시할수 있도록)
    @Published var currentLocation : String?
    
    //현재날씨와 예보목록
    @Published var currentWeather : CurrentWeather?
    @Published var forecastList : [Forecast]?
    
    @Published var lastError : String?
    
    let isPreviewService: Bool
    init(preview: Bool = false) {
        isPreviewService = preview
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
        super.init()
        
        //locationManager.delegate = self
    }
    
    static var preview : WeatherService {
        let service = WeatherService(preview: true)
        service.currentLocation = "잠실역"
        service.currentWeather = CurrentWeather.preview
        service.forecastList = Forecast.preview
        
        return service
    }
}
