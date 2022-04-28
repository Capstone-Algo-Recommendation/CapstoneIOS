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
    
    
    static func test(access_token: String, token_type: String, refresh_token: String, expir: Int, refrtokenEx: Int ) {
 
        let url = URL(string: "http://15.164.165.132/sign/login/google/test")!
        
        let json: [String: Any] = [
            "access_token": access_token,
            "token_type": token_type,
            "refresh_token": refresh_token,
            "expires_in": expir,
            "refresh_token_expires_in": refrtokenEx
        ]
        
//        let jsonData = try? JSONSerialization.data(withJSONObject: json)
//        let decode = JSONDecoder()
//        let b  = try! decode.decode(A1.self, from: jsonData!)
        
        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
//        request.httpBody = jsonData

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
