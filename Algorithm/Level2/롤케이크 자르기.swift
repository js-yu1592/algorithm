//
//  롤케이크 자르기.swift
//  Algorithm
//
//  Created by 유준상 on 5/14/24.
//

import Foundation

func solution(_ topping:[Int]) -> Int {
    var dic1: [Int: Int] = [:]
    var dic2: [Int: Int] = [:]
    var result: Int = 0
    
    topping.forEach {
        dic1[$0] = (dic1[$0] ?? 0) + 1
    }
    
    topping.forEach {
        dic1[$0] = (dic1[$0] ?? 0) - 1
        dic2[$0] = (dic2[$0] ?? 0) + 1
        
        if dic1[$0] == 0 {
            dic1.removeValue(forKey: $0)
        }
        
        if dic1.count == dic2.count { result += 1 }
    }
    
    return result
}

print(solution([1, 2, 1, 3, 1, 4, 1, 2]))
print(solution([1, 2, 3, 1, 4]))
