//
//  APIservice + Board.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/05/20.
//

import Foundation


extension ApiService {
    
    static func getPostBoard(pageNum: Int, completion : @escaping ([Datum]) -> Void) {
        
//        let url = URL(string: "http://15.164.165.132/api/board?page=\(pageNum)")!
        let url = URL(string: "http://3.39.233.19:8080/api/board?page=0")!
        var request = URLRequest(url: url)

        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        let a = UserDefaults.standard.string(forKey: StaticMembers.userToken)
        request.headers = ["X-AUTH-TOKEN": a!]
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let str = String(decoding: data, as: UTF8.self)
            print(str, "from token")
            let sodeul = try? JSONDecoder().decode(Boards.self, from: data)
            let d = sodeul!.data
            completion(d)

        }
        task.resume()
    }
    
    
    // postId 숫자? 스트링
    static func getSpecificPost(postid: Int, completion: @escaping (SpsecificPostData)-> Void) {
        let url = URL(string: "http://3.39.233.19:8080/api/board/\(postid)")!
        var request = URLRequest(url: url)

        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        let a = UserDefaults.standard.string(forKey: StaticMembers.userToken)
        
        request.headers = ["X-AUTH-TOKEN": a!]
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let str = String(decoding: data, as: UTF8.self)
            print("촏ㅊ", str)
            if let sodeul = try? JSONDecoder().decode(SpsecificPostData.self, from: data) {
                    completion(sodeul)
            }else {
                print("Bad")
            }
        }
        task.resume()
    }
    
    
    // 이거 problemId int? string?
    static func writePost(title: String, content: String) {
        
        let url = URL(string: "http://3.39.233.19:8080/api/board")!
        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        let json: [String: Any] = [
            "title": title,
            "content": content,
            "problemId": 12
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        request.httpBody = jsonData
//        request.addValue(value, forHTTPHeaderField: "key")
        
        let a = UserDefaults.standard.string(forKey: StaticMembers.userToken)
        request.headers = ["X-AUTH-TOKEN": a!]

        
        
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
        let url = URL(string: "http://3.39.233.19:8080/api/board/\(postId)")!
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
    static func writeComment(postId: Int, content: String, completion: @escaping ()->Void ) {
        let url = URL(string: "http://3.39.233.19:8080/api/board/\(postId)/comment")!
        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        let json: [String: Any] = [
            "content": content
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        let a = UserDefaults.standard.string(forKey: StaticMembers.userToken)
        request.headers = ["X-AUTH-TOKEN": a!]
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                completion()
            }
        }
        task.resume()
    }
    
    static func changeComment(postId: Int, content: String) {
        
        let url = URL(string: "http://3.39.233.19:8080/api/board/\(postId)/comment")!
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
        
        let url = URL(string: "http://3.39.233.19:8080/api/board/comment/delete/\(commentId)")!
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
