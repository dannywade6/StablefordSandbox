//
//  HoleTabView.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 26/07/2022.
//

import SwiftUI

struct HoleTabItem: Identifiable {
    let id = UUID()
    let tag: Int
}

final class HoleTabViewModel: ObservableObject {
    @Published var tabItems: [HoleTabItem] = [HoleTabItem(tag: 1)]
    @Published var tabCount = 18
}

struct HoleTabView: View {
    @StateObject private var viewModel = HoleTabViewModel()
    
    var body: some View {
        TabView {
            ForEach(viewModel.tabItems) { item in
                Text("Hole \(item.tag)")
                
                VStack {
                    StablefordCalculatorParentView()
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .indexViewStyle(.page(backgroundDisplayMode: .never))
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct HoleTabView_Previews: PreviewProvider {
    static var previews: some View {
        HoleTabView()
    }
}
