//
//  할인 행사.swift
//  Algorithm
//
//  Created by 유준상 on 4/3/24.
//

import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var result: Int = 0
    var dic: [String: Int] = [:]
    var needDay: Int = 0
    
    for idx in 0..<want.count {
        dic[want[idx]] = number[idx]
        needDay += number[idx]
    }
    
    for i in 0...discount.count - needDay {
        var countDic: [String: Int] = dic
        
        for j in i...i + (needDay - 1) {
            countDic[discount[j]] = (countDic[discount[j]] ?? 0) - 1
            
            if countDic[discount[j]] == 0 {
                countDic.removeValue(forKey: discount[j])
            }
        }
        if countDic.isEmpty {
            result += 1
        }
    }
    
    return result
}

print(solution(["banana", "apple", "rice", "pork", "pot"], [3, 2, 2, 2, 1], ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]))
print(solution(["apple"], [10], ["banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana"]))
