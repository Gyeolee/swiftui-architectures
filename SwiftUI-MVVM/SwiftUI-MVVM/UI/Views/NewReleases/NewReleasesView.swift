//
//  NewReleasesView.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/15/23.
//

import SwiftUI
import ViewModifiers

struct NewReleasesView: View {
    @EnvironmentObject var navigator: Navigator
    @StateObject var viewModel: NewReleasesViewModel = .init()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.newReleaseModels, id: \.self) {
                    NewReleaseView(model: $0) { id in
                        navigator.push(to: .albumDetail(id: id))
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .onlyOnceTask {
            await viewModel.fetchNewReleases()
        }
    }
}

#Preview {
    NewReleasesView()
}
