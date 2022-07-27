//
//  StablefordCalculatorChildView.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 26/07/2022.
//

import SwiftUI

struct StablefordCalculatorChildView: View {
    
    @State private var selectedParIndex = 4
    @State private var inputGross = 3
    
    @State private var selectedStrokeIndex = 9
    let strokeIndexArray = Array(1...18)
    
    @State var holes = Array(1...18)
    @State var selection = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(holes, id: \.self) { hole in
                ZStack {
                    VStack {
                        Text("2")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 0.75)
                        Text("Points")
                            .font(.title)
                        
                        VStack {
                            Divider()
                                .padding()
                            
                            HStack {
                                Picker("Select Par", selection: $selectedParIndex) {
                                    Text("Par 3").tag(3)
                                    Text("Par 4").tag(4)
                                    Text("Par 5").tag(5)
                                }
                                .pickerStyle(.segmented)
                                .frame(width: 250, height: 80)
                            }
                            
                            VStack {
                                Divider()
                                    .padding()
                                
                                HStack {
                                    Text("Stroke Index")
                                        .bold()
                                        .padding()
                                    
                                    Picker("Stroke Index", selection: $selectedStrokeIndex)
                                    {
                                        ForEach(Array(strokeIndexArray), id: \.self) {
                                            Text("\($0)")
                                        }
                                    }
                                    .frame(width: 110, height: 80)
                                    .clipped()
                                    .pickerStyle(WheelPickerStyle())
                                }
                                
                                Divider()
                                    .padding()
                            }
                            
                            HStack {
                                Text("Strokes Played")
                                    .bold()
                                    .padding()
                                
                                Stepper("\(inputGross)", value: $inputGross, in: 1...11)
                                    .frame(width: 130, height: 80)
                                
                            }
                            
                            
                            Divider()
                                .padding()
                        }
                    }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .indexViewStyle(.page(backgroundDisplayMode: .never))
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
    }

}




struct StablefordCalculatorChildView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StablefordCalculatorChildView()
        }
    }
}
