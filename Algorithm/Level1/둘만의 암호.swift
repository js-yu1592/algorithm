//
//  둘만의 암호.swift
//  Algorithm
//
//  Created by 유준상 on 3/12/24.
//

import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let aAscii: Int = Int(UnicodeScalar("a").value)
    let zAscii: Int = Int(UnicodeScalar("z").value)
    let skipAscii: [Int] = skip.map { Int(UnicodeScalar(String($0))!.value) }
    
    var result: String = ""

    for char in s {
        var ascii: Int = Int(UnicodeScalar(String(char))!.value)
        var count: Int = 0
        
        while count < index {
            ascii += 1
            
            if ascii > zAscii {
                ascii = aAscii
            }
            
            if skipAscii.contains(ascii) {
                continue
            } else {
                count += 1
            }
        }
        
        result.append(String(UnicodeScalar(ascii)!))
    }
    
    return result
}

// 다른 방법 ?
// 아스키로 변환하지 않고 먼저 "a~z"까지 배열에 filter를 통해 skip이 포함되지 않은 배열을 구한다.
// 그 후 s를 순회하는데, 해당 문자가 문자열 내 어떤 위치에 있는지 찾은 뒤 인덱스만큼 더해준다. (미리 skip을 뺏기때문에 인덱스만큼 더해도 문제가 없음)
// 이때, a~z 배열의 숫자보다 크면 숫자만큼 나머지값 구해 위치에 저장시켜주고
// 그 위치에 해당하는 a~z알파벳을 result에 더해준다.

print(solution("aukks", "wbqd", 5))
//print(solution("z", "abcdefghij", 20))
