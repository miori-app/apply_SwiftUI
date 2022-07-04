//
//  WeatherServie+Location.swift
//  WeatherApp
//
//  Created by miori Lee on 2022/07/04.
//

import Foundation
import CoreLocation

//MARK: location manager 연동 후 주소 가져오기 구현 
extension WeatherService : CLLocationManagerDelegate {
    //MARK:
    private func updateAddress(from location : CLLocation) async throws -> String {
        let geocorder = CLGeocoder()
        let placemarks = try await geocorder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: "Ko_kr"))
        
        if let placemark = placemarks.first {
            if let gu = placemark.locality, let dong = placemark.subLocality {
                return "\(gu) \(dong)"
            } else {
                return placemark.name ?? "알수 없음"
            }
        }
        return "알 수 없음"
    }
    
    //MARK: 권한 요청
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse :
            locationManager.requestLocation()
        case .notDetermined :
            lastError = "위치 서비스 사용 권한을 확인할 수 없습니다"
        case .denied, .restricted:
            lastError = "위치 서비스 사용 권한이 없습니다"
        default:
            lastError = "알 수 없는 에러 발생"
        }
    }
    
    //MARK: 위치서비스 활용
    private func process(location: CLLocation) {
        guard !isPreviewService else {return}
        
        //async method니까 Task로 감싸
        Task {
            currentLocation = try await updateAddress(from: location)
        }
    }
    
    //MARK: 좌표처리
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //좌표는 마지막 파라미터로 전달, 배열 마지막 부분
        //따라서, 마지막 좌표만 빼내고
        if let location = locations.last {
            process(location: location)
        }
        manager.stopUpdatingLocation()
    }
    
    //MARK: 에러처리
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
        lastError = error.localizedDescription
    }
}
