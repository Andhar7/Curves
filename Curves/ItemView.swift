//
//  ItemView.swift
//  Curves
//
//  Created by Andrej Kling on 09.01.21.
//

import SwiftUI

struct ItemView: View {
    @EnvironmentObject var model : ItemViewModel
    var item : Item
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center), content: {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 5.0) {
                        Text(item.title)
                            .fontWeight(.heavy)
                        Text(item.cost)
                            .fontWeight(.heavy)
                    }
                    .foregroundColor(.white)
                    Spacer(minLength: 0)
                    Button(action: {}, label: {
                        Image(systemName: "suit.heart")
                            .font(.title)
                            .foregroundColor(.white)
                    })
                }
                .padding([.horizontal,.top])
                .padding(.bottom, -15)
                
                Image(item.image)
                    .offset(x: -31)
            }
            //
            .background(Color(item.image)
                            .cornerRadius(33)
                            .clipShape(ItemCurve())
                            .padding(.bottom, 33))
            
            Button(action: {}, label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color(item.image))
                    .clipShape(Circle())
                    
            })
            .offset(x: 6, y: -18)
        })
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ItemViewModel())
    }
}
