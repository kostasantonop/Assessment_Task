//
//  LoginScreen.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation
import SwiftUI

struct LoginScreen: View {
    @ObservedObject var container: Container<LoginIntent, LoginModel>
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .onAppear {
                    container.intent.getAuthToken()
                }
        }
        .padding()
    }
}
