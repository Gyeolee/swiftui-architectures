//
//  AlbumDetailView.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/16/23.
//

import SwiftUI

struct AlbumDetailView: View {
    @EnvironmentObject var navigator: Navigator
    @StateObject var viewModel: AlbumDetailViewModel = .init()
    
    private var model: AlbumDetailModel { viewModel.detailModel }
    
    var id: String
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: model.imageUrl)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .frame(width: 300, height: 300)
                    } else if let _ = phase.error {
                        Color.red
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Text(model.title)
                    .font(.largeTitle)
                
                Text(model.artistName)
                    .font(.title)
                
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.trackModels, id: \.self) {
                        AlbumTrackItemView(model: $0)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: navigator.pop) {
                    Image(systemName: "chevron.backward")
                }
            }
        }
        .task {
            await viewModel.fetchAlbumDetail(id: id)
        }
    }
}

#Preview {
    AlbumDetailView(id: "id")
}
