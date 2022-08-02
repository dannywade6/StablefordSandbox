//
//  StablefordCalculatorParentView.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 26/07/2022.
//

//import SwiftUI
//
//struct StablefordCalculatorParentView: View {
//    
//    @State private var selectedParIndex = 4
//    @State private var inputGross = 3
//
//    @State private var selectedStrokeIndex = 9
//    let strokeIndexArray = Array(1...18)
//
//    @State var holes = Array(1...18)
//    @State var selection = 1
//    
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        ZStack {
//            VStack {
//                HStack {
//                    Spacer()
//                    Button(action: {
//                        guard selection > 1 else {
//                            return selection = 1
//                        }
//                        selection -= 1
//                    }, label: {
//                        Image(systemName: "arrow.left")
//                            .font(.title)
//                    })
//                    .foregroundColor(.green)
//                    Spacer()
//                    Text("Hole 1")
//                        .font(.headline)
//                    Spacer()
//                    Button(action: {
//                        guard selection < 18 else {
//                            return selection = 18
//                        }
//                        selection += 1
//                    }, label: {
//                        Image(systemName: "arrow.right")
//                            .font(.title)
//                    })
//                    .foregroundColor(.green)
//                    Spacer()
//                    
//                }
//                .padding(.top, 5)
//                    
//                
//                Spacer()
//                
//                StablefordCalculatorChildView()
//                
//                Spacer()
//                
//                HStack {
//                    HStack {
//                        Spacer()
//                        Button(action: {
//                            presentationMode.wrappedValue.dismiss()
//                        }, label: {
//                            Text("Discard Score")
//                                .font(.headline)
//                                .fontWeight(.semibold)
//                                .foregroundColor(.red)
//                                .padding()
//                                .padding(.horizontal, 10)
//                                .background(
//                                    Capsule()
//                                        .stroke(Color.red, lineWidth: 2.0))
//                        })
//                        .padding(.bottom)
//
//                        Spacer()
//
//                        Button(action: {
//                            print("Exit View")
//                        }, label: {
//                            Text("Save Score")
//                                .font(.headline)
//                                .fontWeight(.semibold)
//                                .foregroundColor(.green)
//                                .padding()
//                                .padding(.horizontal, 10)
//                                .background(
//                                    Capsule()
//                                        .stroke(Color.green, lineWidth: 2.0))
//                        })
//                        .padding(.bottom)
//                        Spacer()
//                    }
//                }
//                .padding(.top)
//                    
//                }
//        }
//    }
//}
//
//struct StablefordCalculatorParentView_Previews: PreviewProvider {
//    static var previews: some View {
//        StablefordCalculatorParentView()
//    }
//}
