//
//  Line.swift
//  LineAnimationTest
//
//  Created by Duncan Lowrie on 21/07/2019.
//  Copyright © 2019 Duncan Lowrie. All rights reserved.
//

import SwiftUI

struct Line: Shape {
        
    var lineDef: LineDef
    let maxWidth: CGFloat
    let maxHeight: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        
        let maxValue = lineDef.values.max() ?? 0.0
        let sectionWidth: CGFloat = maxWidth / CGFloat(lineDef.valueCount - 1)
        
        var path = Path()
        var i = 0
        var lastPoint = CGPoint.zero
        
        lineDef.values.forEach { value in
            if maxValue != 0.0 {
                let scaleFactor = CGFloat(value / maxValue)
                y = scaleFactor * CGFloat(maxHeight)
            }
            
            if i <= Int(lineDef.valueCount) {
                var point = CGPoint(x: x, y: y)
                point.y = maxHeight - point.y
            
                if i == 0 {
                    path.move(to: point)
                } else if i < Int(lineDef.valueCount) {
                    path.addLine(to: point)
                }
                
                lastPoint = point
            } else {
                //
                path.addLine(to: lastPoint)
            }
            
            x += sectionWidth
            i += 1
        }
                
        return path.strokedPath(StrokeStyle(lineWidth: 3,
                                 lineCap: .round,
                                 lineJoin: .round,
                                 miterLimit: 4,
                                 dash: [],
                                 dashPhase: 0))
    }
    
    var animatableData: LineDef.AnimatableData {
        get { lineDef.animatableData }
        set { lineDef.animatableData = newValue }
    }
}
