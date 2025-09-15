//
//  FilterBar.swift
//  ObiletClone
//
//  Created by Mehmet Ali Sevdinoğlu on 15.09.2025.
//
import SwiftUI

struct FilterBar: View {
    var onSortTap: () -> Void = {}
    var onFilterTap: () -> Void = {}

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                
                Button("SIRALA", action: onSortTap)
                    .modifier(FilterButtonStyle(isPrimary: true))

               
                Button("FİLTRE", action: onFilterTap)
                    .modifier(FilterButtonStyle(isPrimary: true))

              
                Button("SABAH") { }
                    .modifier(FilterButtonStyle(isPrimary: false))

                Button("ÖĞLEN") { }
                    .modifier(FilterButtonStyle(isPrimary: false))

                Button("AKŞAM") { }
                    .modifier(FilterButtonStyle(isPrimary: false))

                Button("SABAHA KARŞI") { }
                    .modifier(FilterButtonStyle(isPrimary: false))

                Button("BAĞLAYAN GECE") { }
                    .modifier(FilterButtonStyle(isPrimary: false))
            }
            .padding(.horizontal, 16)
        }
    }
}

private struct FilterButtonStyle: ViewModifier {
    var isPrimary: Bool

    func body(content: Content) -> some View {
        content
            .font(.subheadline.bold())
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(isPrimary ? Color.brandRed : Color.white)
            .foregroundColor(isPrimary ? .white : .brandRed)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.brandRed, lineWidth: isPrimary ? 0 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}
