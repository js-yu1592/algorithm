//
//  문자열 나누기.swift
//  Algorithm
//
//  Created by 유준상 on 3/11/24.
//

import Foundation

func solution(_ s:String) -> Int {
    let characters: [Character] = s.map { $0 }
    var first: Character = characters.first!
    var sameCharCount: Int = 0
    var diffCharCount: Int = 0
    var result: Int = 0
    var splits: [Character] = []
    
    for idx in 0..<characters.count {
        splits.append(characters[idx])
        
        if first == characters[idx] {
            sameCharCount += 1
        } else {
            diffCharCount += 1
        }
        
        if sameCharCount == diffCharCount {
            sameCharCount = 0
            diffCharCount = 0
            
            result += 1
            splits = []
            if idx + 1 < characters.count {
                first = characters[idx + 1]
            }
        }
    }
    
    if !splits.isEmpty { result += 1 }
    
    return result
}

print(solution("banana"))
print(solution("abracadabra"))
print(solution("aaabbaccccabba"))

