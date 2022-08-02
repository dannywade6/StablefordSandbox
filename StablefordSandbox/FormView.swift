//
//  FormView.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 29/07/2022.
//

import SwiftUI

struct FormView: View {
    
    @EnvironmentObject var viewModel: HoleViewModel
    @EnvironmentObject var holeStorage: HoleStorage
    
    @Environment(\.presentationMode) var presentationMode
    
    let strokeIndexArray = Array(1...18)
    
    
    var body: some View {
        TabView(selection: $viewModel.whichHole) {
            ForEach(0..<(viewModel.allHoles.count + 1), id: \.self) { hole in
                
                ZStack {
                    VStack {
                        HStack {
                            Spacer()
                            
                            Button {
                                if viewModel.whichHole > 1 {
                                    viewModel.whichHole -= 1
                                }
                            } label: {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.green)
                                    .font(.largeTitle)
                            }
                            .foregroundColor(.green)
                            Spacer()
                            
                            Text("Hole \(viewModel.whichHole)")
                                .font(.headline)
                            
                            Spacer()
                            
                            Button {
                                if viewModel.whichHole < viewModel.allHoles.count {
                                    viewModel.whichHole += 1
                                }
                            } label: {
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.green)
                                    .font(.largeTitle)
                            }
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Spacer()
                            Text("\(viewModel.holeScore())")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.bottom, 0.75)
                            Text("Points")
                                .font(.title)
                            Spacer()
                            Text("Playing Handicap: \(viewModel.handicap)")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                                .bold()
                        }
                        Spacer()
                        VStack {
                            Divider()
                            
                            HStack {
                                Picker("Select Par:", selection: $viewModel.allHoles[viewModel.whichHole - 1].par, content: {
                                    Text("Par 3").tag(3)
                                    Text("Par 4").tag(4)
                                    Text("Par 5").tag(5)
                                })
                                .pickerStyle(.segmented)
                                .frame(width: 250, height: 80)
                            }
                        }
                        
                        VStack {
                            Divider()
                                .padding()
                            
                            
                            HStack {
                                Text("Stroke Index")
                                    .bold()
                                    .padding()
                                
                                Picker("Stroke Index", selection: $viewModel.allHoles[viewModel.whichHole - 1].strokeIndex)
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
                            
                            
                            HStack {
                                Text("Strokes Played")
                                    .bold()
                                    .padding()
                                Stepper("\(viewModel.allHoles[viewModel.whichHole - 1].strokesPlayed)", value: $viewModel.allHoles[viewModel.whichHole - 1].strokesPlayed, in: 1...11)
                                    .frame(width: 130, height: 80)
                            }
                            
                            Spacer()
                            
                            Divider()
                                .padding()
                        }
                        
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Discard Score")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.red)
                                    .padding()
                                    .padding(.horizontal, 10)
                                    .background(
                                        Capsule()
                                            .stroke(Color.red, lineWidth: 2.0))
                            })
                            .padding(.bottom)
                            
                            Spacer()
                            
                            Button(action: {
                                print("Exit View")
                            }, label: {
                                Text("Save Score")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.green)
                                    .padding()
                                    .padding(.horizontal, 10)
                                    .background(
                                        Capsule()
                                            .stroke(Color.green, lineWidth: 2.0))
                            })
                            .padding(.bottom)
                            Spacer()
                        }
                    }
                    .padding(.top)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .indexViewStyle(.page(backgroundDisplayMode: .never))
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
    }
}


struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
            .environmentObject(HoleViewModel())
            .environmentObject(HoleStorage())
    }
}
