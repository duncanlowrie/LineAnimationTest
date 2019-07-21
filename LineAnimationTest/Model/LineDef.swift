//
//  LineDef.swift
//  LineAnimationTest
//
//  Created by Duncan Lowrie on 16/07/2019.
//  Copyright © 2019 Duncan Lowrie. All rights reserved.
//

import Foundation
import SwiftUI

struct LineDef: Equatable, Identifiable {
    var id = UUID().uuidString
    var values: [Double]
    var valueCount: Double
    var color: Color
}


extension LineDef: Animatable {
    
    typealias AnimatableData = AnimatablePair<Double, [Double]>

    var animatableData: AnimatableData {
       get {
           .init(valueCount, values)
       }
       set {
           valueCount = newValue.first
           values = newValue.second
       }
    }

}
