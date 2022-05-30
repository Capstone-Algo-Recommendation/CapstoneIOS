//
//  ApiService + MyInfo.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/05/20.
//

import Foundation


extension ApiService {
    
    
    
    
    
    static func changeProblemStatus(problemNum: Int, status: String ,completion : @escaping (SpecificProblemData3) -> Void) {
    
        let url = URL(string: "http://3.39.233.19:8080/api/member/me/problemStatus")!
        var request = URLRequest(url: url)

        request.httpMethod = "PATCH"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        let a = UserDefaults.standard.string(forKey: StaticMembers.userToken)
        request.headers = ["X-AUTH-TOKEN": a!]
        
        
        let json: [String: Any] = [
            "problemId": problemNum,
            "problemStatus": status
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        request.httpBody = jsonData
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let str = String(decoding: data, as: UTF8.self)
            print(str, "from token")
            
            
//            let sodeul = try! JSONDecoder().decode(SpecificProblemData3.self, from: data)
//            completion(sodeul)

        }
        task.resume()
    }
    
    
    
    static func getSpecificProblemInfo(problemNum: Int, completion : @escaping (SpecificProblemData3) -> Void) {
    
        let url = URL(string: "http://3.39.233.19:8080/api/problem/\(problemNum)")!
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
            let sodeul = try! JSONDecoder().decode(SpecificProblemData3.self, from: data)
            completion(sodeul)

        }
        task.resume()
    }
    
    
    
    static func getInfoFromServer(pageNum: Int, completion : @escaping ([Datum]) -> Void) {
    
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
            print(str, "from token")
//            let sodeul = try? JSONDecoder().decode(Boards.self, from: data)
//            let d = sodeul!.data
//            completion(d)

        }
        task.resume()
    }
}


