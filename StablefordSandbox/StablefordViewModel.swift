//
//  StablefordViewModel.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 20/07/2022.
//

import Foundation

class StablefordViewModel: ObservableObject {
    
    let hole = StablefordModel(handicap: 18, redTee: false, yellowTee: false, whiteTee: true, blueTee: false, par: 4, gross: 4, strokeIndex: 1, hole: 4)
    
    func calculatePoints() -> Int {
        
        var net: Int = 0
        var points: Int = 0
        
        if hole.handicap <= 18 {
            if hole.handicap - hole.strokeIndex >= 0 {
                net = (hole.gross - 1)
            }
            else {
                net = hole.gross
            }
        }
        
        if hole.handicap > 18 {
            if (hole.handicap - 18) - hole.strokeIndex >= 0 {
                net = (hole.gross - 2)
            }
            else {
                net = (hole.gross - 1)
            }
        }
        
        switch net {
        case _ where net >= hole.par + 2:
            points = 0
            return points
            
        case _ where net == hole.par + 1:
            points = 1
            return points
            
        case _ where net == hole.par:
            points = 2
            return points
            
        case _ where net == hole.par - 1:
            points = 3
            return points
            
        case _ where net == hole.par - 2:
            points = 4
            return points
            
        case _ where net == hole.par - 3:
            points = 5
            return points
            
        case _ where net == hole.par - 4:
            points = 6
            return points
            
        default:
            points = 0
            return points
        }
    }
}
