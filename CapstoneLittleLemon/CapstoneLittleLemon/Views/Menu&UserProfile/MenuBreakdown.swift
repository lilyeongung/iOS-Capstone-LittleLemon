////
////  MenuBreakdown.swift
////  CapstoneLittleLemon
////
////  Created by Andrew Park on 7/3/24.
////
//
//import SwiftUI
//
//struct MenuBreakdown: View {
//    
//    @State private var startersEnabled = true
//    @State private var mainsEnabled = true
//    @State private var dessertsEnabled = true
//    @State private var sidesEnabled = true
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Order for delivery!")
//                .font(.sectionTitle())
//                .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
//            
//            HStack(spacing: 15) {
//                Toggle("Starters", isOn: $startersEnabled)
//                
//                Toggle("Mains", isOn: $mainsEnabled)
//                
//                Toggle("Desserts", isOn: $dessertsEnabled)
//                
//                Toggle("Sides", isOn: $sidesEnabled)
//                
//            }
//            .toggleStyle(CategoriesToggle())
//            
//            Divider()
//                .padding(.top, 7)
//            
//        }
//        .padding(.horizontal, 22)
//        .padding(.top, 10)
//        .padding(.bottom, -7)
//    }
//}
//
//#Preview {
//    MenuBreakdown()
//}
