//
//  Scoring.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 19/06/2022.
//

import SwiftUI

struct Scoring: View {
    var body: some View {
        TabView {
            Text("Page 1")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Page 1")
                }
            Text("Page 2")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Page 2")
                }
            Text("Page 3")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Page 3")
                }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct Scoring_Previews: PreviewProvider {
    static var previews: some View {
        Scoring()
    }
}
