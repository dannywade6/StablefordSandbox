//
//  Scoring 3.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 19/06/2022.
//

import SwiftUI

struct Scoring_3: View {
    var body: some View {
        TabView {
            RedView().edgesIgnoringSafeArea(.top)
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("First Tab")
                }

            BlueView().edgesIgnoringSafeArea(.top)
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Second Tab")
                }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct RedView: View {
    var body: some View {
        Color.red
    }
}

struct BlueView: View {
    var body: some View {
        Color.blue
    }
}

struct Scoring_3_Previews: PreviewProvider {
    static var previews: some View {
        Scoring_3()
    }
}
