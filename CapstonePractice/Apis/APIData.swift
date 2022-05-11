//
//  APIData.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/05/11.
//

import Foundation


// MARK: - SolvedProblems2
struct SolvedProblems2: Codable {
    let code: Int
    let data: DataClass
    let success: Int
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let refreshToken, token: String
}
