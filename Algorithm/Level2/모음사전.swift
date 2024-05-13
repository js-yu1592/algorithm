//
//  모음사전.swift
//  Algorithm
//
//  Created by 유준상 on 5/13/24.
//

import Foundation

func solution(_ word:String) -> Int {
    var result: [String] = []
    let alp: [String] = ["A", "E", "I", "O", "U"]
    
    func dfs(_ string: String) {
        result.append(string)
        
        if string.count == 5 { return }
        
        for i in 0..<5 {
            dfs(string + alp[i])
        }
    }
    
    dfs("")
    
    return result.firstIndex(of: word)!
}

print(solution("AAAAE"))
print(solution("AAAE"))
print(solution("I"))
print(solution("EIO"))
