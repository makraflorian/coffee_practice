//
//  CoffeeDetailView.swift
//  CoffeePractice
//
//  Created by Makra Flórián Róbert on 2024. 02. 01..
//

import SwiftUI

struct CoffeeDetailView: View {
    
//    @EnvironmentObject var viewModel: CoffeesViewModel
    @Binding var item: Coffee
    var animation: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        ScrollView {
            Button("close") {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)) {
                    show.toggle()
                }
            }
            VStack(spacing: 0) {
                Image("Coffee")
                    .resizable()
                    .matchedGeometryEffect(id: item.image, in: animation)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .bottomLeading) {
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text(item.description)
                                .font(.headline)
                        }
                        .matchedGeometryEffect(id: item.id, in: animation)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(.ultraThinMaterial.opacity(0.75))
                    }
                ForEach(item.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                }
            }
            .padding(.bottom, 10)
        }
    }
}

//struct CoffeeDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoffeeDetailView()
//    }
//}
