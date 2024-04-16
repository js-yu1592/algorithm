//
//  예상 대진표.swift
//  Algorithm
//
//  Created by 유준상 on 3/21/24.
//

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0
    var A: Int = a
    var B: Int = b
    
    while true {
        A = (A % 2 == 0) ? A / 2 : (A + 1) / 2
        B = (B % 2 == 0) ? B / 2 : (B + 1) / 2
        
        answer += 1
        
        if A == B { break }
    }

    return answer
}

print(solution(8, 4, 7))
