//
//  튜플.swift
//  Algorithm
//
//  Created by 유준상 on 4/16/24.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var result: [Int] = []
    var dic: [Int: Int] = [:]
    
    s.components(separatedBy: ",").forEach {
        if let num = Int($0.replacingOccurrences(of: "{", with: "")
            .replacingOccurrences(of: "}", with: "")) {
            
            dic[num] = (dic[num] ?? 0) + 1
        }
    }
    
    for element in dic.sorted(by: { $0.value > $1.value }) {
        result.append(element.key)
    }
    
    return result
}

print(solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"))
print(solution("{{1,2,3},{2,1},{1,2,4,3},{2}}"))
print(solution("{{20,111},{111}}"))
print(solution("{{123}}"))
print(solution("{{4,2,3},{3},{2,3,4,1},{2,3}}"))
