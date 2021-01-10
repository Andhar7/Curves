//
//  Home.swift
//  Curves
//
//  Created by Andrej Kling on 09.01.21.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var model : ItemViewModel
    @State var midY : CGFloat = 0
    @State var selected = "Shakes"
    @State var search = ""
    
    var body: some View {
        HStack(spacing: 0.0) {
            VStack {
                // 1: Creating purple vertical line.... Start:
                Button(action: {}, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                })
                Spacer(minLength: 0)
                // 2: Put Buttons...
                ForEach(model.tabs, id:\.self) { name in
                    
                    // 3: Use GeometryReader to achieve mid position...
                    ZStack { // 8: Embed Geometry reader to ZStack....
                        
                        Circle() // 9: ....
                            .fill(Color.orange)
                            .frame(width: 13, height: 13)
                            .offset(x: selected == name ? 28 : -80) // 10: if selected ....
                        
                        Color("tab") // 9 : Add Color View....
                            .frame(width: 150, height: 110)
                            .rotationEffect(.init(degrees: -90))
                            .offset(x: -51)
                        
                        GeometryReader { reader in
                            Button(action: {
                                // 10: Selected View...
                                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.65, blendDuration: 0.65)){
                                    self.midY = reader.frame(in: .global).midY
                                    self.selected = name
                                }
                                
                            }, label: {
                                Text(name)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                            })
                            .frame(width: 150, height: 110)
                            // 4: default frame ....
                            .rotationEffect(.init(degrees: -90)) // 5: rotation Effect....
                            // 7: Getting Initial First Curve Position....
                            .onAppear(perform: {
                                if name == model.tabs.first {  // Curve Shape onAppear....
                                    self.midY = reader.frame(in: .global).midY
                                }
                            })
                            .offset(x: -8)
                        }
                        .frame(width: 150, height: 110)
                    }
                }
                 Spacer(minLength: 0)
            }
            .frame(width: 72)
            .background(Color("tab")
                            .clipShape(Curve(midY: midY)) // 6: Add Curve Shape...
                            .ignoresSafeArea())
            
            // 11: HStack Cart Button...
            VStack{
                HStack{
                    Spacer(minLength: 0)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "cart")
                            .font(.title)
                            .foregroundColor(.black)
                    })
                }
                .padding()
                
                HStack{ // 12 : ....
                    VStack(alignment: .leading, spacing: 5.0){
                        Text("Smoothie King")
                            .font(.title)
                            .fontWeight(.heavy)
                        Text("Shakes")
                            .font(.title)
                    }
                    .foregroundColor(.black)
                    Spacer()
                }
                .padding(.horizontal)
                
                // 13: Search View...
                HStack(spacing: 15){
                    TextField("Search", text: $search)
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.black.opacity(0.06))
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.top)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                     
                    LazyVStack(spacing: 25){
                        
                        // 14: Items ....
                        ForEach(model.items.indices.reversed(), id: \.self){ index in
                            
                            ItemView(item: model.items[index])
                        }
                    }
                    .padding()
                    .padding(.top)
                 
                })
            }
            .padding(.leading)
            Spacer() // 1: Finished ....
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
         
            Home()
                .environmentObject(ItemViewModel())
      
    }
}
