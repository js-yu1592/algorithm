//
//  햄버거 만들기.swift
//  Algorithm
//
//  Created by 유준상 on 3/13/24.
//

import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var result: Int = 0
    var stack: [Int] = []
    
    ingredient.forEach {
        stack.append($0)
        
        if Array(stack.suffix(4)) == [1, 2, 3, 1] {
            stack.removeLast(4)
            result += 1
        }
    }
    
    return result
}

print(solution([2, 1, 1, 2, 3, 1, 2, 3, 1]))
print(solution([1, 3, 2, 1, 2, 1, 3, 1, 2]))
