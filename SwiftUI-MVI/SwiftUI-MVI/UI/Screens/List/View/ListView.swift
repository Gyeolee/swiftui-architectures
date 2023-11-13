//
//  ListView.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var navigator: Navigator
    @StateObject var container: MVIContainer<ListIntentProtocol, ListModelStateProtocol>
    
    private var intent: ListIntentProtocol { container.intent }
    private var state: ListModelStateProtocol { container.model }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(state.itemStates, id: \.self) {
                    ListItemView(state: $0) { _ in
                        navigator.push(to: .detail)
                    }
                    .padding(.horizontal)
                }
            }.padding(.vertical)
        }
        .task {
            await intent.viewOnTask()
        }
    }
}

extension ListView {
    static func build() -> some View {
        let model = ListModel()
        let intent = ListIntent(model: model)
        let container = MVIContainer(
            intent: intent as ListIntentProtocol,
            model: model as ListModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return ListView(container: container)
    }
}

#Preview {
    let model = ListModel()
    let intent = ListIntent(model: model)
    let container = MVIContainer(
        intent: intent as ListIntentProtocol,
        model: model as ListModelStateProtocol,
        modelChangePublisher: model.objectWillChange
    )
    return ListView(container: container)
}
