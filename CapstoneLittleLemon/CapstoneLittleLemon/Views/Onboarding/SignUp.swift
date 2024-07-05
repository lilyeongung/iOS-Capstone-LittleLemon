//
//  SignUp.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 7/3/24.
//

import SwiftUI


struct SignUp: View {
    @StateObject private var viewModel = ViewModel()
    
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    
    @State var isLoggedIn = false
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {}
                    .navigationBarBackButtonHidden(true)
                
                Spacer()
                Spacer()
                
                // MARK: - Logo & Title View
                LogoTitleView(text: "Create Account")
                
                Spacer()
                
                // MARK: - User Info View
                VStack {
                    // Full Name field
                    
                    VStack(alignment: .leading) {
                        
                        
                        HStack {
                            TextField("First", text: $firstName)
                                .signupTextFieldStyle()
                            
                            TextField("Last name", text: $lastName)
                                .signupTextFieldStyle()
                        }
                        .autocorrectionDisabled()
                        
                    }
                    
                    // Email field
                    TextField("Email", text: $email)
                        .signupTextFieldStyle()
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    
                    // Password field
                    SecureField("Password", text: $password)
                        .onboardingTextStyle()
                        .textInputAutocapitalization(.never)
                    
                }
                .disableAutocorrection(true)
                
                if viewModel.errorMessageShow {
                    withAnimation() {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                }
                
                // MARK: - Button
                Button("Sign up") {
                    if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, password: password) {
                        
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(password, forKey: kPassword)
                        UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                        
                        UserDefaults.standard.set(true, forKey: kAccountChanges)
                        UserDefaults.standard.set(true, forKey: kOrderStatuses)
                        UserDefaults.standard.set(true, forKey: kSpecialOffers)
                        UserDefaults.standard.set(true, forKey: kNewsletter)
                        
                        firstName = ""
                        lastName = ""
                        email = ""
                        
                        // Navigation to HomeScreen()
                        isLoggedIn = true
                        
                        // DEBUG: Testing
                        print("Full name of user: \(firstName) \(lastName)")
                        print("Email: \(email)")
                        print("Password: \(password)")
                        
                        
                    } else {
                        print("All fields are required to be filled.")
                    }
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Spacer(minLength: 250)
                
                // MARK: - Footer: -> Login
                // Display LoginView if user already has an account
                NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                    Group {
                        Text("Already have an account?").foregroundStyle(.primaryBlack) +
                        Text(" Log in")
                    }
                    .font(.leadText())
                }
                
            }
            .padding(.horizontal, 50)
            .padding(.bottom, 50)

        }
        .onAppear() {
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignUp()
}
