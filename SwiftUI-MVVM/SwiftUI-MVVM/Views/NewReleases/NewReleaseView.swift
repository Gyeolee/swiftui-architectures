//
//  NewReleaseView.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/15/23.
//

import SwiftUI

struct NewReleaseView: View {
    @State var model: NewReleaseModel
    var action: (_ id: String) -> Void
    
    var body: some View {
        Button(action: { action(model.id) }) {
            HStack {
                AsyncImage(url: URL(string: model.albumImageUrl)) { phase in
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
                
                Text(model.albumTitle)
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
        model: NewReleaseModel(id: "id", albumTitle: "albumTitle", albumImageUrl: "albumImageUrl"),
        action: { _ in }
    )
}
