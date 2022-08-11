//
//  Home.swift
//  FurnituresApp
//
//  Created by Siro on 2022/8/10.
//

import SwiftUI

struct Home: View {
    
    @State var size = "Medium"
    @State var currentTab = "All"
    
    @State var items = [

        Item(title: "Stylish Table Lamp", price: "$20.00", subTitle: "We have amazing quality lamp wide range", image: "car"),
        Item(title: "Stylish Table Lamp", price: "$220.00", subTitle: "We have amazing quality lamp wide range", image: "chair"),
        Item(title: "Stylish Table Lamp", price: "$120.00", subTitle: "We have amazing quality lamp wide range", image: "car")
    ]
    
//    @GestureState var isDragging = false
    
    @State var cart: [Item] = []
    
    var body: some View {
        VStack{
            HStack{
                Button(action:{}){
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.title)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                Button(action:{}){
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .overlay(
                //MARK: Cart count...
                    Text("\(cart.count)")
                        .font(.caption)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .frame(width: 20, height: 20)
                        .background(Color.gray)
                        .clipShape(Circle())
                        .offset(x: 15, y: -20)
                    // disable if no items
                        .opacity(cart.isEmpty ? 0 : 1)
                )
            }
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom, 10)
            
            
            ScrollView{
                
                VStack {
                    
                    HStack{
                        VStack(alignment:.leading, spacing: 8) {
                            Text("Funiture in \nUnique style")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            
                            Text("WE have wide range of furnitures")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .fontWeight(.bold )
                        }
                        
                        Spacer(minLength: 15)
                        
                        // Menu Button...
                        
                        Menu(content: {
                            Button(action: {size = "Small"}){
                                Text("Small")
                            }
                            Button(action: {size = "Medium"}){
                                Text("Medium")
                            }
                            Button(action: {size = "Large"}){
                                Text("Large")
                            }
                        }){
                            Label(title: {
                                Text(size).foregroundColor(.white)
                            }){
                                Image(systemName:"slider.vertical.3")
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(.black)
                            .clipShape(Capsule())
                        }
                        
                    }.padding()
                    
                    HStack(spacing: 0){
                        ForEach(tabs, id: \.self){tab in
                            
                            Button(action: {
                                currentTab = tab
                            }){
                                Text(tab)
                                    .fontWeight(.bold)
                                    .foregroundColor(currentTab == tab ? .black : .gray)
                            }
                            
                            if tab != tabs.last{
                                Spacer(minLength: 0)
                            }
                        }
                    }.padding()
                    
                    //MARK: card view
                    ForEach(items.indices) {index in
                        ZStack{
                            Color("iBlue")
                                .cornerRadius(20)

                            Color("iRed")
                                .cornerRadius(20)
                                .padding(.trailing, 65)
                            
                            // Button ...
                            
                            HStack{
                                
                                Spacer()
                                
                                Button(action:{}){
                                    Image(systemName: "suit.heart")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .frame(width: 65)
                                }
                                
                                Button(action:{
                                    addCart(index: index)
                                }){
                                    //change cart imge
                                    Image(systemName: checkCart(index: index) ? "cart.badge.minus" : "cart.badge.plus")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .frame(width: 65)
                                }
                            }
                            
                            
                            CardView(item: items[index])
                            //drag gesture
                                .offset(x:items[index].offset)
                                .gesture(DragGesture().onChanged({ (value) in
                                    onChanged(value: value, index: index)
                                }).onEnded({(value) in
                                    onEnd(value: value, index: index)
                                }))
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        
                    }
                }
            }
//            .padding(.bottom, 100)
//            Spacer()
        }
    }
    
    func checkCart(index: Int) -> Bool {
        return cart.contains { (item) -> Bool in
            return item.id == items[index].id
        }
    }
    
    func addCart(index: Int) {
        if checkCart(index: index){
            cart.removeAll {(item) -> Bool in
                return item.id == items[index].id
            }
        } else {
            cart.append(items[index])
        }
        
        // closing after added ...
        withAnimation{
            items[index].offset = 0
        }
    }
    
    func onChanged(value: DragGesture.Value, index: Int) {
        if value.translation.width < 0 {
            items[index].offset = value.translation.width
        }
    }
    
    func onEnd(value: DragGesture.Value, index: Int) {
        withAnimation {
            //65+65=130
            if -value.translation.width >= 100{
                items[index].offset = -130
            }else {
                items[index].offset = 0
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

var tabs = ["Tables", "Chairs", "Lamps", "All"]

