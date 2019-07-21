//
//  ContentView.swift
//  LineAnimationTest
//
//  Created by Duncan Lowrie on 12/07/2019.
//  Copyright © 2019 Duncan Lowrie. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @ObjectBinding var chartValuesManager: ChartValuesManager
    
    var body: some View {
        VStack {
            
            LineChart(chartValues: chartValuesManager.values, currentValueCount: chartValuesManager.currentValueCount)
                .frame(height: 200.0)

            Button("Randomize!") {
                self.chartValuesManager.refresh()
            }.padding(32)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(chartValuesManager: ChartValuesManager(initialValues: [0.0, 0.0, 0.0], maxValues:  52))
    }
}
#endif
