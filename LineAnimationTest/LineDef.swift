//
//  LineDef.swift
//  LineAnimationTest
//
//  Created by Duncan Lowrie on 16/07/2019.
//  Copyright © 2019 Duncan Lowrie. All rights reserved.
//

import Foundation
import SwiftUI

struct LineDef: Equatable {
    var values: [Double]
}
//
//extension LineDef: Animatable {
//    typealias AnimatableData = AnimatablePair<[Double], [Double]>
//    
//    var animatableData: AnimatableData {
//        get { return values }
//        set { values = newValue }
//    }
//}
