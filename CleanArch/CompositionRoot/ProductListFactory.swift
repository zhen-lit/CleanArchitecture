//
//  ProductListFactory.swift
//  CleanArch
//
//  Created by tanlinzhen on 2024/5/27.
//

class ProductListFactory {
    static func create() -> ISProductsViewModel {
        return ISProductsViewModel(getProductUseCase: createUseCase())
    }
    
    private static func createUseCase() -> GetProductListType {
        return GetProductList(repository: createRepository())
    }
    
    private static func createRepository() -> ProductListRepositoryType {
        return ProductRepository(apiDataSource: createDataSource())
    }
    
    private static func createDataSource() -> APIDataSourceType {
        return APIProductDataSource(httpClient: HTTPClient(errorResolver: ErrorResolver()))
    }
}
