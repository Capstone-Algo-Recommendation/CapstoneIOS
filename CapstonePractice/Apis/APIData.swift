//
//  APIData.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/05/11.
//

import Foundation


// MARK: - SolvedProblems2
// MARK: - UserData
struct UserData: Codable {
    let success: Bool
    let code: Int
    let msg: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let token, refreshToken: String
}



struct Boards: Codable {
    let success: Bool
    let code: Int
    let msg: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let title, content: String
}
