//
//  ApiService.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/26.
//

import Foundation
import Alamofire

class ApiService {
    
    static func getUserTriedByProblems(completion:@escaping (SolvedProblems)->Void) {
        
        let url = "https://solved.ac/api/v3/search/problem?query=tried_by:qjxjzjq2"
        
        AF.request(url, method: .get).responseData { response in
            switch response.result {
            case .success(let value):
                let decoder = JSONDecoder()
                let data = try! decoder.decode(SolvedProblems.self, from: value)
                completion(data)
            case .failure(let error):
                print("what kind of error", error)
            }
        }
    }

    
    static func login(access_token: String, refresh_token: String, completion: @escaping (String) -> Void ) {
        
        let url = URL(string: "http://15.164.165.132/sign/login/google/test")!
                
        
        let json: [String: Any] = [
            "access_token": access_token,
            "token_type": "asd",
            "refresh_token": refresh_token,
            "expires_in": 1000,
            "refresh_token_expires_in": 100
        ]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)


        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpBody = jsonData
    

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            
            let str = String(decoding: data, as: UTF8.self)
    
//            print(str)
            let sodeul = try? JSONDecoder().decode(UserData.self, from: data)
//            print(sodeul)
//            print("token is " , sodeul?.data.token)
            completion(sodeul?.data.token ?? "asd")
        }
        task.resume()
    }
    
    static func getUserSolvedProblems(completion:@escaping (SolvedProblems)->Void) {
        
        let url = "https://solved.ac/api/v3/search/problem?query=solved_by:qjxjzjq2"
        
        AF.request(url, method: .get).responseData { response in
            switch response.result {
            case .success(let value):
                let decoder = JSONDecoder()
                let data = try! decoder.decode(SolvedProblems.self, from: value)
                completion(data)
            case .failure(let error):
                print("what kind of error", error)
            }
        }
        
        
    }
}

struct A1: Codable{
    var access_token : String
    var token_type : String
    var refresh_token: String
    var expires_in: Int
    var refresh_token_expires_in:Int
}



// 게시글 관련
extension ApiService {
    
    static func getPostBoard(completion : @escaping ([Datum]) -> Void) {
        
        let url = URL(string: "http://15.164.165.132/api/board?page=0")!
        var request = URLRequest(url: url)

        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            
            let str = String(decoding: data, as: UTF8.self)
        
            
            let sodeul = try? JSONDecoder().decode(Boards.self, from: data)
            let d = sodeul!.data
            completion(d)
//            print(sodeul?.data)
            
            

        }
        
        task.resume()

    }
    
    
    // postId 숫자? 스트링
    static func getSpecificPost(postid: Int) {
        let url = URL(string: "http://15.164.165.132/api/board/\(postid)")!
        var request = URLRequest(url: url)

        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()
    }
    
    
    // 이거 problemId int? string?
    static func writePost(title: String, content: String, problemId: Int) {
        
        let url = URL(string: "http://15.164.165.132/api/board")!
        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        let json: [String: Any] = [
            "title": title,
            "content": content,
            "problemId": problemId
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()
    }
    
    static func changePost(postId: Int, title: String, content: String) {
        let url = URL(string: "http://15.164.165.132/api/board/\(postId)")!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        let json: [String: Any] = [
            "title": title,
            "content": content
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()
        
    }
    
//    static func deletePost() {
//        GET /api/board/delete
//    }
    
    
    
    
    // postid int?
    static func writeComment(postId: Int, content: String) {
        let url = URL(string: "http://15.164.165.132/api/board/\(postId)/comment")!
        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        let json: [String: Any] = [
            "content": content
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()
    }
    
    static func changeComment(postId: Int, content: String) {
        
        let url = URL(string: "http://15.164.165.132/api/board/\(postId)/comment")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "PATCH"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        let json: [String: Any] = [
            "content": content
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()

    }
    
    static func deleteComment(commentId: Int) {
        
        let url = URL(string: "http://15.164.165.132/api/board/comment/delete/\(commentId)")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()
    }
    
}
