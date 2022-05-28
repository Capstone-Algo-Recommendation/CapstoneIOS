//
//  ApiService + Recommend.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/05/27.
//

import Foundation




extension ApiService {
    static func getRecommendation(completion: @escaping (RecommendData)-> Void) {
        
        print("is this working?")
        let url = URL(string: "http://3.39.233.19:8080/api/problem/recommendation")!
        var request = URLRequest(url: url)
        
        let a = UserDefaults.standard.string(forKey: StaticMembers.userToken)
        
        request.headers = ["X-AUTH-TOKEN": a!]

        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
//            let str = String(decoding: data, as: UTF8.self)
            if let sodeul = try? JSONDecoder().decode(RecommendData.self, from: data) {
                    completion(sodeul)
            }else {
                print("Bad")
            }
        }
        task.resume()
    }
}
