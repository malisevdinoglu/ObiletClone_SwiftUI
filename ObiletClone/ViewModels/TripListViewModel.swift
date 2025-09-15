//
//  TripListViewModel.swift
//  ObiletClone
//
//  Created by Mehmet Ali Sevdinoğlu on 15.09.2025.
//

import Foundation
import Observation

@Observable
final class TripListViewModel {
   
    var sort: SortOption = .none
    var filter = FilterState()


    private(set) var allTrips: [Trip] = []
    private let service = MockTripService()

 
    var visibleTrips: [Trip] {
        var items = allTrips

        
        if filter.onlyTwoPlusOne {
            items = items.filter { $0.layoutText.contains("2+1") }
        }

        
        switch sort {
        case .none: break
        case .priceAscending:
            items = items.sorted { priceValue($0) < priceValue($1) }
        case .earlyTime:
            items = items.sorted { timeValue($0) < timeValue($1) }
        }
        return items
    }

    init() { load() }

    func load() {
        allTrips = service.fetchTrips()
    }


    private func priceValue(_ t: Trip) -> Int {

        Int(t.priceText.replacingOccurrences(of: ".", with: "")
            .components(separatedBy: " ").first ?? "") ?? 0
    }
    private func timeValue(_ t: Trip) -> Int {
        
        let parts = t.departTime.split(separator: ":")
        if parts.count == 2, let h = Int(parts[0]), let m = Int(parts[1]) {
            return h*60 + m
        }
        return .max
    }

    enum SortOption { case none, priceAscending, earlyTime }

    struct FilterState {
        var onlyTwoPlusOne: Bool = false
    }
}
