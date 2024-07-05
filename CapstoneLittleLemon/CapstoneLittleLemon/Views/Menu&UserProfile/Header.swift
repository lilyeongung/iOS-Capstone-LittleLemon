//
//  Header.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 7/3/24.
//

import SwiftUI

struct Header: View {
    
    //    let isUserProfile = false
    @State var isUserProfile = false
    @Environment(\.dismiss) var dismiss
    
    //    @State var bbEnabled = 0.0
    let backButtonEnabled: Bool
    
    var body: some View {
        
        HStack {
            if backButtonEnabled == true {
                
                // I want this button to only be enabled in userprofile view
                Button {
                    //                    bbEnabled = 1.0
                    print("Go back to menu screen")
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .foregroundStyle(.secondaryGreen)
                        .opacity(1)
                }
            } else {
                Spacer()
            }
            
            Spacer()
            
            Image("little-lemon-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 130)
            
            Spacer()
            
            
            // MARK: link to UserProfile
            if backButtonEnabled == false {
                NavigationLink {
                    UserProfile()
                } label: {
                    Image("profile-image-placeholder")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .background(.highlightGrey)
                                        .opacity(0.7)
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                
            } else {
                Image("profile-image-placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .background(.highlightGrey)
                    .opacity(0.3)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            
        }
        .padding(.top, -10)
        .padding(.horizontal, 12)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Header(backButtonEnabled: false)
}
