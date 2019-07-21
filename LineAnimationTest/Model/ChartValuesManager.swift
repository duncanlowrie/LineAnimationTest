//
//  ChartValuesManager.swift
//  LineAnimationTest
//
//  Created by Duncan Lowrie on 12/07/2019.
//  Copyright © 2019 Duncan Lowrie. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ChartValuesManager: BindableObject {

    typealias PublisherType = PassthroughSubject<Void, Never>
        
    var willChange = PublisherType()
    
    var lineDef: LineDef
    var maxValues: Int
    
    init(initialValues: [Double], maxValues: Int) {
        
        self.maxValues = maxValues
       
        var values = initialValues
        
        //add missing values...
        let lastValue = values.last ?? 0.0
        let blankValues = (values.count..<maxValues).map { _ in lastValue }
        values.append(contentsOf: blankValues)
        
        self.lineDef = LineDef(values: values,
                               valueCount: Double(initialValues.count),
                               color: .red)
        
        willChange.send()
        refresh()
    }
    
    func refresh() {
        loadNewValues()
    }
    
    private func loadNewValues() {
    
        //randomize a random number of values...
        let valueCount = Double(Int.random(in: 0...maxValues))
        var values = [Double].init(repeating: 0.0, count: Int(maxValues))
        
        for i in 0..<Int(valueCount) {
            values[i] = Double.random(in: 5...42)
        }
           
        lineDef = LineDef(values: values, valueCount: valueCount, color: .red)
        
        willChange.send()
    }

}
