//
//  카펫.swift
//  Algorithm
//
//  Created by 유준상 on 3/20/24.
//

import Foundation

// 완전 탐색 문제
func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let sum = brown + yellow
    var w: Int = 0
    var h: Int = 0
    
    for i in 1...sum {
        if sum % i == 0 {
            w = sum / i
            h = i
        }
        
        if (w - 2) * (h - 2) == yellow {
            break
        }
    }
    
    return [w, h]
}

print(solution(10, 2))
print(solution(8, 1))
print(solution(24, 24))

