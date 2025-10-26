//
//  Container.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Combine
import Foundation

public final class Container<Intent, Model>: ObservableObject {
    
    public let intent: Intent
    public let model: Model

    public init(intent: Intent, model: Model) {
        self.intent = intent
        self.model = model
     }
}
