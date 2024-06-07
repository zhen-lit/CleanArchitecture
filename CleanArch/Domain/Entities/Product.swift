//
//  Product.swift
//  CleanArch
//
//  Created by tanlinzhen on 2024/5/27.
//

struct Product: Identifiable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let image: String
    let rating: Rating
}
