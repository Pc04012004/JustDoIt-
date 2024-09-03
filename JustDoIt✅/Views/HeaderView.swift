//
//  HeaderView.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 21/06/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let background: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 0, height: 0))
                .foregroundColor(background) // Use the passed background color
                .frame(width: 390, height: 400)
                .offset(y: 20)
            
            VStack {
                Text(title)
                    .font(.system(size: 35, design: .default))
                    .foregroundColor(.white)
                    .bold()
                    .offset(y: 40)
                
                Text(subtitle)
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .offset(y: 40)
            }
            .padding(.top, 100)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.size.width * 3, height: 170)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView(title: "Welcome", subtitle: "Please Register", background: .pink)
}
