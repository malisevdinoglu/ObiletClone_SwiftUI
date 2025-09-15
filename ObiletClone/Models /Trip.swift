//
//  Trip.swift
//  ObiletClone
//
//  Created by Mehmet Ali Sevdinoğlu on 15.09.2025.
//
import Foundation

struct Trip: Identifiable, Hashable {
    let id = UUID()
    let company: String
    let logoName: String?
    let departTime: String
    let priceText: String
    let layoutText: String        
    let durationText: String
    let fromTerminal: String
    let toTerminal: String
}
