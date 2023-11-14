//
//  DetailItemView.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/14/23.
//

import SwiftUI

struct DetailItemView: View {
    struct DetailItemState: Hashable {
        let number: String
        let title: String
    }
    
    @State var state: DetailItemState
    
    var body: some View {
        HStack {
            Text(state.number)
            
            Text(state.title)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color(.sRGB, red: 250/255, green: 250/255, blue: 254/255, opacity: 1)
                .cornerRadius(12)
                .shadow(color: Color(.sRGB, white: 0, opacity: 0.15), radius: 4, x: 1, y: 1)
        )
    }
}

#Preview {
    DetailItemView(state: DetailItemView.DetailItemState(number: "1", title: "title"))
}
