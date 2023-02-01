//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Hank on 2023/1/28.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}

// my name is hank, i like playing computers. i had a deep understanding on operating systems.
