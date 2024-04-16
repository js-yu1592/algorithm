//
//  n^2 배열 자르기.swift
//  Algorithm
//
//  Created by 유준상 on 4/4/24.
//

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    return (Int(left)...Int(right)).map {
        max($0 / n, $0 % n) + 1
    }
}

print(solution(3, 2, 5))
print(solution(4, 7, 14))


// MARK: - 시간초과
//func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
//    var result: [Int] = []
//    var idx: Int = 0
//
//    for i in 1...n {
//        for j in 1...n {
//            idx += 1
//
//            if idx >= (left + 1) &&
//                idx <= (right + 1) {
//                result.append(max(i, j))
//            }
//
//        }
//    }
//
//    return result
//}
