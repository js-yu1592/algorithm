//
//  프로세스.swift
//  Algorithm
//
//  Created by 유준상 on 4/17/24.
//

import Foundation

// 스택, 큐
func solution(_ priorities:[Int], _ location:Int) -> Int {
    var p = priorities
    var idx = location
    var result: Int = 0
    
    while p.count != 0 {
        idx -= 1
        let max = p.max()!
        let first = p[0]
        
        if first != max {
            p.append(first)
            p.removeFirst()
            if idx < 0 { idx = p.count - 1 }
        } else {
            result += 1
            p.removeFirst()
            if idx < 0 { break }
        }
    }
    
    return result
}

print(solution([2, 1, 3, 2], 2))
print(solution([1, 1, 9, 1, 1, 1], 0))
