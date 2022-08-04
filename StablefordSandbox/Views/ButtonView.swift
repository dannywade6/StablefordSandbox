//
//  ButtonView.swift
//  StablefordSandbox
//
//  Created by Danny Wade on 04/08/2022.
//

import SwiftUI

struct ButtonView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
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
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
