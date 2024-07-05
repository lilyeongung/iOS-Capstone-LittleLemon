//
//  CapstoneLittleLemonApp.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 7/3/24.
//

import SwiftUI

@main
struct CapstoneLittleLemonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StartView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
    
    
//    init() {
//        for family in UIFont.familyNames {
//            print("Family: \(family)")
//            for name in UIFont.fontNames(forFamilyName: family) {
//                print("   - \(name)")
//            }
//        }
//    }
    
}
