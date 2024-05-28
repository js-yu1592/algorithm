//
//  주차 요금 계산.swift
//  Algorithm
//
//  Created by 유준상 on 5/28/24.
//

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var recordsDic: [String: String] = [:]
    var feesDic: [String: Int] = [:]
    
    records.forEach {
        let record = $0.components(separatedBy: " ")
        let time = record[0]
        let carNum = record[1]
        let state = record[2]
        
        switch state {
        case "IN":
            if !feesDic.keys.contains(carNum) {
                feesDic[carNum] = 0
            }
            recordsDic[carNum] = time
        case "OUT":
            let outTime = time.components(separatedBy: ":")
            let outHour = Int(outTime[0])!
            let outMinute = Int(outTime[1])!
            
            let outChanged = (outHour * 60) + outMinute
            
            let inTime = recordsDic[carNum]!.components(separatedBy: ":")
            let inHour = Int(inTime[0])!
            let inMinute = Int(inTime[1])!
            
            let inChanged = (inHour * 60) + inMinute
            
            let gab = outChanged - inChanged
            feesDic[carNum]! += gab
            recordsDic.removeValue(forKey: carNum)
        default: break
        }
    }
    
    for record in recordsDic {
        let outChanged = (23 * 60) + 59
        
        let inTime = recordsDic[record.key]!.components(separatedBy: ":")
        let inHour = Int(inTime[0])!
        let inMinute = Int(inTime[1])!
        
        let inChanged = (inHour * 60) + inMinute
        
        feesDic[record.key]! += outChanged - inChanged
    }
    
    for fee in feesDic {
        if fee.value <= fees[0] {
            feesDic[fee.key] = fees[1]
        } else {
            let doubleFee = Double(fee.value - fees[0]) / Double(fees[2])
            let ceilFee = ceil(doubleFee)
            let intFee = Int(ceilFee)
            feesDic[fee.key]! = fees[1] + (intFee * fees[3])
        }
    }
    
    var result: [Int] = []
    for fee in feesDic.sorted(by: { $0.key < $1.key }) {
        result.append(fee.value)
    }
    
    return result
}

print(solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))
// [14600, 34400, 5000]
print(solution([120, 0, 60, 591], ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]))
// [0, 591]
print(solution([1, 461, 1, 10], ["00:00 1234 IN"]))
// [14841]
               
// 기본시간(분), 기본요금(원), 단위시간(분), 단위요금(원)
