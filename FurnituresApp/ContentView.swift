//
//  ContentView.swift
//  FurnituresApp
//
//  Created by Siro on 2022/8/10.
//

import SwiftUI

struct ContentView: View {
    
    //hiding tab bar...
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
