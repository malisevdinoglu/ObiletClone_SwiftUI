import SwiftUI

struct TripCard: View {
    let trip: Trip
    var onInspect: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 6) {

          
            HStack(alignment: .top , spacing: 12) {
              
                CompanyLogoView(logoName: trip.logoName, placeholderSystem: "bus")
                    .frame(maxWidth: .infinity, alignment: .leading)

      
                Text(trip.departTime)
                    .font(.title3.weight(.bold))
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity, alignment: .center)

       
                VStack(spacing: 0) {
                    Text(trip.priceText)
                        .font(.subheadline)
                        .foregroundStyle(.primary)
                    Spacer(minLength: 0)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }

          
            HStack(spacing: 6) {
                Image(systemName: "clock")
                Text(trip.durationText)
            }
            .font(.caption)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, -2)

            
            HStack(spacing: 6) {
                Text(trip.fromTerminal)
                Image(systemName: "chevron.right")
                    .font(.caption2)
                Text(trip.toTerminal)
            }
            .font(.footnote)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 0)

   
            HStack {
                HStack(spacing: 6) {
                    Image(systemName: "square.split.2x1")
                    Text(trip.layoutText)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer(minLength: 0)
                    .frame(maxWidth: .infinity)
            }
            .font(.caption)
            .foregroundStyle(.secondary)
            .padding(.top, 2)

            Divider()
                .padding(.top, 4)

      
            HStack {
                Spacer()
                Button {
                    onInspect?()
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.right.circle")
                        Text("incele")
                    }
                    .font(.caption)
                }
                .buttonStyle(.plain)
                .foregroundStyle(.secondary)
            }
        }
        .padding(16)
        .background(Color.surface)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.12))
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.03), radius: 8, x: 0, y: 2)
    }
}


private struct CompanyLogoView: View {
    let logoName: String?
    let placeholderSystem: String

    var body: some View {
        Group {
            if let name = logoName, UIImage(named: name) != nil {
                Image(name)
                    .resizable()
                    .scaledToFit()
                    .padding(0)
            } else {
                Image(systemName: placeholderSystem)
                    .font(.title2)
                    .foregroundStyle(.brandRed)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(width: 60, height: 60)
        .background(Color.white.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
