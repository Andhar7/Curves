//
//  CurvesStructs.swift
//  Curves
//
//  Created by Andrej Kling on 09.01.21.
//

import SwiftUI

struct Curve: Shape {
    
    var midY : CGFloat
    
    // animating...
    var animatableData: CGFloat{
        get{return midY}
        set{midY = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            
            // CUrve...
            let width = rect.width
            
            path.move(to: CGPoint(x: width, y: midY - 40))
            
            let to = CGPoint(x: width - 25, y: midY)
            let control1 = CGPoint(x: width, y: midY - 20)
            let control2 = CGPoint(x: width - 25, y: midY - 20)
            
            path.addCurve(to: to, control1: control1, control2: control2)
            
            let to1 = CGPoint(x: width, y: midY + 40)
            let control3 = CGPoint(x: width - 25, y: midY + 20)
            let control4 = CGPoint(x: width, y: midY + 20)
            
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}

// Another Longer Curve For ItemView...

struct ItemCurve: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            
            // CUrve...
            let width = rect.width
            let midY = rect.height / 2
            
            path.move(to: CGPoint(x: width, y: midY - 60))
            
            let to = CGPoint(x: width - 40, y: midY)
            let control1 = CGPoint(x: width, y: midY - 30)
            let control2 = CGPoint(x: width - 40, y: midY - 30)
            
            path.addCurve(to: to, control1: control1, control2: control2)
            
            let to1 = CGPoint(x: width, y: midY + 60)
            let control3 = CGPoint(x: width - 40, y: midY + 30)
            let control4 = CGPoint(x: width, y: midY + 30)
            
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}
