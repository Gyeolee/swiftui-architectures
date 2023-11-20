//
//  NewReleasesView.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI
import ViewModifiers

struct NewReleasesView: View {
    @EnvironmentObject var navigator: Navigator
    @StateObject var container: MVIContainer<NewReleasesIntentProtocol, NewReleasesModelStateProtocol>
    
    private var intent: NewReleasesIntentProtocol { container.intent }
    private var state: NewReleasesModelStateProtocol { container.model }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(state.newReleaseStates, id: \.self) {
                    NewReleaseView(state: $0) { id in
                        navigator.push(to: .detail(id: id))
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
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
