//
//  HoleViewModel.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 29/07/2022.
//

import Foundation

class HoleViewModel: ObservableObject {
    @Published var allHoles: [HoleData] = [
        HoleData(holeNumber: 1, par: 3, strokeIndex: 1, strokesPlayed: 3),
        HoleData(holeNumber: 2, par: 4, strokeIndex: 2, strokesPlayed: 3),
        HoleData(holeNumber: 3, par: 5, strokeIndex: 3, strokesPlayed: 3),
        HoleData(holeNumber: 4, par: 3, strokeIndex: 4, strokesPlayed: 3),
        HoleData(holeNumber: 5, par: 4, strokeIndex: 5, strokesPlayed: 3),
        HoleData(holeNumber: 6, par: 5, strokeIndex: 6, strokesPlayed: 3)
    ]
    
    @Published var whichHole: Int = 1
    @Published var handicap: Int = 0
    
    @Published var totalScore: [Int] = []
    
    
    func holeScore() -> Int {
        
        var net: Int = 0
        var points: Int = 0
        
        
        if handicap <= 18 {
            if handicap - allHoles[whichHole - 1].strokeIndex >= 0 {
                net = (allHoles[whichHole - 1].strokesPlayed - 1)
            }
            else {
                net = allHoles[whichHole - 1].strokesPlayed
            }
        }

        if handicap > 18 {
            if (handicap - 18) - allHoles[whichHole - 1].strokeIndex >= 0 {
                net = (allHoles[whichHole - 1].strokesPlayed - 2)
            }
            else {
                net = (allHoles[whichHole - 1].strokesPlayed - 1)
            }
        }

        switch net {
        case _ where net >= allHoles[whichHole - 1].par + 2:
            points = 0
            return points

        case _ where net == allHoles[whichHole - 1].par + 1:
            points = 1
            return points

        case _ where net == allHoles[whichHole - 1].par:
            points = 2
            return points

        case _ where net == allHoles[whichHole - 1].par - 1:
            points = 3
            return points

        case _ where net == allHoles[whichHole - 1].par - 2:
            points = 4
            return points

        case _ where net == allHoles[whichHole - 1].par - 3:
            points = 5
            return points

        case _ where net == allHoles[whichHole - 1].par - 4:
            points = 6
            return points

        default:
            points = 0
                        
            totalScore.insert(points, at: totalScore.count)
            
            return totalScore.reduce(points, +)
            
        }
    }
}
