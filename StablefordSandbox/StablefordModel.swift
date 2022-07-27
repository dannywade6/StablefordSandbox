//
//  StablefordModel.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 20/07/2022.
//

import Foundation

struct StablefordModel: Identifiable {
    let id: String = UUID().uuidString
    let handicap: Int
//    let date: Date
    let redTee: Bool
    let yellowTee: Bool
    let whiteTee: Bool
    let blueTee: Bool
    let par: Int
    let gross: Int
    let strokeIndex: Int
    let hole: Int
}
