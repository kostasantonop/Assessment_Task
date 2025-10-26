//
//  AssessmentTaskApp.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import SwiftUI

@main
struct AssessmentTaskApp: App {
    var body: some Scene {
        WindowGroup {
            let content = LoginModelExternalContent()
            let data = LoginModelExternalData(externalContent: content)
            LoginScreenFactory(data: data).make()
        }
    }
}
