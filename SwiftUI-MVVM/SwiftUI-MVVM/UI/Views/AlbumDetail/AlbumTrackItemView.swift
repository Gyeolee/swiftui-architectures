//
//  AlbumTrackItemView.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/16/23.
//

import SwiftUI

struct AlbumTrackItemView: View {
    @State var model: AlbumTrackModel
    
    var body: some View {
        HStack(spacing: 12) {
            Text(model.number)
                .font(.headline)
            
            Text(model.title)
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
    AlbumTrackItemView(model: AlbumTrackModel.init(number: "1", title: "title"))
}
