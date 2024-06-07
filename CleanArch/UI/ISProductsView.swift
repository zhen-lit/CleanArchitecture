//
//  ISProductsView.swift
//  CleanArch
//
//  Created by tanlinzhen on 2024/5/27.
//

struct ISProductsView: View {
    @ObservedObject var viewModel = ProductListFactory.create()
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            if viewModel.loading {
                ProgressView()
            } else {
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 20) {
                        ForEach(viewModel.products) { product in
                            ISProductItem(product: product)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.retrieveProducts()
        }
        .background(Color("Background"))
    }
}

#Preview {
    ISProductsView()
}
