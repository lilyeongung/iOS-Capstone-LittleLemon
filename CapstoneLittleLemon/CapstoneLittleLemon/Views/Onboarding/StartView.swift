//
//  StartView.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 7/3/24.
//

import SwiftUI

struct StartView: View {
    @State private var size = 1.0
    @State private var opacity = 0.5
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                
                VStack {
                    Image("little-lemon-onStart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Text("A fresh taste of the mediterranean")
                        .font(.highlightText())
                        .foregroundStyle(.highlightGrey)
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.3)){
                        self.size = 1.2
                        self.opacity = 1.0
                    }
                }
                
                
                Spacer()
                Spacer()
                Spacer()
                
                // Change to Onboarding View
                NavigationLink(destination: SignUp().navigationBarBackButtonHidden(true)) {
                    Text("Get Started")
                        .font(.leadText())
                        .foregroundStyle(.primaryBlack)
                        .padding(12)
                        .background(.primaryYellow)
                        .cornerRadius(8)
                        .opacity(opacity)
                }
                
                .onAppear{
                    withAnimation(.easeIn(duration: 1.3)){
                        self.opacity = 1.0
                    }
                }
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    StartView()
}
