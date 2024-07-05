//
//  LogoTitleView.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 7/3/24.
//

import SwiftUI

struct LogoTitleView: View {
    let text: String
    
    var body: some View {
        VStack {
            Image("little-lemon-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 100)
                .offset(x: -10)
            
            Text("\(text)")
                .font(.subTitle())
        }
    }
}

#Preview {
    LogoTitleView(text: "Herro")
}
