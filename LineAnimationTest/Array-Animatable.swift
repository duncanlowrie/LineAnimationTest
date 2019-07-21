//
//  Array-Animatable.swift
//  LineAnimationTest
//
//  Created by Duncan Lowrie on 20/07/2019.
//  Copyright © 2019 Duncan Lowrie. All rights reserved.
//

import Foundation
import SwiftUI

extension Array: AdditiveArithmetic where Element: AdditiveArithmetic {

    public static func += (lhs: inout Self, rhs: Self) {
        lhs = zip(lhs, rhs).map(+)
    }

    public static func + (lhs: Array<Element>, rhs: Array<Element>) -> Array<Element> {
        zip(lhs, rhs).map(+)
    }

    public static func -= (lhs: inout Array<Element>, rhs: Array<Element>) {
        lhs = zip(lhs, rhs).map(-)
    }

    public static func - (lhs: Array<Element>, rhs: Array<Element>) -> Array<Element> {
        zip(lhs, rhs).map(-)
    }

    public static var zero: Array<Element> {
        Array(repeating: Element.zero, count: 1)
    }
}

extension Array: VectorArithmetic where Element == Double {
    public mutating func scale(by rhs: Double) {
        self = map {
            var element = $0
            element.scale(by: rhs)
            return element
        }
    }

    public var magnitudeSquared: Double {
        map { $0 * $0 }.reduce(0, +)
    }
}
