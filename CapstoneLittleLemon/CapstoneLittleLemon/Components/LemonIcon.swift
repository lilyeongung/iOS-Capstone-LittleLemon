//
//  LemonIcon.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 7/4/24.
//

import SwiftUI



struct LemonIcon: View {
    @State private var size = 1.0
    
    var body: some View {
        VStack {
            Image("lemon-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
        
    }
    
}

struct LemonIconClicked: View {
    @State private var size = 1.0
    
    var body: some View {
        VStack {
            Image("lemon-icon-clicked")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
        .scaleEffect(size)
        
        .onAppear(perform: {
            withAnimation(.easeIn(duration: 0.3)) {
                self.size = 1.25
            }
            
        })
    }
}




//
//
//#Preview {
//    LemonIcon()
//}
