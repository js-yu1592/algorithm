//
//  멀리 뛰기.swift
//  Algorithm
//
//  Created by 유준상 on 3/28/24.
//
// 피보나치 수열을 이용한 문제

import Foundation

func solution(_ n:Int) -> Int {
    var result: [Int] = [1, 2]
    var i: Int = 0
    
    while result.count < n {
        result.append((result[i] + result[i + 1]) % 1234567)
        i += 1
    }
    
    return result[n - 1]
}

print(solution(4))
print(solution(3))
print(solution(6))
