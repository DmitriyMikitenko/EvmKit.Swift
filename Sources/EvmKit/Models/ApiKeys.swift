//
//  ApiKeys.swift
//
//
//  Created by Dmitriy Mikitenko on 10.10.2024.
//

public struct ApiKeys {
    private let keys: [String]
    private var currentIndex = 0
    
    public init(keys: [String]) {
        self.keys = keys
    }
    
    var key: String {
        keys[currentIndex]
    }
    
    mutating func nextKey() -> String {
        currentIndex = (currentIndex + 1) % keys.count
        return key
    }
}
