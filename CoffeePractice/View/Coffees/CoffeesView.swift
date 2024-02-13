//
//  CoffeesView.swift
//  CoffeePractice
//
//  Created by Makra Flórián Róbert on 2024. 02. 01..
//

import SwiftUI

struct CoffeesView: View {
    
    @Namespace var animation
    @StateObject var viewModel: CoffeesViewModel
    
    var body: some View {
        if viewModel.show {
            CoffeeDetailView(item: $viewModel.seledtedItem, animation: animation, show: $viewModel.show)
        } else {
            ScrollView {
                Text("Coffees")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding([.top, .bottom], 10)
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack {
                    ForEach(viewModel.items) { item in
                        CardView(animation: animation, item: item)
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                                    viewModel.seledtedItem = item
                                    viewModel.show.toggle()                  }
                            }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

private struct CardView: View {
    
    var animation: Namespace.ID
    var item: Coffee
    
    var body: some View {
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
            .cornerRadius(20)
        }
        .padding([.leading, .trailing], 20)
        .padding(.bottom, 10)
    }
}

#Preview("Coffee List View") {
    CoffeesView(viewModel: CoffeesViewModel())
}
