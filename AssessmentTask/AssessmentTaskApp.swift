//
//  AssessmentTaskApp.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import SwiftUI

@main
struct AssessmentTaskApp: App {
    //TODO: Look into and solve memory leak
    var body: some Scene {
        WindowGroup {
            ZStack {
                LoginScreenFactory().make()
                LoaderView()
            }
        }
    }
}
