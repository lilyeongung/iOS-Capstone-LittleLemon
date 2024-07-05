//
//  Menu.swift
//  LittleLemon
//
//  Created by Andrew Park on 6/28/24.
//

import Foundation
import SwiftUI
import CoreData
 
struct Menu: View {
    //    let dish: Dish
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var isLoaded = false
    @State var searchText = ""
    
    @State private var startersEnabled = true
    @State private var mainsEnabled = true
    @State private var dessertsEnabled = true
    @State private var sidesEnabled = true
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                // MARK: - Create Header() file
                Header(backButtonEnabled: false)
                
                // MARK: - Hero Section
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading, spacing: -25) {
                        Text("Little Lemon")
                            .font(.displayTitle())
                            .foregroundStyle(.primaryYellow)
                        
                        Text("San Francisco")
                            .font(.subTitle())
                            .foregroundStyle(.primaryWhite)
                    }
                    
                    HStack {
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .font(.leadText())
                            .foregroundStyle(.primaryWhite)
                            .frame(width: 220, height: 120)
                        
                        Spacer()
                        
                        Image("hero-image")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(16)
                    }
                    .frame(width: .infinity)
                    .padding(.top, -35)
                    
                    
                    // Searchbar
                    TextField("\(Image(systemName: "magnifyingglass")) Search",
                              text: $searchText)
                    .primaryTextFieldStyle()
                    .padding(.bottom, 10)
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 20)
                .frame(width: 400, height: 280)
                .background(.primaryGreen)
            
                
                // MARK: - MenuBreakdown
                VStack(alignment: .leading) {
                    Text("Order for delivery!")
                        .font(.sectionTitle())
                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    
                    HStack(spacing: 15) {
                        Toggle("Starters", isOn: $startersEnabled)
                        
                        Toggle("Mains", isOn: $mainsEnabled)
                        
                        Toggle("Desserts", isOn: $dessertsEnabled)
                        
                        Toggle("Sides", isOn: $sidesEnabled)
                        
                    }
                    .toggleStyle(CategoriesToggle())
                    
                    Divider()
                        .padding(.top, 7)
                    
                }
                .padding(.horizontal, 22)
                .padding(.top, 10)
                .padding(.bottom, -7)
                
                Spacer(minLength: 20)
                // MARK: - MenuList
                FetchedObjects(
                    predicate: buildPredicate(searchText: searchText, startersEnabled: startersEnabled, mainsEnabled: mainsEnabled, dessertsEnabled: dessertsEnabled, sidesEnabled: sidesEnabled),
                    sortDescriptors: buildSortDescriptors()
                ) { (dishes: [Dish]) in
                    ScrollView {
                        ForEach(dishes) { dish in
                            // Dish View
                            NavigationLink(destination: DishView(dish: dish)) {
                                MenuItemList(dish: dish)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .padding(.horizontal, 22)
                }
            }
            
            .onAppear() {
                if !isLoaded {
                    getMenuData()
                    isLoaded = true
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    
    // MARK: - Fetching Menu Data Logic
    func getMenuData() {
        // Clear the existing data in Core Data
        PersistenceController.shared.clear()
        
        guard let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json") else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let menuList = try JSONDecoder().decode(MenuList.self, from: data)
                    
                    menuList.menu.forEach { menuItem in
                        let dish = Dish(context: viewContext)
                        dish.title = menuItem.title
                        dish.body = menuItem.description
                        dish.price = menuItem.price
                        dish.image = menuItem.image
                        dish.category = menuItem.category
                    }
                    try? viewContext.save()
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
    
    // MARK: - Sorting & Filtering Core Data
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate(searchText: String, startersEnabled: Bool, mainsEnabled: Bool, dessertsEnabled: Bool, sidesEnabled: Bool) -> NSPredicate {
        var subpredicates: [NSPredicate] = []
        
        // Search text predicate
        if !searchText.isEmpty {
            let searchPredicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
            subpredicates.append(searchPredicate)
        }
        
        // Category filters
        if !startersEnabled {
            let startersPredicate = NSPredicate(format: "category != %@", "starters")
            subpredicates.append(startersPredicate)
        }
        if !mainsEnabled {
            let mainsPredicate = NSPredicate(format: "category != %@", "mains")
            subpredicates.append(mainsPredicate)
        }
        if !dessertsEnabled {
            let dessertsPredicate = NSPredicate(format: "category != %@", "desserts")
            subpredicates.append(dessertsPredicate)
        }
        if !sidesEnabled {
            let drinksPredicate = NSPredicate(format: "category != %@", "drinks")
            subpredicates.append(drinksPredicate)
        }
        
        // Combine subpredicates using AND operator
        return NSCompoundPredicate(andPredicateWithSubpredicates: subpredicates)
    }
    

}



#Preview {
    Menu()
}
