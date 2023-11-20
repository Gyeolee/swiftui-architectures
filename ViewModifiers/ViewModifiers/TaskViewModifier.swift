//
//  TaskViewModifier.swift
//  ViewModifiers
//
//  Created by Hangyeol on 11/20/23.
//

import SwiftUI

public extension View {
    func onlyOnceTask(priority: TaskPriority = .userInitiated, action: @escaping () async -> Void) -> some View {
        modifier(TaskViewModifier(priority: priority, action: action))
    }
}

struct TaskViewModifier: ViewModifier {
    @State private var didLoad = false
    
    var priority: TaskPriority
    var action: () async -> Void
    
    func body(content: Content) -> some View {
        content
            .task(priority: priority) {
                if didLoad == false {
                    didLoad = true
                    await action()
                }
            }
    }
}
