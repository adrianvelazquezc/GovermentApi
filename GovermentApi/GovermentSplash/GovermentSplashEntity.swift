//
//  GovermentSplashEntity.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import Foundation

struct Pagination: Codable {
    let pageSize: Int
    let page: Int
    let total: Int
}

struct Result: Codable {
    let id: String
    let dateInsert: String
    let slug: String
    let columns: String
    let fact: String
    let organization: String
    let resource: String
    let url: URL
    let operations: String
    let dataset: String
    let createdAt: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case dateInsert = "date_insert"
        case slug, columns, fact, organization, resource, url, operations, dataset
        case createdAt = "created_at"
    }
}

public struct Response: Codable {
    let pagination: Pagination
    let results: [Result]
}
