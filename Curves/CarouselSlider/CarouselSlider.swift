//
//  CarouselSlider.swift
//  Curves
//
//  Created by Andrej Kling on 10.01.21.
//

import SwiftUI

struct CarouselSlider: View {
    
    @State var selected : Int = 0
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var body: some View {
        
        // Basic logic for Parallax Effect...
        // 1: When View is swiped left Image will moved in opposite direction with value of swiped offset...
        // 2: When View is swiped right Image will moved in opposite direction with value of swiped offset...
        
        TabView(selection: $selected) {
            ForEach(1...10, id:\.self) { i in
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                     
                    // Geometry Reader For Parallax Effect...
                    GeometryReader{ reader in
                        Image("a\(i)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            // moving View in opposite side ...
                            // when user start to swipe...
                            // this will create Parallax Effect ...
                            .offset(x: -reader.frame(in: .global).minX)
                            .frame(width: width, height: height / 2)
                        
                    }
                    .frame(height: height / 2)
                    .cornerRadius(15)
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                    
                    // decreasing width by padding ...
                    // so outer view only decreased ...
                    // inner image will be full width...
                    
                    // Bottom Image...
                    Image("a10")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                        .padding(5)
                        .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.orange, lineWidth: 2))
                        .offset(x: -15, y: 25)
                        

                })
                .padding(.horizontal, 25)
                
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct CarouselSlider_Previews: PreviewProvider {
    static var previews: some View {
        CarouselSlider()
    }
}
