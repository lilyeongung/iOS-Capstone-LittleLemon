//
//  MenuItem.swift
//  CapstoneLittleLemon
//
//  Created by Andrew Park on 7/3/24.
//

import Foundation

struct MenuItem: Decodable {
    let title : String
    let description: String
    let price: String
    
    let image: String
    let category: String
}
