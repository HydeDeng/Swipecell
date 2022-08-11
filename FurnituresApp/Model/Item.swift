//
//  Item.swift
//  FurnituresApp
//
//  Created by Siro on 2022/8/11.
//

import SwiftUI

struct Item: Identifiable {

    var id = UUID().uuidString
    var title: String
    var price: String
    var subTitle: String
    var image: String
    var offset: CGFloat = 0
}

