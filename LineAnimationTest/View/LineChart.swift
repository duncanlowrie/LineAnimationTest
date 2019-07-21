//
//  LineChart.swift
//  LineAnimationTest
//
//  Created by Duncan Lowrie on 12/07/2019.
//  Copyright © 2019 Duncan Lowrie. All rights reserved.
//

import SwiftUI

struct LineChart : View {
    
    var lineDefs: [LineDef]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
//                ForEach(self.lineDefs) { lineDef in
//                    Line(lineDef: lineDef,
//                         maxWidth: geometry.size.width,
//                         maxHeight: geometry.size.height)
//                        .foregroundColor(lineDef.color)
//                        .drawingGroup()
//                        .animation(.easeInOut(duration: 0.5))
//                }
                Line(lineDef: self.lineDefs[0],
                     maxWidth: geometry.size.width,
                     maxHeight: geometry.size.height)
                    .foregroundColor(self.lineDefs[0].color)
                    .drawingGroup()
                    .animation(.easeInOut(duration: 0.5))
            }
        }
    }
}

#if DEBUG
struct LineChart_Previews : PreviewProvider {
    static let lineDefs = [LineDef(values: [10, 20, 10, 20, 15, 30, 15, 5, 25, 20],
                            valueCount: 10,
                            color: .red)]
    static var previews: some View {
        LineChart(lineDefs: self.lineDefs)
    }
}
#endif
