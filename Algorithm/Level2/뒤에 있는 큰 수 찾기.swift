//
//  뒤에 있는 큰 수 찾기.swift
//  Algorithm
//
//  Created by 유준상 on 5/14/24.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: [Int] = Array(repeating: -1, count: numbers.count)
    var stack: [Int] = []
    
    for i in 0..<numbers.count {
        while !stack.isEmpty && (numbers[stack.last!] < numbers[i]) {
            result[stack.popLast()!] = numbers[i]
        }
        
        stack.append(i)
    }
    
    return result
}

print(solution([2, 3, 3, 5]))
print(solution([9, 1, 5, 3, 6, 2]))
