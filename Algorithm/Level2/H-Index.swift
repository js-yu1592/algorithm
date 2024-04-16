//
//  H-Index.swift
//  Algorithm
//
//  Created by 유준상 on 4/11/24.
//

import Foundation

// 정렬 문제
func solution(_ citations:[Int]) -> Int {
    let sorted = citations.sorted(by: >)
    var result = -1
    
    for i in sorted.indices {
        let value = sorted[i]
        let h = i + 1
        
        if h > value {
            result = i
            break
        }
    }
    
    return (result == -1) ? sorted.count : result
}

print(solution([3, 0, 6, 1, 5]))
