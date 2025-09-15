//
//  City.swift
//  ObiletClone
//
//  Created by Mehmet Ali Sevdinoğlu on 15.09.2025.
//

import Foundation

struct City: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let code: String
}
