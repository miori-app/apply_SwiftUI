//
//  ContentView.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2021/12/07.
//

import SwiftUI

struct ContentView: View {
    
    enum Tab {
        case asset
        case recommend
        case alert
        case setting
    }
    
    // 상태
    @State private var selection : Tab = .asset

    var body: some View {
        TabView(selection: $selection) {
            Color.white
                .tabItem {
                    Image(systemName: "dollarsign.circle.fill")
                    Text("asset")
                }
                .tag(Tab.asset)
            Color.blue
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Image(systemName:  "hand.thumbsup.fill")
                    Text("recommend")
                }
                .tag(Tab.recommend)
            Color.yellow
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("alert")
                }
                .tag(Tab.alert)
            Color.red
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("setting")
                }
                .tag(Tab.setting)
        }
        .onAppear {
            UITabBar.appearance().isTranslucent = false
            UITabBar.appearance().backgroundColor = .white
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
