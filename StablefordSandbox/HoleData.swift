//
//  HoleData.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 29/07/2022.
//

import Foundation

struct HoleData: Identifiable {
    var id = UUID()
    var holeNumber: Int
    var par: Int
    var strokeIndex: Int
    var strokesPlayed: Int
//    var points: Int
}
