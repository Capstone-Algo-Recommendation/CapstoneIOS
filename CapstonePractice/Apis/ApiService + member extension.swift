//
//  ApiService + member extension.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/05/06.
//

import Foundation

extension ApiService {
    
    
    static func meInit(bojId: String, name: String) {
       
        let problemUrl = "https://www.acmicpc.net/problem/"
        let url = URL(string: "http://15.164.165.132/api/member/me/init")!
        var problemDatas: [ProblemTOSend] = []
        
        
        var solvedTitles: [String] = []
        getFailedProblems { tried, solved in
            for it in solved.items {
                problemDatas.append(ProblemTOSend(id: it.problemID, name: it.titleKo, url: problemUrl + "\(it.problemID)", status: "COMPLETE"))
                solvedTitles.append(it.titleKo)
            }
            
            let failed = tried.items.filter { item in
                !solvedTitles.contains(item.titleKo)
            }
            
            for it in failed {
                problemDatas.append(ProblemTOSend(id: it.problemID, name: it.titleKo, url: problemUrl + "\(it.problemID)", status: "COMPLETE"))
                solvedTitles.append(it.titleKo)
            }
            
            let encoder = JSONEncoder()
            
            let a  = BojInfo(bojId: bojId, name: name, problems: problemDatas)
            if let problemJson = try? encoder.encode(a) {
                var request = URLRequest(url: url)
                
                let a = UserDefaults.standard.string(forKey: StaticMembers.userToken)
                request.headers = ["X-AUTH-TOKEN": a!]
                
                request.httpMethod = "POST"
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
                request.httpBody = problemJson
                print(problemJson, " asdasdasd")
                
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
            else {
                print("some error")
            }
            
            
            
            
    }

}

}
