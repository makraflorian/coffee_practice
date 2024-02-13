//
//  Coffee.swift
//  CoffeePractice
//
//  Created by Makra Flórián Róbert on 2024. 02. 01..
//

import Foundation

struct Coffee: Identifiable, Hashable {
    var id: Int
    var title: String
    var description: String
    var ingredients: [String]
    var image: String
}

var items = [
    Coffee(id: 1, title: "Coffee", description: "nyamnyam", ingredients: ["coffee", "ice"], image: "https://images.ctfassets.net/v601h1fyjgba/4GLzOncHIe8rq3xY099cZ/dd17ce72ebb6fb01659c763fe64953db/Iced_Latte.jpg"),
    Coffee(id: 2, title: "Coffee ice", description: "nyamnyam", ingredients: ["coffee", "ice"], image: "https://upload.wikimedia.org/wikipedia/commons/d/d8/Blue_Bottle%2C_Kyoto_Style_Ice_Coffee_%285909775445%29.jpg")]
