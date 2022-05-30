//
//  SolvedData.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/26.
//

import Foundation
struct ColdData: Codable {
    let success: Bool
    let code: Int
    let msg: String
    let data: [RecommendDatum?]
}

// MARK: - Datum
struct Datum8: Codable {
    let id: Int
    let name: String
    let level: Int
    let categories: [String]
}





// MARK: - RecommendData
struct RecommendData: Codable {
    let success: Bool
    let code: Int
    let msg: String
    let data: [RecommendDatum]
}

// MARK: - Datum
struct RecommendDatum: Codable {
    let id: Int
    let name: String
    let level: Int
    let categories: [String]
}






// MARK: - SolvedProblems
struct SolvedProblems: Codable {
    let count: Int
    let items: [Item]
}

//struct RecommendDatum: Codable {
//    let id: Int
//    let name: String
//    let url: String
//    let level: Int
//    let categories: [String]
//}

// MARK: - Item
struct Item: Codable {
    let problemID: Int
    let titleKo: String
    let isSolvable, isPartial: Bool
    let acceptedUserCount, level, votedUserCount: Int
    let isLevelLocked: Bool
    let averageTries: Double
    let official: Bool
    let tags: [Tag]

    enum CodingKeys: String, CodingKey {
        case problemID = "problemId"
        case titleKo, isSolvable, isPartial, acceptedUserCount, level, votedUserCount, isLevelLocked, averageTries, official, tags
    }
}

// MARK: - Tag
struct Tag: Codable {
    let key: String
    let isMeta: Bool
    let bojTagID, problemCount: Int
    let displayNames: [DisplayName]

    enum CodingKeys: String, CodingKey {
        case key, isMeta
        case bojTagID = "bojTagId"
        case problemCount, displayNames
    }
}

// MARK: - DisplayName
struct DisplayName: Codable {
    let language: Language
    let name, short: String
}

enum Language: String, Codable {
    case en = "en"
    case ko = "ko"
}
