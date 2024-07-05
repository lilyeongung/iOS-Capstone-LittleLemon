//
//  ViewModel.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 7/3/24.
//

import Foundation
import Combine

public let kFirstName = "first name key"
public let kLastName = "last name key"
public let kEmail = "e-mail key"
public let kPassword = "password key"
public let kIsLoggedIn = "loggedin key"



public let kOrderStatuses = "order statuses key"
public let kAccountChanges = "account changes key"
public let kSpecialOffers = "special offers key"
public let kNewsletter = "news letter key"

class ViewModel: ObservableObject {
    
    @Published var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @Published var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @Published var password = UserDefaults.standard.string(forKey: kPassword) ?? ""
    
    @Published var accountChanges = UserDefaults.standard.bool(forKey: kAccountChanges)
    @Published var orderStatuses = UserDefaults.standard.bool(forKey: kOrderStatuses)
    @Published var specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
    @Published var newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
    
    
    @Published var errorMessageShow = false
    @Published var errorMessage = ""
    
    @Published var searchText = ""
    
    func validateUserInput(firstName: String, lastName: String, email: String, password: String) -> Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            errorMessage = "All fields are required"
            errorMessageShow = true
            return false
        }
        
        guard email.contains("@") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        let email = email.split(separator: "@")
        
        guard email.count == 2 else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        guard email[1].contains(".") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        guard password.count >= 2 || password.isEmpty else {
            errorMessage = "Invalid password"
            errorMessageShow = true
            return false
        }
        errorMessageShow = false
        errorMessage = ""
        return true
    }
    
    // TODO: - Implement Authentication and Google Sign-in
    func authenticateUser(email: String, password: String) -> Bool {
        guard email.contains("@") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        let email = email.split(separator: "@")
        
        guard email.count == 2 else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        guard email[1].contains(".") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        guard password.count >= 2 || password.isEmpty else {
            errorMessage = "Invalid password"
            errorMessageShow = true
            return false
        }
        errorMessageShow = false
        errorMessage = ""
        return true
        
        
        
    }
    
    
    
    
    
}
