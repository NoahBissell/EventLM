//
//  ManageData.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 3/18/23.
//

import Foundation

class ManageData{
    
    //SORT DICTIONARY AND STORE AS ARRAY OF TUPLES - id: UUID, key: String, value: AnyObject
    static func sortArray(array: [(id: UUID, key: String, value: AnyObject)], ascending: Bool) -> [(id: UUID, key: String, value: AnyObject)] {
        return array.sorted { lhs, rhs in
            if let lhsKey = Int(lhs.key), let rhsKey = Int(rhs.key) {
                return ascending ? lhsKey < rhsKey : lhsKey > rhsKey
            }
            return false
        }
    }
    
//    static func sortDictionary(_ dict: [String:AnyObject]) -> [(id: UUID, key: String, value: AnyObject)] {
//        let sortedKeys = dict.keys.sorted { Int($0)! < Int($1)! }
//        return sortedKeys.map { (id: UUID(), key: $0, value: dict[$0]!) }
//    }
//
    
    //CONVERT DICTIONARY TO TUPLE
    static func dictionaryToTuples(_ dictionary: [String: AnyObject]) -> [(id: UUID, key: String, value: AnyObject)] {
        let tuplesArray = dictionary.map { (id: UUID(), key: $0.key, value: $0.value) }
        return tuplesArray
    }
}
