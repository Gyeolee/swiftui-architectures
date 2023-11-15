//
//  NewReleasesView.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/15/23.
//

import SwiftUI

struct NewReleasesView: View {
    @StateObject var viewModel: NewReleasesViewModel = .init()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.newReleaseModels, id: \.self) {
                    NewReleaseView(model: $0) { id in
                        // TODO: Navigate
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .task {
            await viewModel.fetchNewReleases()
        }
    }
}

#Preview {
    NewReleasesView()
}
