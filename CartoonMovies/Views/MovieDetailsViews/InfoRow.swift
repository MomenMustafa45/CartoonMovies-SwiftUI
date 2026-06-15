//
//  InfoRow.swift
//  CartoonMovies
//
//  Created by mac user on 15/06/2026.
//

import SwiftUI

struct InfoRow: View {
    
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        
        HStack {
            
            Image(systemName: icon)
                .frame(width: 25)
            
            Text(title)
                .fontWeight(.semibold)
            
            Spacer()
            
            Text(value)
                .foregroundStyle(.secondary)
        }
    }
}
#Preview {
    InfoRow(icon: "", title: "", value: "")
}
