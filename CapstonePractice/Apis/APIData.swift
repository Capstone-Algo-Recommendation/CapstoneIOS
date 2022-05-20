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


// MARK: - ProblemTOSend
struct ProblemTOSend: Codable {
    let id: Int
    let name, url, status: String
}

struct BojInfo :Codable {
    let bojId: String
    let name: String
    let problems: [ProblemTOSend]
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
