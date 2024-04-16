//
//  대충 만든 자판.swift
//  Algorithm
//
//  Created by 유준상 on 3/12/24.
//

import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var result: [Int] = []
    var keyDic: [Character: Int] = [:]
    
    keymap.forEach { key in
        for (idx, alp) in key.enumerated() {
            if let val = keyDic[alp] {
                if val > idx + 1 {
                    keyDic[alp] = idx + 1
                }
            } else {
                keyDic[alp] = idx + 1
            }
        }
    }
    
    for i in 0..<targets.count {
        result.append(0)
        
        for (idx, alp) in targets[i].enumerated() {
            if keyDic[alp] == nil {
                result[i] = -1
                break
            } else {
                result[i] += (keyDic[alp] ?? 0)
            }
        }
    }
    
    return result
}

print(solution(["ABACD", "BCEFD"], ["ABCD","AABB"]))
print(solution(["AA"], ["B"]))
print(solution(["AGZ", "BSSS"], ["ASA","BGZ"]))
// 9 4
// -1
// 4 6
print(solution(["ABCE"], ["ABDE"]))
// -1
