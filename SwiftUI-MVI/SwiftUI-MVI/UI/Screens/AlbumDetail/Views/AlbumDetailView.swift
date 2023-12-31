//
//  AlbumDetailView.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI

// MARK: - State

struct AlbumDetailState {
    let title: String
    let imageUrl: String
    let artistName: String
}

// MARK: - View

struct AlbumDetailView: View {
    @EnvironmentObject var navigator: Navigator
    @StateObject var container: MVIContainer<AlbumDetailIntentProtocol, AlbumDetailModelStateProtocol>
    
    private var intent: AlbumDetailIntentProtocol { container.intent }
    private var state: AlbumDetailModelStateProtocol { container.model }
    private var detailState: AlbumDetailState { state.detailState }
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: detailState.imageUrl)) { phase in
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
                
                Text(detailState.title)
                    .font(.largeTitle)
                
                Text(detailState.artistName)
                    .font(.title)
                
                LazyVStack(spacing: 16) {
                    ForEach(state.trackStates, id: \.self) {
                        AlbumDetailTrackView(state: $0)
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
            await intent.viewOnTask()
        }
    }
}

extension AlbumDetailView {
    static func build(detailId: String) -> some View {
        let model = AlbumDetailModel()
        let intent = AlbumDetailIntent(model: model, detailId: detailId)
        let container = MVIContainer(
            intent: intent as AlbumDetailIntentProtocol,
            model: model as AlbumDetailModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return AlbumDetailView(container: container)
    }
}

#Preview {
    let model = AlbumDetailModel()
    let intent = AlbumDetailIntent(model: model, detailId: "detailId")
    let container = MVIContainer(
        intent: intent as AlbumDetailIntentProtocol,
        model: model as AlbumDetailModelStateProtocol,
        modelChangePublisher: model.objectWillChange
    )
    return AlbumDetailView(container: container)
}
