//
//  k진수에서 소수 개수 구하기.swift
//  Algorithm
//
//  Created by 유준상 on 4/22/24.
//

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var result: Int = 0
    let numbers = String(n, radix: k).split(separator: "0")
        .map { Int($0)! }
        .filter { $0 != 1 }
    
    numbers.forEach {
        var prime: Bool = true
        
        let sqrtNum = sqrt(Double($0))
        for i in 2...Int(sqrtNum) + 1 {
            if $0 % i == 0 && i != $0 {
                prime = false
                break
            }
        }
        
        if prime {
            result += 1
        }
    }
    
    return result
}

print(solution(437674, 3))
print(solution(110011, 10))



