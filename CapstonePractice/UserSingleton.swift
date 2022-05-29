//
//  UserSingleton.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/05/29.
//

import Foundation

class UserSingleton {
    static let shared = UserSingleton()
    
    var name: String?
    var number = 1
    private init() {
        
    }
}


