//
//  OverviewView.swift
//  CartoonMovies
//
//  Created by mac user on 15/06/2026.
//

import SwiftUI

struct DescriptionView: View {
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Label(
                "Overview",
                systemImage: "text.book.closed.fill"
            )
            .font(.title2.bold())
            
            Text(description)
                .foregroundStyle(.secondary)
                .lineSpacing(5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(.background)
        )
        .shadow(
            color: .black.opacity(0.08),
            radius: 10,
            y: 5
        )
        .padding(.horizontal)
    }
}

#Preview {
    DescriptionView(description: "")
}
