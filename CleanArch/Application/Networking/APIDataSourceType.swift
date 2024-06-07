//
//  APIDataSourceType.swift
//  CleanArch
//
//  Created by tanlinzhen on 2024/5/27.
//

protocol APIDataSourceType {
    func getProductList() async -> Result<[ProductDTO], HTTPClientError>
}
