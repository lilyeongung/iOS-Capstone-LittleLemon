//
//  MenuList.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 7/3/24.
//

import Foundation
import CoreData

struct MenuList: Decodable{
    let menu: [MenuItem]
    

    
//    static func getMenuData(viewContext: NSManagedObjectContext) {
//        PersistenceController.shared.clear()
//        
//        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
//        let request = URLRequest(url: url!)
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request) { data, response, error in
//            if let data = data {
//                let decoder = JSONDecoder()
//                if let fullMenu = try? decoder.decode(MenuList.self, from: data) {
//                    for dish in fullMenu.menu {
//                        let newDish = Dish(context: viewContext)
//                        newDish.title = dish.title
//                        newDish.price = dish.price
//                        newDish.body = dish.description
//                        newDish.image = dish.image
//                        newDish.category = dish.category
//                    }
//                    try? viewContext.save()
//                } else {
//                    print(error.debugDescription.description)
//                }
//            } else {
//                print(error.debugDescription.description)
//            }
//        }
//        dataTask.resume()
//    }
}
