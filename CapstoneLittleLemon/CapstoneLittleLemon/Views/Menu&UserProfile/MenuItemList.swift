//
//  MenuItemList.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 7/3/24.
//

import SwiftUI

struct MenuItemList: View {
    // Required Logic
    @State private var searchText = ""
    
    let dish: Dish
    
//        func buildSortDescriptors() -> [NSSortDescriptor] {
//            return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
//        }
//    
//        func buildPredicate() -> NSPredicate {
//            if searchText.isEmpty {
//                return NSPredicate(value: true)
//            } else {
//                return NSPredicate(format: "title CONTAINS [cd] %@", searchText)
//            }
//        }
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(dish.title ?? "No title")")
                        .font(.cardTitle())
                    
                    Text("\(dish.body ?? "No description")")
                        .font(.paragraphText())
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    Text("$\(dish.price ?? "No price")")
                        .font(.highlightText())
                }
                .foregroundStyle(.primaryBlack)
                
                Spacer()
                // Dish image
                AsyncImage(url: URL(string: dish.image!)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .padding(.top, 10)
            }
            
            Divider()
                .padding(.vertical, 5)
        }
    }
    
}



#Preview {
    MenuItemList(dish: PersistenceController.sampleDish())
        .padding()
}
