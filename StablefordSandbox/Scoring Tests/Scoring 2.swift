//
//  Scoring 2.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 19/06/2022.
//

import SwiftUI

struct Scoring_2: View {

    var tabData = [
        TabItem(title: Text("Hole 1"), par: 4, score: 5, tag: 1),
        TabItem(title: Text("Hole 2"), par: 5, score: 5, tag: 2),
        TabItem(title: Text("Hole 3"), par: 3, score: 5, tag: 3)
    ]

    @State var selectedTab = 0

    var body: some View {

        TabView(selection: $selectedTab) {
            ForEach(tabData) { tabItem in

                Text("Screen: \(tabItem.tag)")

                    .tabItem {
                        tabItem.title
                    }
            }

        }
    }
}


struct TabItem: Identifiable {
    var id = UUID()
    var title: Text
    var par: Int
    var score: Int
    var tag: Int
}



struct Scoring_2_Previews: PreviewProvider {
    static var previews: some View {
        Scoring_2()
    }
}
