//
//  HoleStorage.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 02/08/2022.
//

import Foundation

struct Hole: Identifiable, Codable {
    var id = UUID()
    var points: Int
}

class HoleStorage: ObservableObject {
    @Published var holes = [Hole]() {
        didSet {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(holes), forKey: "hole")
        }
    }
    
    init() {
        if let data = UserDefaults.standard.value(forKey: "hole") as? Data {
            if let userDefaultScores = try? PropertyListDecoder().decode(Array<Hole>.self, from: data) {
                holes = userDefaultScores
            }
        }
    }
}
