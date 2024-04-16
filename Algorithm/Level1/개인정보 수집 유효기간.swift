//
//  개인정보 수집 유효기간.swift
//  Algorithm
//
//  Created by 유준상 on 3/14/24.
//

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let splitToday: [Int] = today.components(separatedBy: ".").map { Int($0)! }
    var termsDic: [String: Int] = [:]
    var result: [Int] = []
    
    
    terms.forEach {
        let splitTerm = $0.components(separatedBy: " ")
        termsDic[splitTerm[0]] = Int(splitTerm[1])!
    }
    
    privacies.enumerated().forEach {
        let privacy = $0.element.components(separatedBy: " ")
        var getPrivacyDate: [Int] = privacy[0].components(separatedBy: ".").map { Int($0)! }
        let term: String = privacy[1]
        
        getPrivacyDate[2] -= 1
        if getPrivacyDate[2] < 1 {
            getPrivacyDate[1] -= 1
            getPrivacyDate[2] = 28
        }
        
        getPrivacyDate[1] += termsDic[term]!
        if getPrivacyDate[1] > 12 {
            getPrivacyDate[0] += (getPrivacyDate[1] / 12)
            getPrivacyDate[1] %= 12
            if getPrivacyDate[1] == 0 {
                getPrivacyDate[0] -= 1
                getPrivacyDate[1] = 12
            }
        }
        
        if (splitToday[0] > getPrivacyDate[0]) ||
            (splitToday[0] == getPrivacyDate[0] && splitToday[1] > getPrivacyDate[1]) ||
            (splitToday[0] == getPrivacyDate[0] && splitToday[1] == getPrivacyDate[1] && splitToday[2] > getPrivacyDate[2]) {
            result.append($0.offset + 1)
        }
    }
    
    return result
}

print(solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"])) // 1, 3

print(solution("2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"])) // 1, 4, 5

print(solution("2009.12.31", ["A 13"], ["2008.11.03 A"]))
