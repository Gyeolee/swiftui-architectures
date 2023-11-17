//
//  NewReleaseView.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI

// MARK: - State

struct NewReleaseAlbumState: Hashable {
    let id: String
    let title: String
    let imageUrl: String
}

// MARK: - View

struct NewReleaseView: View {
    @State var state: NewReleaseAlbumState
    var action: (_ id: String) -> Void
    
    var body: some View {
        Button(action: { action(state.id) }) {
            HStack {
                AsyncImage(url: URL(string: state.imageUrl)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .frame(width: 60, height: 60)
                    } else if let _ = phase.error {
                        Color.red
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Text(state.title)
                    .foregroundColor(.black)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                Color(.sRGB, red: 250/255, green: 250/255, blue: 254/255, opacity: 1)
                    .cornerRadius(12)
                    .shadow(color: Color(.sRGB, white: 0, opacity: 0.15), radius: 4, x: 1, y: 1)
            )
        }
    }
}

#Preview {
    NewReleaseView(
        state: NewReleaseAlbumState(id: "id", title: "title", imageUrl: "imageUrl"),
        action: { _ in }
    )
}
