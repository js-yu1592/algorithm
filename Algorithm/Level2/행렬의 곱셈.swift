//
//  행렬의 곱셈.swift
//  Algorithm
//
//  Created by 유준상 on 4/11/24.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    
    for i in arr1.indices {
        result.append([])
        
        for j in arr2[0].indices {
            var value = 0
            
            for k in arr2.indices {
                value += (arr1[i][k] * arr2[k][j])
            }
            result[i].append(value)
        }
    }
    
    return result
}

print(solution([[1, 4], [3, 2], [4, 1]], [[3, 3], [3, 3]]))
print(solution([[2, 3, 2], [4, 2, 4], [3, 1, 4]], [[5, 4, 3], [2, 4, 1], [3, 1, 1]]))
