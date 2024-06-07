//
//  ProductRepository.swift
//  CleanArch
//
//  Created by tanlinzhen on 2024/5/27.
//

class ProductRepository: ProductListRepositoryType {
    
    private let apiDataSource: APIDataSourceType
    
    init(apiDataSource: APIDataSourceType) {
        self.apiDataSource = apiDataSource
    }
    
    func getProductList() async -> Result<[Product], ProductDomainError> {
        let result = await apiDataSource.getProductList()
        
        guard let productList = try? result.get() else {
            guard case .failure(_) = result else {
                return .failure(.generic)
            }
            
            return .failure(.generic)
        }
        
        return .success(productList.compactMap({ productDTO in
            return Product(id: productDTO.id,
                           title: productDTO.title,
                           description: productDTO.description,
                           category: productDTO.category,
                           price: productDTO.price,
                           image: productDTO.image,
                           rating: Rating(count: productDTO.rating.count, rate: productDTO.rating.rate))
        }))
    }
}
