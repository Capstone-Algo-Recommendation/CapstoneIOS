//
//  ApiService + MyInfo.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/05/20.
//

import Foundation


extension ApiService {
    
    static func sendIdInfo(bojId: String, name: String) {
        
        let url = URL(string: "http://15.164.165.132/api/member/me/init")!
        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        
//        “bojId” : 백준 아이디,
//        “name” : 이름(닉네임),
//        “problems”:[ 푼 문제 목록 ]
        
        
        let json: [String: Any] = [
            "bojId": bojId,
            "name": name,
            "problems": ""
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
    
}
