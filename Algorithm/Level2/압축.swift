//
//  압축.swift
//  Algorithm
//
//  Created by 유준상 on 4/24/24.
//

import Foundation

func solution(_ msg:String) -> [Int] {
    var dic: [String] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }
    var message = msg.map { String($0) }
    var input: String = ""
    var result: [Int] = []
    
    while !message.isEmpty {
        input += message.removeFirst()
        
        guard let next = message.first else {
            result.append(dic.firstIndex(of: input)! + 1)
            break
        }
        
        if let index = dic.firstIndex(of: input),
           !dic.contains(input + next) {
            result.append(index + 1)
            dic.append(input + next)
            input = ""
        }
    }
    
    
    return result
}

print(solution("KAKAO"))
print(solution("TOBEORNOTTOBEORTOBEORNOT"))
print(solution("ABABABABABABABAB"))
