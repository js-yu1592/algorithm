//
//  점프와 순간 이동.swift
//  Algorithm
//
//  Created by 유준상 on 3/21/24.
//

import Foundation

// 이분법 문제, 반으로 나눠가며 계산, 피보나치와 비슷한 맥락으로도 풀 수 있을듯...(재귀함수)
func solution(_ n:Int) -> Int
{
    var ans: Int = 0
    var remain: Int = n
    
    while remain > 0 {
        ans += remain % 2
        remain = (remain % 2 == 0) ? remain / 2 : remain - 1
    }

    return ans
}

print(solution(5))
print(solution(6))
print(solution(5000))
