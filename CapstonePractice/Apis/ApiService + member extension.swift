//
//  ApiService + member extension.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/05/06.
//

import Foundation

extension ApiService {
    static func meInit(bojId: String, name: String, problems: [SolvedProblems] ) {
 
        let url = URL(string: "http://15.164.165.132/api/member/me/init")!
        
        let json: [String: Any] = [
            "bojId": bojId,
            "name": name,
            "problems": problems,
            
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
            if let responseJSON = responseJSON as? [String: Any] {
                
                // TODO: login 했을시 acess token 처리해야 됨
                print(responseJSON)
                
                
                
                
                
                
            }
        }
        task.resume()
    }

}
