//
//  RootView.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/15/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var navigator: Navigator
    
    var body: some View {
        NavigationStack(path: navigator.path) {
            NewReleasesView()
                .navigationDestination(for: NavigationViewType.self) {
                    $0.view
                }
        }
    }
}

#Preview {
    RootView()
}
