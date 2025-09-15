import SwiftUI
import UIKit

struct HeaderBar: View {
    let summary: SearchSummary
    @State private var topInset: CGFloat = 0

   
    private let headerSpacing: CGFloat = 24
    private let headerTopPadding: CGFloat = -80
    private let headerBottomPadding: CGFloat = 8
    private let sideChipWidth: CGFloat = 110
    private let sideInset: CGFloat = 4

    var body: some View {
        VStack(spacing: headerSpacing) {
        
            Color.clear.frame(height: max(0, topInset - 4))

    
            HStack(spacing: 8) {
                Text(summary.from)
                    .font(.subheadline).bold()
                    .foregroundColor(.white)

               
                Image(systemName: "arrow.left.arrow.right")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.white, lineWidth: 1)
                    )

                Text(summary.to)
                    .font(.subheadline).bold()
                    .foregroundColor(.white)
            }


            ZStack {
                HStack(spacing: 0) {
                    OutlineChipButton(title: "Önceki", systemImage: "chevron.left")
                        .frame(width: sideChipWidth, alignment: .leading)

                    Spacer(minLength: 0)

             
                    OutlineChipButton(title: "Sonraki", systemImage: "chevron.right", iconOnRight: true)
                        .frame(width: sideChipWidth, alignment: .trailing)
                }

                OutlineChipLabel(systemImage: "calendar",
                                 title: summary.dateText)
                    .fixedSize()
                    .allowsHitTesting(false)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, headerTopPadding)
        .padding(.bottom, headerBottomPadding)
        .padding(.horizontal, sideInset)
        .background(
            Color.brandRed
                .ignoresSafeArea(edges: .top)
        )
        .onAppear {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = scene.windows.first(where: { $0.isKeyWindow }) {
                topInset = window.safeAreaInsets.top
            }
        }
    }
}



private struct OutlineChipButton: View {
    let title: String
    let systemImage: String
    var iconOnRight: Bool = false

    var body: some View {
        Button {
         
        } label: {
            HStack(spacing: 6) {
                if iconOnRight {
                    Text(title)
                    Image(systemName: systemImage)
                } else {
                    Image(systemName: systemImage)
                    Text(title)
                }
            }
            .font(.footnote)
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white.opacity(0.95), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
        .contentShape(RoundedRectangle(cornerRadius: 8))
    }
}

private struct OutlineChipLabel: View {
    let systemImage: String
    let title: String

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: systemImage)
            Text(title)
        }
        .font(.footnote)
        .foregroundColor(.white)
        .padding(.horizontal, 48)
        .padding(.vertical, 6)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.white.opacity(0.95), lineWidth: 1)
        )
        .contentShape(RoundedRectangle(cornerRadius: 8))
    }
}
