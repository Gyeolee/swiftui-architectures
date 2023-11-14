//
//  DetailView.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var navigator: Navigator
    @StateObject var container: MVIContainer<DetailIntentProtocol, DetailModelStateProtocol>
    
    private var intent: DetailIntentProtocol { container.intent }
    private var state: DetailModelStateProtocol { container.model }
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: state.imageUrl)) { phase in
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
                
                Text(state.albumName)
                    .font(.largeTitle)
                
                Text(state.artistName)
                    .font(.title)
                
                LazyVStack(spacing: 16) {
                    ForEach(state.tracks, id: \.self) {
                        DetailItemView(state: $0)
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

extension DetailView {
    static func build(detailId: String) -> some View {
        let model = DetailModel()
        let intent = DetailIntent(model: model, detailId: detailId)
        let container = MVIContainer(
            intent: intent as DetailIntentProtocol,
            model: model as DetailModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return DetailView(container: container)
    }
}

#Preview {
    let model = DetailModel()
    let intent = DetailIntent(model: model, detailId: "detailId")
    let container = MVIContainer(
        intent: intent as DetailIntentProtocol,
        model: model as DetailModelStateProtocol,
        modelChangePublisher: model.objectWillChange
    )
    return DetailView(container: container)
}
