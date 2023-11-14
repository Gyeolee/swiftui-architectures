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
        Text("Detail View")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: navigator.pop) {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Go Back")
                        }
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
