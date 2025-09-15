import SwiftUI

struct TripListView: View {
    @State private var vm = TripListViewModel()
    @State private var showSort = false
    @State private var showFilter = false

    private let summary = SearchSummary(
        from: "Adana",
        to: "İstanbul Avrupa",
        dateText: "16 Eyl Salı"
    )

    var body: some View {
        VStack(spacing: 0) {
        
            HeaderBar(summary: summary)

            
            FilterBar(
                onSortTap: { showSort = true },
                onFilterTap: { showFilter = true }
            )
            .padding(.horizontal, 16)
            .padding(.vertical, 8)         // obilet'teki beyaz şerit yüksekliği
            .background(Color.white)
            .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 2)

   
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(vm.visibleTrips) { trip in
                        TripCard(trip: trip, onInspect: {
                            print("incele: \(trip.company) \(trip.departTime)")
                        })
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
                .padding(.top, 4)
            }
            .background(Color(.systemGroupedBackground))
        }
        .toolbar(.hidden, for: .navigationBar)
        .confirmationDialog("Sırala",
                            isPresented: $showSort,
                            titleVisibility: .visible) {
            Button("Fiyat (artan)") { vm.sort = .priceAscending }
            Button("Erken saat")    { vm.sort = .earlyTime }
            Button("Sıfırla", role: .destructive) { vm.sort = .none }
            Button("Vazgeç", role: .cancel) { }
        }
        .sheet(isPresented: $showFilter) {
            FilterSheet(onlyTwoPlusOne: vm.filter.onlyTwoPlusOne) { vm.filter.onlyTwoPlusOne = $0 }
                .presentationDetents([.fraction(0.35)])
        }
    }
}


private struct FilterSheet: View {
    @State var onlyTwoPlusOne: Bool
    var onChange: (Bool) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Toggle("Sadece 2+1", isOn: $onlyTwoPlusOne)
            }
            .navigationTitle("Filtre")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Uygula") {
                        onChange(onlyTwoPlusOne)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack { TripListView() }
}
