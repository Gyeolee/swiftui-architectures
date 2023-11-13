//
//  ListItemView.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI

struct ListItemView: View {
    struct ListItemState: Hashable {
        let id: String
        let title: String
        let imageUrl: String
    }
    
    @State var state: ListItemState
    var action: (_ id: String) -> Void
    
    var body: some View {
        Button(action: { action(state.id) }) {
            ZStack {
                Color(.sRGB, red: 250/255, green: 250/255, blue: 254/255, opacity: 1)
                    .cornerRadius(14)
                    .shadow(color: Color(.sRGB, white: 0, opacity: 0.15),
                            radius: 4, x: 1, y: 1)

                Text(state.title)
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
}

#Preview {
    ListItemView(
        state: ListItemView.ListItemState(id: "id", title: "title", imageUrl: "imageUrl"),
        action: { _ in }
    )
}
