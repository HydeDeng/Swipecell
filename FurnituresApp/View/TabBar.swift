//
//  TabBar.swift
//  FurnituresApp
//
//  Created by Siro on 2022/8/10.
//

import SwiftUI

struct TabBar: View {
    @State var current = "Home"
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $current){
                Home()
                    .tag("Home")
                HomeV2()
                    .tag("Message")
//                Text("Message")
//                    .tag("Message")
                Text("Account")
                    .tag("Account")
                    
 
            }
        
            HStack(spacing: 0){
                //TabButton...
                
                TabButton(title: "Home", image: "house", selected: $current)
                
                Spacer(minLength: 0)
                
                TabButton(title: "Message", image: "message", selected: $current)
                
                Spacer(minLength: 0)
                
                TabButton(title: "Account", image: "person", selected: $current)
            }
            .padding(.vertical,12)
            .padding(.horizontal)
            .background(Color.gray)
            .clipShape(Capsule())
            .padding(.horizontal, 25)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
