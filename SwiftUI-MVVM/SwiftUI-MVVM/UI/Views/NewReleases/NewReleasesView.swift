//
//  NewReleasesView.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/15/23.
//

import SwiftUI
import Extensions
import ViewModifiers

struct NewReleasesView: View {
    @EnvironmentObject var navigator: Navigator
    @StateObject var viewModel: NewReleasesViewModel = .init()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.newReleaseModels.withIndices, id: \.0) { index, model in
                    NewReleaseView(model: model) { id in
                        navigator.push(to: .albumDetail(id: id))
                    }
                    .padding(.horizontal)
                    .task {
                        if index == viewModel.newReleaseModels.count - 1 {
                            await viewModel.fetchNewReleases()
                        }
                    }
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
