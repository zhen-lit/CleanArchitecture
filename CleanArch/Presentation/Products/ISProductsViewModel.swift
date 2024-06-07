//
//  ISProductsViewModel.swift
//  CleanArch
//
//  Created by tanlinzhen on 2024/5/27.
//

struct ProductPresentableItem: Identifiable {
    let id: String
    let title: String
    let description: String
    let category: String
    let price: String
    let image: String
    let rating: RatingPresentableItem
    
    struct RatingPresentableItem {
        let count: String
        let rate: String
    }
    
    init(domainProduct: Product) {
        self.id = String(domainProduct.id)
        self.title = domainProduct.title
        self.description = domainProduct.description
        self.category = domainProduct.category
        self.image = domainProduct.image
        self.price = String(domainProduct.price)
        self.rating = RatingPresentableItem(count: String(domainProduct.rating.count), rate: String(domainProduct.rating.rate))
        
    }
}

class ISProductsViewModel: ObservableObject {
    @Published var products: [ProductPresentableItem] = []
    @Published var loading: Bool = false
    
    private let getProductsList: GetProductListType
    
    init(getProductUseCase: GetProductListType) {
        self.getProductsList = getProductUseCase
    }
    
    public func retrieveProducts() -> Void {
        self.loading = true
        Task {
            let result = await getProductsList.execute()
            let productsList = try? result.get().map { ProductPresentableItem(domainProduct: $0) }
            
            Task { @MainActor in
                self.loading = false
                guard let productsList = productsList else {
                    return
                }
                
                self.products = productsList
            }
        }
        
    }
}
