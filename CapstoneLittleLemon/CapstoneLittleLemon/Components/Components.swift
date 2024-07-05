//
//  Components.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 7/3/24.
//

import SwiftUI

struct Components: View {
    var body: some View {
        
        List {
            // Components: Buttons and TextFields
            Section {
                Button("Primary Button") {}
                    .buttonStyle(PrimaryButtonStyle())
                
                HStack {
                    Button("Secondary Button") {}
                        .buttonStyle(SecondaryButtonStyle())
                    
                    Button("Third Button") {}
                        .buttonStyle(ThirdButtonStyle())
                }
                HStack {
                    LemonIcon()
                    LemonIconClicked()
                }
            } header: {
                Text("Components")
            }
            
            
            // Markazi
            Section {
                Text("Display title")
                    .font(.displayTitle())
                
                Text("Sub title - Regular 40")
                    .font(.subTitle())
                
            } header: {
                Text("Markazi")
                    .font(.custom("MarkaziText-Regular", size: 30))
            }
            
            
            // Karla
            Section {
                
                Text("Lead text - Medium 18")
                    .font(.leadText())
                
                Text("Section Title - Extra Bold 20")
                    .font(.sectionTitle())
                    .textCase(.uppercase)
                
                Text("Section categories - Extra Bold 16")
                    .font(.sectionCategories())
                
                Text("Card title - Bold 18")
                    .font(.cardTitle())
                
                Text("Paragraph - Regular 16")
                    .font(.paragraphText())
                
                Text("Highlight - medium 16")
                    .font(.highlightText())
                
                
            } header: {
                Text("Karla")
                    .font(.custom("Karla-Regular", size: 20))
            }
            
            
        }
        .listStyle(.plain)
    
    }
}



// MARK: - Fonts: Markazi and Karla
extension Font {
    static func displayTitle() -> Font {
        return Font.custom("MarkaziText-Medium", size: 64)
    }
    
    static func subTitle() -> Font {
        return Font.custom("MarkaziText-Regular", size: 40)
    }
    
    static func leadText() -> Font {
        return Font.custom("Karla-Medium", size: 18)
    }
    
    static func sectionTitle() -> Font {
        return Font.custom("Karla-ExtraBold", size: 20)
        
    }
    
    static func sectionCategories() -> Font {
        return Font.custom("Karla-Medium", size: 16)
    }
    
    static func regularText() -> Font {
        return Font.custom("MarkaziText-Regular", size: 18)
    }
    
    static func cardTitle() -> Font {
        return Font.custom("Karla-Bold", size: 18)
    }
    
    static func paragraphText() -> Font {
        return Font.custom("Karla-Regular", size: 16)
    }
    
    static func highlightText() -> Font {
        return Font.custom("Karla-Medium", size: 16)
    }
}





// MARK: - Buttons
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundStyle(configuration.isPressed ? primaryWhite : primaryBlack)
            .font(.leadText())
            .padding(12)
            .background(configuration.isPressed ? primaryGreen : primaryYellow)
            .cornerRadius(8)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(configuration.isPressed ? .white : primaryWhite)
            .padding(12)
            .background(configuration.isPressed ? primaryGreen : secondaryGreen)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct ThirdButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        
            .foregroundStyle(configuration.isPressed ? primaryWhite : secondaryOrange)
            .padding(12)
//            .background(configuration.isPressed ? primaryGreen : secondaryOrange)
            .background(
                configuration.isPressed ? RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(.secondaryOrange, lineWidth: 10) : RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(.secondaryOrange, lineWidth: 2)
            )
//            .cornerRadius(8)
            .padding(.horizontal)
    }
}




// MARK: - [ToggleStyle] : Section Categories
struct CategoriesToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            // testing functionality
            print("init:  \(configuration.isOn)")
            configuration.isOn.toggle()
            print("after click:   \(configuration.isOn)")
        } label: {
            HStack {
                configuration.label
            }
        }
        .foregroundStyle(.primaryBlack)
        .font(.sectionCategories())
        .padding(10)
        .background { configuration.isOn ? Color.offWhite : .secondaryGreen }
        .cornerRadius(16)
    }
}


struct EmailNotifsToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            // testing functionality
            print("init:  \(configuration.isOn)")
            configuration.isOn.toggle()
            print("after click:   \(configuration.isOn)")
        } label: {
            HStack {
                configuration.isOn ? AnyView(LemonIcon()) : AnyView(LemonIconClicked())
                
                configuration.isOn ? configuration.label.font(.paragraphText()).foregroundStyle(.primaryBlack).scaleEffect(1) :  configuration.label.font(.paragraphText()).foregroundStyle(.secondaryOrange).scaleEffect(1.03)
            }
        }
    }
}







// MARK: - Text
extension Text {
    func profileTextStyle() -> some View {
        self
            .font(.highlightText())
            .foregroundStyle(.highlightGrey)
            .padding(.bottom, -4)
    }
}

// MARK: - TextField / SecureField Styles: Signup Form & General TextField Style
extension TextField {
    func signupTextFieldStyle() -> some View {
        self
            .foregroundStyle(.primaryBlack)
            .font(.paragraphText())
            .padding(12)
            .background(.offWhite)
            .cornerRadius(8)
    }
    
    func profileTextFieldStyle() -> some View {
        self
            .font(.highlightText())
            .foregroundStyle(.highlightGrey)
            .textFieldStyle(.roundedBorder)
    }
    
    func primaryTextFieldStyle() -> some View {
        self
            .foregroundStyle(.highlightGrey)
            .font(.leadText())
            .padding(12)
            .background(.primaryWhite)
            .cornerRadius(8)
    }
}


extension SecureField {
    func onboardingTextStyle() -> some View {
        self
            .foregroundStyle(.primaryBlack)
            .font(.paragraphText())
            .padding(12)
            .background(.offWhite)
            .cornerRadius(8)
    }
}


// MARK: - Colors
let primaryGreen = Color("primary-green")
let primaryYellow = Color("primary-yellow")
let primaryBlack = Color("primary-black")
let primaryWhite = Color("primary-white")

let secondaryGreen = Color("secondary-green")
let secondaryOrange = Color("secondary-orange")

let highlightGrey = Color("highlight-grey")
let offWhite = Color("off-white")





#Preview {
    Components()
}
