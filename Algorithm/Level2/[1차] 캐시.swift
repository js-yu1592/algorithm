//
//  캐시.swift
//  Algorithm
//
//  Created by 유준상 on 4/15/24.
//

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var result: Int = 0
    var cacheList: [String] = []
    
    if cacheSize == 0 { return cities.count * 5 }
    
    cities.map { $0.lowercased() }.forEach {
        if let idx = cacheList.firstIndex(of: $0) {
            cacheList.remove(at: idx)
            cacheList.append($0)
            
            result += 1
        } else {
            if cacheList.count >= cacheSize {
                cacheList.removeFirst()
            }
            cacheList.append($0)
            
            result += 5
        }
    }
    
    return result
}

print(solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
print(solution(3, ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]))
print(solution(2, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]))
print(solution(5, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]))
print(solution(2, ["Jeju", "Pangyo", "NewYork", "newyork"]))
print(solution(0, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
