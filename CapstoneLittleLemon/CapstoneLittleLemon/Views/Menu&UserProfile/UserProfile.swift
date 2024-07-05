//
//  UserProfile.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 6/28/24.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var accountChanges = false
    @State private var orderStatuses = false
    @State private var specialOffers = false
    @State private var newsletter = false
    
    @State private var isLoggedOut = false
    
    @State private var fullName = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    
    
    
    var body: some View {
        
        
        VStack {
            NavigationLink(destination: StartView().navigationBarBackButtonHidden(true), isActive: $isLoggedOut) {}
                .hidden()

            Header(backButtonEnabled: true)
            
            Divider()
            
            
            
            VStack(alignment: .leading) {
                
                Section(header: Text("Personal Information")) {
                    
                    ZStack(alignment: .bottom) {
                        HStack {
                            VStack(alignment: .leading) {
                                
                                
                                // Avatar
                                Text("Avatar")
                                    .font(.highlightText())
                                    .foregroundStyle(.highlightGrey)
                                
                                Image("profile-image-placeholder")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .background(.blue)
                                    .clipShape(Circle())
                                
                                
                            }
                            
                            Spacer()
                            
                        }
                        
                        
                        // Edit Avatar Buttons
                        // TODO: - Implement Image upload
                        HStack(spacing: -15) {
                            Button("Change") {}
                                .font(.leadText())
                                .buttonStyle(SecondaryButtonStyle())
                            
                            Button("Remove") {}
                                .font(.leadText())
                                .buttonStyle(ThirdButtonStyle())
                            
                            
                        }
                        .padding(.bottom, -20)
                        
                        
                    }
                    .padding(.bottom, 30)
                }
                .font(.cardTitle())
                
                
                
                
                // MARK: - User Information
                VStack(alignment: .leading, spacing: 10) {
                    
                    
                    
                    Text("Name")
                        .profileTextStyle()
                    
                    TextField("\(firstName) \(lastName)", text: $fullName)
                        .profileTextFieldStyle()
                    
                    Text("Email")
                        .profileTextStyle()
                    
                    TextField("\(email)", text: $email)
                        .profileTextFieldStyle()
                    
                    Text("Password")
                        .profileTextStyle()
                    
                    TextField("\(password)", text: $password)
                        .profileTextFieldStyle()
                    
                }
                
                Spacer()
                Spacer()
                
                // MARK: - Email notifications
                // TODO: Make these custom toggles with style and logo: EmailNotificationsView
                
                
                Section(header: Text("Email notifications")) {
                    Group {
                        Toggle("Account changes", isOn: $accountChanges)
                        
                        Toggle("Order statuses", isOn: $orderStatuses)
                        
                        
                        Toggle("Special offers", isOn: $specialOffers)
                        
                        
                        Toggle("Newsletter", isOn: $newsletter)
                        
                        
                    }
                    .toggleStyle(EmailNotifsToggle())
                    .offset(x: -3)
                    
                }
                .font(.cardTitle())
            }
            
            Spacer()
            
            
            // MARK: - Logout / Edit buttons
            VStack {
                Button("Logout") {
                    PersistenceController.shared.clear()
                    
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    UserDefaults.standard.set("", forKey: kFirstName)
                    UserDefaults.standard.set("", forKey: kLastName)
                    UserDefaults.standard.set("", forKey: kEmail)
                    UserDefaults.standard.set("", forKey: kPassword)
                    
                    
                    UserDefaults.standard.set(false, forKey: kAccountChanges)
                    UserDefaults.standard.set(false, forKey: kOrderStatuses)
                    UserDefaults.standard.set(false, forKey: kSpecialOffers)
                    UserDefaults.standard.set(false, forKey: kNewsletter)
                    
                    isLoggedOut = true
                    
                }
                .buttonStyle(PrimaryButtonStyle())
                
                
                HStack(spacing: 4) {
                    
                    
                    
                    Button("Discard change") {
                        firstName = viewModel.firstName
                        lastName = viewModel.lastName
                        email = viewModel.email
                        password = viewModel.password
                        
                        accountChanges = viewModel.accountChanges
                        orderStatuses = viewModel.orderStatuses
                        specialOffers = viewModel.specialOffers
                        newsletter = viewModel.newsletter
                        
                        self.presentation.wrappedValue.dismiss()
                    }
                    .font(.leadText())
                    .buttonStyle(ThirdButtonStyle())
                    
                    Button("Save change") {
                        if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, password: password) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(password, forKey: kPassword)
                            
                            UserDefaults.standard.set(accountChanges, forKey: kAccountChanges)
                            UserDefaults.standard.set(orderStatuses, forKey: kOrderStatuses)
                            UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
                            UserDefaults.standard.set(newsletter, forKey: kNewsletter)
                            
                            self.presentation.wrappedValue.dismiss()
                        }
                    }
                    .font(.leadText())
                    .buttonStyle(SecondaryButtonStyle())
                }
                
            }
            
        }
        .padding(20)
        .onAppear {
            firstName = viewModel.firstName
            lastName = viewModel.lastName
            email = viewModel.email
            password = viewModel.password
            
            accountChanges = viewModel.accountChanges
            orderStatuses = viewModel.orderStatuses
            specialOffers = viewModel.specialOffers
            newsletter = viewModel.newsletter
        }
        
    }
}


#Preview {
    UserProfile()
}
