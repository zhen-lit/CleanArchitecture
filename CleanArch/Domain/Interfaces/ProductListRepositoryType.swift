//
//  ProductListRepositoryType.swift
//  CleanArch
//
//  Created by tanlinzhen on 2024/5/27.
//

protocol ProductListRepositoryType {
    func getProductList() async -> Result<[Product], ProductDomainError>
}
