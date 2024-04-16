//
//  피로도.swift
//  Algorithm
//
//  Created by 유준상 on 4/16/24.
//

import Foundation

// 완전탐색, dfs 문제
func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result: Int = 0
    var visited: [Bool] = [Bool](repeating: false, count: dungeons.count)
    
    func dfs(_ count: Int, _ pirodo: Int) {
        if result < count {
            result = count
        }
        for i in 0..<dungeons.count {
            if !visited[i] && (dungeons[i][0] <= pirodo) {
                visited[i] = true
                dfs(count + 1, pirodo - dungeons[i][1])
                visited[i] = false
            }
        }
    }
    
    dfs(0, k)
    
    return result
}

print(solution(80, [[80,20],[50,40],[30,10]]))
