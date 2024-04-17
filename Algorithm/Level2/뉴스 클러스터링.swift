//
//  뉴스 클러스터링.swift
//  Algorithm
//
//  Created by 유준상 on 4/17/24.
//

import Foundation

// 문제를 잘읽자..!
func solution(_ str1:String, _ str2:String) -> Int {
    let str1 = str1.lowercased()
        .map { String($0) }
    let str2 = str2.lowercased()
        .map { String($0) }
    var arr1: [String] = []
    var arr2: [String] = []
    
    for idx in 0..<str1.count-1 {
        let str = str1[idx] + str1[idx + 1]
        if str.filter({ !$0.isLetter }).count == 0 {
            arr1.append(str)
        }
    }
    
    for idx in 0..<str2.count-1 {
        let str = str2[idx] + str2[idx + 1]
        if str.filter({ !$0.isLetter }).count == 0 {
            arr2.append(str)
        }
    }
    
    var unionCount: Double = Double(arr1.count + arr2.count)
    var intersectionCount: Double = 0
    
    for i in arr1.indices {
        for j in arr2.indices {
            if arr1[i] == arr2[j] {
                intersectionCount += 1
                arr2.remove(at: j)
                break
            }
        }
    }
    unionCount -= intersectionCount
    
    if unionCount == 0 {
        return 65536
    } else if intersectionCount == 0 {
         return 0
    } else {
        return Int((intersectionCount / unionCount) * 65536)
    }
}

print(solution("FRANCE", "french"))
print(solution("handshake", "shake hands"))
print(solution("aa1+aa2", "AAAA12"))
print(solution("E=M*C^2", "e=m*c^2"))
