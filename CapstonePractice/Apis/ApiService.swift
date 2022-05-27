//
//  ApiService.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/26.
//

import Foundation
import Alamofire

class ApiService {
    
    static func getFailedProblems(completion:@escaping (SolvedProblems, SolvedProblems)->Void) {
        
        let triedUrl = "https://solved.ac/api/v3/search/problem?query=tried_by:qjxjzjq2"
        let solvedUrl = "https://solved.ac/api/v3/search/problem?query=solved_by:qjxjzjq2"
        
        var triedData: SolvedProblems?
        var solvedData: SolvedProblems?
        
        AF.request(triedUrl, method: .get).responseData { response in
            switch response.result {
            case .success(let value):
                let decoder = JSONDecoder()
                triedData = try! decoder.decode(SolvedProblems.self, from: value)
                
                AF.request(solvedUrl, method: .get).responseData { response in
                    switch response.result {
                    case .success(let value):
                        let decoder = JSONDecoder()
                        solvedData = try! decoder.decode(SolvedProblems.self, from: value)
            
                        completion(triedData!, solvedData!)
                    case .failure(let error):
                        print("what kind of error", error)
                    }
                }
//                completion(data)
            case .failure(let error):
                print("what kind of error", error)
            }
        }
        
    }
    
    static func getSolvedProblems(completion:@escaping (SolvedProblems)->Void) {
        
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
    
    static func getMyInfo() {
        print("checking")
        let url = URL(string: "http://3.39.233.19:8080/api/member/me")!
        
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
            print(str)
        }
        task.resume()
    }

    
    static func login(access_token: String, refresh_token: String, completion: @escaping (String) -> Void ) {
        
        let url = URL(string: "http://3.39.233.19:8080/sign/login/google/test")!
                
        
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
            let sodeul = try? JSONDecoder().decode(UserData.self, from: data)
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



