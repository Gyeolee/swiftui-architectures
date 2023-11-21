//
//  LoadingViewModifier.swift
//  ViewModifiers
//
//  Created by Hangyeol on 11/21/23.
//

import SwiftUI

public extension View {
    func loading(_ isLoading: Bool) -> some View {
        modifier(LoadingViewModifier(isLoading: isLoading))
    }
}

struct LoadingViewModifier: ViewModifier {
    var isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .blur(radius: isLoading ? 10 : 0)
            
            ActivityIndicatorView(isAnimating: .constant(true))
                .opacity(isLoading ? 1 : 0)
        }
    }
}

struct ActivityIndicatorView: UIViewRepresentable {
    @Binding var isAnimating: Bool
    
    private let style: UIActivityIndicatorView.Style = .large

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
