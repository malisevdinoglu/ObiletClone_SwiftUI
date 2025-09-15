//
//  MockTripleService.swift
//  ObiletClone
//
//  Created by Mehmet Ali Sevdinoğlu on 15.09.2025.
//

import Foundation

struct MockTripService {
    func fetchTrips() -> [Trip] {
        [
            Trip(company: "SEÇ", logoName: "logo_sec", departTime: "00:45",
                 priceText: "1.300 TL", layoutText: "2+1", durationText: "14s",
                 fromTerminal: "Adana Otogarı", toTerminal: "Esenler Otogarı"),
            Trip(company: "METRO", logoName: "logo_metro", departTime: "01:00",
                 priceText: "1.200 TL", layoutText: "2+1", durationText: "14s 30dk",
                 fromTerminal: "Adana Otogarı", toTerminal: "Esenler Otogarı"),
            Trip(company: "KAMİLKOÇ", logoName: "logo_kamilkoc", departTime: "01:00",
                 priceText: "1.300 TL", layoutText: "2+1", durationText: "12s 25dk",
                 fromTerminal: "Adana Otogarı", toTerminal: "Alibeyköy Otogarı"),
            Trip(company: "Lüks Adana",
                 logoName: "logo_luksadana",
                 departTime: "02:15",
                 priceText: "1.150 TL",
                 layoutText: "2+1",
                 durationText: "13s 10dk",
                 fromTerminal: "Adana Otogarı",
                 toTerminal: "Esenler Otogarı"),
            Trip(company: "KAMİLKOÇ",
                 logoName: "logo_kamilkoc",
                 departTime: "04:30",
                 priceText: "1.400 TL",
                 layoutText: "2+1",
                 durationText: "11s 50dk",
                 fromTerminal: "Adana Otogarı",
                 toTerminal: "Alibeyköy Otogarı"),
        ]
    }
}
