//
//  성격 유형 검사하기.swift
//  Algorithm
//
//  Created by 유준상 on 3/13/24.
//

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var result: String = ""
    var dic: [String: Int] = [:] // RT CF JM AN
    
    for idx in 0..<survey.count {
        let choice: Int = choices[idx]
        let indicator: String = (choice < 4) ? String(survey[idx].first!) : String(survey[idx].last!)
        let score: Int = (choice < 4) ? (4 - choice) : (choice % 4)
        
        dic[indicator] = (dic[indicator] ?? 0) + score
    }
    
    result.append(
        ((dic["R"] ?? 0) < (dic["T"] ?? 0)) ? "T" : "R"
    )
    result.append(
        ((dic["C"] ?? 0) < (dic["F"] ?? 0)) ? "F" : "C"
    )
    result.append(
        ((dic["J"] ?? 0) < (dic["M"] ?? 0)) ? "M" : "J"
    )
    result.append(
        ((dic["A"] ?? 0) < (dic["N"] ?? 0)) ? "N" : "A"
    )
        
    return result
}

print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5])) // "TCMA"
print(solution(["TR", "RT", "TR"], [7, 1, 3])) // "RCJA"
