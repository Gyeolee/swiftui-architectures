//
//  MVIContainer.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI
import Combine

final class MVIContainer<Intent, Model>: ObservableObject {
    var intent: Intent
    var model: Model

    private var cancellable: Set<AnyCancellable> = []

    init(intent: Intent, model: Model, modelChangePublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model

        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cancellable)
    }
}

