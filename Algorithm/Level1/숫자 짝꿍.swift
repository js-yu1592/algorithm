//
//  숫자 짝꿍.swift
//  Algorithm
//
//  Created by 유준상 on 3/11/24.
//

import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var dicX: [String: Int] = [:]
    var dicY: [String: Int] = [:]
    var numList: [String] = []
    
    for x in X.map({ String($0) }) {
        dicX[x] = (dicX[x] ?? 0) + 1
    }
    
    for y in Y.map({ String($0) }) {
        dicY[y] = (dicY[y] ?? 0) + 1
    }
    
    for key in dicX.keys {
        numList += Array(repeating: key, count: min((dicX[key] ?? 0), (dicY[key] ?? 0)))
    }
    
    if numList.isEmpty { return "-1" }
    if numList.filter({ $0 == "0" }).count == numList.count {
        return "0"
    }
    
    return numList.sorted(by: >).joined()
}

print(solution("100", "2345"))
print(solution("100", "203045"))
print(solution("100", "123450"))
print(solution("12321", "42531"))
print(solution("5525", "1255"))
