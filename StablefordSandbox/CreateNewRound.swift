//
//  CreateNewRound.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 19/06/2022.
//

import SwiftUI

struct CreateNewRound: View {

    @State var golfCourseName: String = ""
    @State var selectedDate = Date()
    @State var inputHandicap: Int = 0

    @State var yellowTee: Bool = false
    @State var blueTee: Bool = false

    var body: some View {

        VStack(alignment: .leading, spacing: 10) {

            Text("Golf Course Name:")
                .font(.title)
                .fontWeight(.semibold)


            TextField("Golf Course Name", text: $golfCourseName)


            Text("Select Date:")
                .font(.title)
                .fontWeight(.semibold)
            

            DatePicker("", selection: $selectedDate, displayedComponents: .date)


            Text("Handicap:")
                .font(.title)
                .fontWeight(.semibold)

            TextField("Handicap", value: $inputHandicap, formatter: NumberFormatter())



            Text("Select Tee:")
                .font(.title)
                .fontWeight(.semibold)

            HStack {

                Button {
                    yellowTee.toggle()
                } label: {
                    if yellowTee {
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 50, height: 50)
                            .shadow(radius: 10)
                            .padding()
                            .overlay(
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            )
                    } else {
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 50, height: 50)
                            .shadow(radius: 10)
                            .padding()
                    }
                }

                Button {
                    blueTee.toggle()
                } label: {
                    if blueTee {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 50, height: 50)
                            .shadow(radius: 10)
                            .padding()
                            .overlay(
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            )
                    } else {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 50, height: 50)
                            .shadow(radius: 10)
                            .padding()
                    }
                }
            }




            HStack {
                Button {
                    print("Hello")
                } label: {
                    Text("Exit")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                        .padding()
                        .padding(.horizontal, 10)
                        .background(
                            Capsule()
                                .stroke(Color.red, lineWidth: 2.0)
                        )
                }
                Button {
                    print("Hello")
                } label: {
                    Text("Start Scoring")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                        .padding()
                        .padding(.horizontal, 10)
                        .background(
                            Capsule()
                                .stroke(Color.green, lineWidth: 2.0)
                        )
                }
            }
        }

    }
}

struct CreateNewRound_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewRound()
    }
}
