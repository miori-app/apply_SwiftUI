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
            BackgroundView()
            WeatherContentView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
