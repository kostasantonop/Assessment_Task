//
//  CarouselView.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 27/10/25.
//

import Foundation
import SwiftUI

struct CarouselModel {
    var time: Double? = nil
}

struct CarouselView<Content: View, T: Identifiable>: View {
    var model: CarouselModel
    var items: [T]
    var content: (T) -> Content
    @State private var currentIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            indexDisplayView
            
            TabView(selection: $currentIndex) {
                ForEach(items.indices, id: \.self) { index in
                    content(items[index])
                        .tag(index)
                        .padding(8)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 150)
        }
        .onAppear {
            if let time = model.time {
                startTimer(with: time)
            }
        }
    }
    
    private var indexDisplayView: some View {
        HStack(spacing: 8) {
            ForEach(items.indices, id: \.self) { index in
                Circle()
                    .fill(index == currentIndex ? Color("CharcoalBlack"): Color.gray)
                    .frame(width: 8, height: 8)
                    .animation(.easeInOut(duration: 0.2), value: currentIndex)
            }
        }
    }
    
    private func startTimer(with time: Double) {
        guard let time = model.time else { return }
        
        Timer.scheduledTimer(withTimeInterval: time, repeats: true) { _ in
            currentIndex = (currentIndex + 1) % items.count
        }
    }
}
