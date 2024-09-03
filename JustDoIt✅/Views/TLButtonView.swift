//
//  TLButtonView.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 22/06/24.
//

import SwiftUI

struct TLButtonView: View {
    let title: String
    let background: Color
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                    .frame(height: 45)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }.padding()
        }
    }
}

#Preview {
    TLButtonView(title: "Login", background: .blue) {
        // Handle button action here
        //action here
        
    }
}
