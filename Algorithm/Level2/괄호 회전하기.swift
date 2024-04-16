//
//  괄호 회전하기.swift
//  Algorithm
//
//  Created by 유준상 on 4/1/24.
//

import Foundation

func solution(_ s:String) -> Int {
    var result: Int = 0
    var sArray: [String] = s.map { String($0) }
    
    for _ in 0..<sArray.count {
        let removed = sArray.removeFirst()
        sArray.append(removed)
        
        if check(sArray) {
            result += 1
        }
    }
    
    return result
}

func check(_ sArray: [String]) -> Bool {
    var stack: [String] = []
    
    for i in 0..<sArray.count {
        let element = sArray[i]
        
        switch element {
        case "]":
            if stack.isEmpty { return false }
            else {
                if stack.last == "[" {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        case "}":
            if stack.isEmpty { return false }
            else {
                if stack.last == "{" {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        case ")":
            if stack.isEmpty { return false }
            else {
                if stack.last == "(" {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        default:
            stack.append(element)
        }
    }
    
    return stack.isEmpty
}

print(solution("[](){}"))
print(solution("}]()[{"))
print(solution("[)(]"))
print(solution("}}}"))
