//
//  Home.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 6/28/24.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    
    var body: some View {
        TabView {
            Menu().environment(\.managedObjectContext, persistence.container.viewContext)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            // Additional tabs can be added here
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "list.dash")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}



#Preview {
    Home()
}
