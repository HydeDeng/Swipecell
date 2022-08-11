//
//  CardView.swift
//  FurnituresApp
//
//  Created by Siro on 2022/8/11.
//

import SwiftUI

struct CardView: View {
    var item: Item
    var body: some View {
        HStack{
            Image(item.image)
                .resizable()
                . aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width/3.2)
            
            VStack(alignment: .leading, spacing: 10){
                Text(item.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Text(item.subTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.gray)
                
                Text(item.price)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
            }
            
            Spacer(minLength: 0)
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.08), radius: 5, x: 5, y: 5)
        .shadow(color: .black.opacity(0.08), radius: 5, x: -5, y: -5)
//        .padding(.horizontal)
//        .padding(.top)
    }
}

