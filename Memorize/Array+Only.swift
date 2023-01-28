//
//  Array+Only.swift
//  Memorize
//
//  Created by Hank on 2023/1/28.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
