//
//  LineChart.swift
//  LineAnimationTest
//
//  Created by Duncan Lowrie on 12/07/2019.
//  Copyright © 2019 Duncan Lowrie. All rights reserved.
//

import SwiftUI

struct LineChart : View {
    
    var chartValues: [Double]
    var currentValueCount: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Line(chartValues: self.chartValues,
                     valueCount: self.currentValueCount,
                     maxWidth: geometry.size.width,
                     maxHeight: geometry.size.height)
                    .foregroundColor(.orange)
                    .drawingGroup()
                    .animation(.easeInOut(duration: 0.5))
                
            }
        }
    }
    
    struct Line: Shape {
        
        var chartValues: [Double]
        var valueCount: Double
        let maxWidth: CGFloat
        let maxHeight: CGFloat
        
        func path(in rect: CGRect) -> Path {
            
            var x: CGFloat = 0.0
            var y: CGFloat = 0.0
            
            let maxValue = chartValues.max() ?? 0.0
            let sectionWidth: CGFloat = maxWidth / CGFloat(valueCount - 1)
            
            var path = Path()
            var i = 0
            var lastPoint = CGPoint.zero
            
            chartValues.forEach { value in
                if maxValue != 0.0 {
                    let scaleFactor = CGFloat(value / maxValue)
                    y = scaleFactor * CGFloat(maxHeight)
                }
                
                if i <= Int(valueCount) {
                    var point = CGPoint(x: x, y: y)
                    point.y = maxHeight - point.y
                
                    if i == 0 {
                        path.move(to: point)
                    } else if i < Int(valueCount) {
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
                    
            return path.strokedPath(StrokeStyle(lineWidth: 4,
                                     lineCap: .round,
                                     lineJoin: .round,
                                     miterLimit: 4,
                                     dash: [],
                                     dashPhase: 0))
        }
        
        
        typealias AnimatableData = AnimatablePair<Double, [Double]>

        var animatableData: AnimatableData {
            get {
                .init(valueCount, chartValues)
            }
            set {
                valueCount = newValue.first
                chartValues = newValue.second
            }
        }
    }
}

#if DEBUG
struct LineChart_Previews : PreviewProvider {
    static var previews: some View {
        LineChart(chartValues: [10, 20, 10, 20, 15, 30, 15, 5, 25, 20], currentValueCount: 10)
    }
}
#endif
