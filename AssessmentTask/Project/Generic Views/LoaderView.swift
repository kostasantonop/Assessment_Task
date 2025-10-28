//
//  LoaderView.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 28/10/25.
//

import Foundation
import SwiftUI
import Combine

struct LoaderView: View {
    @ObservedObject var manager = LoaderManager.shared
    
    var body: some View {
        if manager.isLoading {
            ZStack {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(2)
            }
            .transition(.opacity)
            .zIndex(1_000) 
        }
    }
}
