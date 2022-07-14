//
//  ScoreCalculator.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 09/07/2022.
//

import SwiftUI

struct ScoreCalculator: View {
    
    @State private var selectedParIndex = 4
    @State private var inputGross = 3

    @State private var selectedStrokeIndex = 9
    let strokeIndexArray = Array(1...18)

    @State var holes = Array(1...18)
    @State var selection = 1

    @Environment(\.presentationMode) var presentatioMode

    var body: some View {
        TabView(selection: $selection) {
            ForEach(holes, id: \.self) { hole in

                ZStack {
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                guard selection > 1 else {
                                    return selection = 1
                                }
                                selection -= 1
                            }, label: {
                                Image(systemName: "arrow.left")
                            })
                            .foregroundColor(.green)
                            Spacer()
                            Text("Hole \(hole)")
                                .font(.headline)
                            Spacer()
                            Button(action: {
                                guard selection < 18 else {
                                    return selection = 18
                                }
                                selection += 1
                            }, label: {
                                Image(systemName: "arrow.right")
                            })
                            .foregroundColor(.green)
                            Spacer()
                        }

                        Spacer()
                        VStack {
                            Spacer()
                            Text("\(calculatePoints())")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.bottom, 0.75)
                            Text("Points")
                                .font(.title)
                            Spacer()
                        }
                        Spacer()
                        VStack {
                            Divider()

                            HStack {
                                Picker("Select Par:", selection: $selectedParIndex, content: {
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


                            HStack {
                                Text("Strokes Played")
                                    .bold()
                                    .padding()
                                Stepper("\(inputGross)", value: $inputGross, in: 1...11)
                                    .frame(width: 130, height: 80)
                            }

                            Spacer()

                            Divider()
                                .padding()
                        }


                        HStack {
                            Spacer()
                            Button(action: {
                                presentatioMode.wrappedValue.dismiss()
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
    
    func calculatePoints() -> Int {
        var net: Int = 0
        var points: Int = 0
        let handicap: Int = 18

        if handicap <= 18 {
            if handicap - selectedStrokeIndex >= 0 {
                net = (inputGross - 1)
            }
            else {
                net = inputGross
            }
        }

        if handicap > 18 {
            if (handicap - 18) - selectedStrokeIndex >= 0 {
                net = (inputGross - 2)
            }
            else {
                net = (inputGross - 1)
            }
        }

        switch net {
        case _ where net >= selectedParIndex + 2:
            points = 0
            return points

        case _ where net == selectedParIndex + 1:
            points = 1
            return points

        case _ where net == selectedParIndex:
            points = 2
            return points

        case _ where net == selectedParIndex - 1:
            points = 3
            return points

        case _ where net == selectedParIndex - 2:
            points = 4
            return points

        case _ where net == selectedParIndex - 3:
            points = 5
            return points
        case _ where net == selectedParIndex - 4:
            points = 6
            return points

        default:
            points = 0
            return points
        }
    }
}

struct ScoreCalculator_Previews: PreviewProvider {
    static var previews: some View {
        ScoreCalculator()
    }
}
