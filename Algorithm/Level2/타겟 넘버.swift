//
//  타겟 넘버.swift
//  Algorithm
//
//  Created by 유준상 on 4/18/24.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result: Int = 0
    
    func dfs(index: Int, sum: Int) {
        if (index == numbers.count - 1) &&
            sum == target {
            result += 1
            return
        }
        
        guard index + 1 < numbers.count else { return }
        
        dfs(index: index + 1, sum: sum + numbers[index + 1])
        dfs(index: index + 1, sum: sum - numbers[index + 1])
    }
    
    dfs(index: -1, sum: 0)
    
    return result
}

print(solution([1, 1, 1, 1, 1], 3))
print(solution([4, 1, 2, 1], 4))
