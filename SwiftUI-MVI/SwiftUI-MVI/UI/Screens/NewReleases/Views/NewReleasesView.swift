//
//  NewReleasesView.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI
import Extensions
import ViewModifiers

struct NewReleasesView: View {
    @EnvironmentObject var navigator: Navigator
    @StateObject var container: MVIContainer<NewReleasesIntentProtocol, NewReleasesModelStateProtocol>
    
    private var intent: NewReleasesIntentProtocol { container.intent }
    private var model: NewReleasesModelStateProtocol { container.model }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(model.newReleaseStates.withIndices, id: \.0) { index, state in
                    NewReleaseView(state: state) { id in
                        navigator.push(to: .detail(id: id))
                    }
                    .padding(.horizontal)
                    .task {
                        if index == model.newReleaseStates.count - 1 {
                            await intent.lastItemViewOnTask()
                        }
                    }
                }
            }
            .padding(.vertical)
        }
        .loading(model.isLoading)
        .onlyOnceTask {
            await intent.viewOnTask()
        }
    }
}

extension NewReleasesView {
    static func build() -> some View {
        let model = NewReleasesModel()
        let intent = NewReleasesIntent(model: model)
        let container = MVIContainer(
            intent: intent as NewReleasesIntentProtocol,
            model: model as NewReleasesModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return NewReleasesView(container: container)
    }
}

#Preview {
    let model = NewReleasesModel()
    let intent = NewReleasesIntent(model: model)
    let container = MVIContainer(
        intent: intent as NewReleasesIntentProtocol,
        model: model as NewReleasesModelStateProtocol,
        modelChangePublisher: model.objectWillChange
    )
    return NewReleasesView(container: container)
}
