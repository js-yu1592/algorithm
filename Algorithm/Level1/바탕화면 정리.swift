//
//  바탕화면 정리.swift
//  Algorithm
//
//  Created by 유준상 on 3/19/24.
//

import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var result: [Int] = []
    var luy: Int = 0
    var rdx: Int = 0
    var rdy: Int = 0
    
    for i in 0..<wallpaper.count {
        let wallpaperOfLine = wallpaper[i]
        
        wallpaperOfLine.enumerated().forEach { j, word in
            if word == "#" {
                if result.isEmpty {
                    result.append(i)
                    luy = j
                    rdx = i + 1
                    rdy = j + 1
                } else {
                    luy = (luy > j) ? j : luy
                    rdx = (rdx < i + 1) ? i + 1 : rdx
                    rdy = (rdy < j + 1) ? j + 1 : rdy
                }
            }
        }
    }
    
    result.append(contentsOf: [luy, rdx, rdy])
    
    return result
}

print(solution([".#...", "..#..", "...#."]))
print(solution(["..........", ".....#....", "......##..", "...##.....", "....#....."]))
print(solution([".##...##.", "#..#.#..#", "#...#...#", ".#.....#.", "..#...#..", "...#.#...", "....#...."]))
print(solution(["..", "#."]))
