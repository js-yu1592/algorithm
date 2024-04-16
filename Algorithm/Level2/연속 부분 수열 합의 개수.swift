//
//  연속 부분 수열 합의 개수 .swift
//  Algorithm
//
//  Created by 유준상 on 4/1/24.
//

import Foundation

func solution(_ elements:[Int]) -> Int {
    var sumSet: Set<Int> = []
    
    for i in 0..<elements.count {
        var sum: Int = 0
        
        for j in 0..<elements.count {
            var idx: Int = i + j
            if idx >= elements.count {
                idx -= elements.count
            }
            
            sum += elements[idx]
            sumSet.insert(sum)
        }
    }
    
    return sumSet.count
}


print(solution([7,9,1,1,4]))
