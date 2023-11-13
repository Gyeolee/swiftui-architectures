//
//  ListView.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var navigator: Navigator
    
    var body: some View {
        Button("Detail", action: { navigator.push(to: .detail) })
    }
}

#Preview {
    ListView()
}
