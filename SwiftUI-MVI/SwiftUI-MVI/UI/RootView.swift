//
//  RootView.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/10/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var navigator: Navigator
    
    var body: some View {
        NavigationStack(path: navigator.path) {
            ListView.build()
                .navigationDestination(for: NavigationViewType.self) {
                    $0.build()
                }
        }
    }
}

#Preview {
    RootView()
}
