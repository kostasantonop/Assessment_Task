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
    
    private var cancellable: Set<AnyCancellable> = []

    public init(intent: Intent, model: Model, modelChangePublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model
        
        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cancellable)
     }
}
