//
//  User.swift
//  Simple Login
//
//  Created by Thanh-Nhon Nguyen on 29/12/2019.
//  Copyright © 2019 SimpleLogin. All rights reserved.
//

import Foundation

struct User {
    let canCreate: Bool
    let existing: [String]
    let prefixSuggestion: String
    let suffixes: [String]
    
    init(fromData data: Data) throws {
        guard let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw SLError.failToSerializeJSONData
        }
        
        let canCreate = jsonDictionary["can_create"] as? Bool
        let existing = jsonDictionary["existing"] as? [String]
        let prefixSuggestion = jsonDictionary["prefix_suggestion"] as? String
        let suffixes = jsonDictionary["suffixes"] as? [String]
        
        if let canCreate = canCreate,
            let existing = existing,
            let prefixSuggestion = prefixSuggestion,
            let suffixes = suffixes {
            self.canCreate = canCreate
            self.existing = existing
            self.prefixSuggestion = prefixSuggestion
            self.suffixes = suffixes
        } else {
            throw SLError.failToParseUser
        }
    }
}
