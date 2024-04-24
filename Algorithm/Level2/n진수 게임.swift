//
//  n진수 게임.swift
//  Algorithm
//
//  Created by 유준상 on 4/25/24.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var result: String = ""
    var turnCount: Int = 1
    var i: Int = 0
    
    while result.count < t {
        let radix = String(i, radix: n, uppercase: true)
        
        for num in radix {
            if turnCount == p {
                result += String(num)
            }
            
            if turnCount == m {
                turnCount = 0
            }
            
            if result.count == t {
                break
            }
            
            turnCount += 1
        }
        i += 1
    }
    
    return result
}

print(solution(2, 4, 2, 1))
print(solution(16, 16, 2, 1))
print(solution(16, 16, 2, 2))
