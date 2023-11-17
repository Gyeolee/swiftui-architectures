//
//  AlbumDetailTrackView.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/14/23.
//

import SwiftUI

// MARK: - State

struct AlbumDetailTrackState: Hashable {
    let number: String
    let title: String
}

// MARK: - View

struct AlbumDetailTrackView: View {
    @State var state: AlbumDetailTrackState
    
    var body: some View {
        HStack(spacing: 12) {
            Text(state.number)
                .font(.headline)
            
            Text(state.title)
                .font(.headline)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color(.sRGB, red: 250/255, green: 250/255, blue: 254/255, opacity: 1)
                .cornerRadius(12)
                .shadow(color: Color(.sRGB, white: 0, opacity: 0.15), radius: 4, x: 1, y: 1)
        )
    }
}

#Preview {
    AlbumDetailTrackView(state: AlbumDetailTrackState(number: "1", title: "title"))
}
