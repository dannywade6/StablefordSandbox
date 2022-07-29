//
//  HoleViewModel.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 29/07/2022.
//

import Foundation

class HoleViewModel: ObservableObject {
    @Published var allHoles: [HoleData] = [
        HoleData(holeNumber: 1, par: 3, strokeIndex: 1, strokesPlayed: 3)
    ]
    
    @Published var whichHole: Int = 1
    
    var totalScore: Int {
        return 3
    }
    
//    func calculatePoints() -> Int {
//        var net: Int = 0
//        var points: Int = 0
//        let handicap: Int = 18
//
//        if handicap <= 18 {
//            if handicap - selectedStrokeIndex >= 0 {
//                net = (inputGross - 1)
//            }
//            else {
//                net = inputGross
//            }
//        }
//
//        if handicap > 18 {
//            if (handicap - 18) - selectedStrokeIndex >= 0 {
//                net = (inputGross - 2)
//            }
//            else {
//                net = (inputGross - 1)
//            }
//        }
//
//        switch net {
//        case _ where net >= selectedParIndex + 2:
//            points = 0
//            return points
//
//        case _ where net == selectedParIndex + 1:
//            points = 1
//            return points
//
//        case _ where net == selectedParIndex:
//            points = 2
//            return points
//
//        case _ where net == selectedParIndex - 1:
//            points = 3
//            return points
//
//        case _ where net == selectedParIndex - 2:
//            points = 4
//            return points
//
//        case _ where net == selectedParIndex - 3:
//            points = 5
//            return points
//
//        case _ where net == selectedParIndex - 4:
//            points = 6
//            return points
//
//        default:
//            points = 0
//            return points
//        }
//    }
}
