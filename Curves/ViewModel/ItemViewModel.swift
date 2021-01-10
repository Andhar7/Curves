//
//  ItemViewModel.swift
//  Curves
//
//  Created by Andrej Kling on 09.01.21.
//

import SwiftUI

class ItemViewModel:  ObservableObject{
    
   @Published var items = [
         
             Item(title: "Orange Juice Shake", cost: "$6", image: "shake1"),
             Item(title: "Strawberry Juice Shake", cost: "$10", image: "shake2")
     ]
    
    @Published var tabs = ["Shakes","Coffee","Drinks","Cocktail"]
    
}
