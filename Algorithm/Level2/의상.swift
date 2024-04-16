//
//  의상.swift
//  Algorithm
//
//  Created by 유준상 on 4/15/24.
//

// 해시
import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dic: [String: Int] = [:]
    var result: Int = 1
    
    clothes.forEach { cloth in
        if let count = dic[cloth[1]] {
            dic[cloth[1]] = count + 1
        } else {
            dic[cloth[1]] = 1
        }
    }
    
    dic.forEach { _, value in
        // 개수 + 1을 하는 이유는 아무것도 입지 않은 경우까지 포함해야하기 때문
        result *= (value + 1)
    }
    
    return result - 1 // 마지막에 아예 아무것도 안입는 경우를 빼줌
}

print(solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]))
print(solution([["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]))
