//
//  CoffeePracticeApp.swift
//  CoffeePractice
//
//  Created by Makra Flórián Róbert on 2024. 02. 01..
//

import SwiftUI

@main
struct CoffeePracticeApp: App {
    var body: some Scene {
        WindowGroup {
            CoffeesView(viewModel: CoffeesViewModel())
        }
    }
}
