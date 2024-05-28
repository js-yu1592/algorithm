//
//  땅따먹기.swift
//  Algorithm
//
//  Created by 유준상 on 5/27/24.
//

import Foundation

func solution(_ land:[[Int]]) -> Int{
    var land = land
    
    for i in 0..<land.count - 1 {
        land[i + 1][0] += max(land[i][1], land[i][2], land[i][3])
        land[i + 1][1] += max(land[i][0], land[i][2], land[i][3])
        land[i + 1][2] += max(land[i][0], land[i][1], land[i][3])
        land[i + 1][3] += max(land[i][0], land[i][1], land[i][2])
    }
    guard let last = land.last else { return 0 }
    return max(last[0], last[1], last[2], last[3])
}

print(solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))

