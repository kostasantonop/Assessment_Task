//
//  LoaderManager.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 28/10/25.
//

import Foundation
import SwiftUI
import Combine

final class LoaderManager: ObservableObject {
    static let shared = LoaderManager()
    @Published var isLoading: Bool = false
    
    private init() {}
    
    func show() {
        self.isLoading = true
    }
    
    func hide() {
        self.isLoading = false
    }
}
