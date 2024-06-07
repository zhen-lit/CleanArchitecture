//
//  GetProductListType.swift
//  CleanArch
//
//  Created by tanlinzhen on 2024/5/27.
//

import Foundation

protocol GetProductListType {
    func execute() async -> Result<[Product], ProductDomainError>
}
