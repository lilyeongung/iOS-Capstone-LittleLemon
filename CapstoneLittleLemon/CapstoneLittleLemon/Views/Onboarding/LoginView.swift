//
//  LoginView.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 7/3/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = ViewModel()

    @State var email = ""
    @State var password = ""
    
    @State var isLoggedIn = false
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                NavigationLink(destination: Menu(), isActive: $isLoggedIn) {}
                .navigationBarBackButtonHidden(true)
                
                Spacer()
                Spacer()
                
                // MARK: - Logo & Title View
                LogoTitleView(text: "Welcome back!")
                
                Spacer()
                
                // MARK: - Login Info View
                VStack {
                    TextField("Email", text: $email)
                        .signupTextFieldStyle()
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Password", text: $password)
                        .onboardingTextStyle()
                        .textInputAutocapitalization(.never)
                    
                    // TODO: Forgot password functionality
                    HStack {
                        Spacer()
                        Button("Forgot password?") {}
                            .font(.callout)
                            .buttonStyle(.borderless)
                    }
                    .padding(.vertical, 12)
                    
                }
                
                // MARK: - Button View
                Button("Log in") {
                    if viewModel.authenticateUser(email: email, password: password) {
                        
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(password, forKey: kPassword)
                        UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                        
                        // Navigation to HomeScreen()
                        isLoggedIn = true
                        
                    } else {
                        // Handle the case when any field is empty (i.e. show an alert)
                    }
                }
                .buttonStyle(PrimaryButtonStyle())
     
                Spacer(minLength: 250)
                
                // MARK: - Footer: -> Signup
        
                // How to color one word in a SwiftUI Text string and not cause line breaking oddities:
                NavigationLink(destination: SignUp().navigationBarBackButtonHidden(true)) {
                    Group {
                        Text("Don't have an account?").foregroundStyle(.primaryBlack) +
                        Text(" Sign up")
                    }
                    .font(.leadText())
                }
                
            }
            .padding(.horizontal, 50)
            .padding(.bottom, 50)
            
            
            .onAppear() {
                print("\(kIsLoggedIn)")
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                    
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
