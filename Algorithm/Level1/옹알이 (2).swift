//
//  옹알이 (2).swift
//  Algorithm
//
//  Created by 유준상 on 3/6/24.
//

import Foundation

func solution(_ babbling:[String]) -> Int {
    var result: Int = 0
    
    for babble in babbling {
        var replacingBabble = babble.replacingOccurrences(of: "aya", with: "1")
            .replacingOccurrences(of: "ye", with: "2")
            .replacingOccurrences(of: "woo", with: "3")
            .replacingOccurrences(of: "ma", with: "4")
       
        if let replacingBabble = Int(replacingBabble) {
            if !(String(replacingBabble).contains("11")) &&
                !(String(replacingBabble).contains("22")) &&
                !(String(replacingBabble).contains("33")) &&
                !(String(replacingBabble).contains("44")) {
                result += 1
            }
        }
    }
    
    return result
}

print(solution(["aya", "yee", "u", "maa"]))
print(solution(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"]))
