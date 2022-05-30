//
//  APIData.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/05/11.
//

import Foundation




struct FinalData: Codable {
    let success: Bool
    let code: Int
    let msg: String
    let data: DataClass9
}

// MARK: - DataClass
struct DataClass9: Codable {
    let name, email, bojID: String
    let problemList: [ProblemList]

    enum CodingKeys: String, CodingKey {
        case name, email
        case bojID = "bojId"
        case problemList
    }
}

// MARK: - ProblemList
struct ProblemList: Codable {
    let id: Int
    let name: String
    let url: String
    let status: String
    let level: Int
    let categories: [String]
}










// MARK: - SpecificProblemData
struct SpecificProblemData3: Codable {
    let success: Bool
    let code: Int
    let msg: String
    let data: DataClass5
}

// MARK: - DataClass
struct DataClass5: Codable {
    let id: Int
    let name: String
    let url: String
    var status: String?
    let level: Int
    let categories: [String]
}








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
    let token, refreshToken, role:  String
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
    let title, content, writtenAt: String
}





// spsec

//struct SpsecificPostData: Codable {
//    let success: Bool
//    let code: Int
//    let msg: String
//    let data: DataClass2
//}
//
//// MARK: - DataClass
//struct DataClass2: Codable {
//    let id, problemID: Int
//    let title, content, author: String
//    let comments: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case problemID = "problemId"
//        case title, content, author, comments
//    }
//}
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let spsecificPostData = try? newJSONDecoder().decode(SpsecificPostData.self, from: jsonData)

import Foundation



struct SearchProblemData: Codable {
    let success: Bool
    let code: Int
    let msg: String
    let data: [searchedDatum]
}

// MARK: - Datum
struct searchedDatum: Codable {
    let id: Int
    let name: String
    let url: String
    let level: Int
    let categories: [String]
}


// MARK: - SpsecificPostData
struct SpsecificPostData: Codable {
    let success: Bool
    let code: Int
    let msg: String
    let data: DataClass2
}

// MARK: - DataClass
struct DataClass2: Codable {
    let id: Int
    let problemID: JSONNull?
    let title, content: String
    let author: String?
    let comments: [Comment]?

    enum CodingKeys: String, CodingKey {
        case id
        case problemID = "problemId"
        case title, content, author, comments
    }
}

// MARK: - Comment
struct Comment: Codable {
    let commentID: Int
    let author: String?
    let content: String

    enum CodingKeys: String, CodingKey {
        case commentID = "commentId"
        case author, content
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

