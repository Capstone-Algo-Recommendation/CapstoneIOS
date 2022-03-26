//
//  ApiService.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/26.
//

import Foundation
import Alamofire

class ApiService {
    
    static func getUserSolvedProblems(completion:@escaping (SolvedProblems)->Void) {
        
        let url = "https://solved.ac/api/v3/search/problem?query=tried_by:qjxjzjq2"
        
        AF.request(url, method: .get).responseData { response in
            switch response.result {
            case .success(let value):
//                guard let statusCode = response.response?.statusCode else { return }
                let decoder = JSONDecoder()
                let data = try! decoder.decode(SolvedProblems.self, from: value)
                completion(data)
            case .failure(let error):
                print("what kind of error", error)
            }
        }
    }
    
}
