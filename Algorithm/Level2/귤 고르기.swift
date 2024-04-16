//
//  귤 고르기.swift
//  Algorithm
//
//  Created by 유준상 on 3/28/24.
//

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dic: [Int: Int] = [:]
    var count = 0
    var answer = 0
    
    tangerine.forEach {
        dic[$0] = (dic[$0] ?? 0) + 1
    }
    let sortedDic = dic.values.sorted(by: >)
    
    for item in sortedDic.enumerated() {
        let index = item.offset
        let element = item.element
        
        if count + element >= k {
            answer = index + 1
            break
        }
        count += element
    }
    return answer
}

// 많은 개수대로 정렬 후 상자에 집어 넣음, 집어넣은 귤의 개수가 k값 이상이 되었을때 해당 index + 1값이 종류의 개수가 됨
print(solution(6, [1, 3, 2, 5, 4, 5, 2, 3]))
print(solution(4, [1, 3, 2, 5, 4, 5, 2, 3]))
print(solution(2, [1, 1, 1, 1, 2, 2, 2, 3]))
