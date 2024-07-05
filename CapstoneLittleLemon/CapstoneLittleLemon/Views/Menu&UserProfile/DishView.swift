//
//  DishView.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 7/3/24.
//

import SwiftUI

struct DishView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let dish: Dish
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 150)
            Text(dish.title ?? "")
                .font(.subTitle())
                .foregroundColor(.primaryColor1)
            Spacer(minLength: 20)
            Text(dish.body ?? "")
                .font(.regularText())
            Spacer(minLength: 10)
            Text("$" + (dish.price ?? ""))
                .font(.highlightText())
                .foregroundColor(.primaryColor1)
                .monospaced()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    DishView(dish: PersistenceController.sampleDish())
}
