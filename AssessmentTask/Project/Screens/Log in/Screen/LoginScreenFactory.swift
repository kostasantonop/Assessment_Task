//
//  LoginScreenFactory.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation

class LoginScreenFactory {
    
    func make() -> LoginScreen {
        let model = LoginModel()
        let intent = LoginIntent(model: model, service: LoginService())
        let container = Container(intent: intent as LoginIntentProtocol, model: model as LoginModelStateProtocol, modelChangePublisher: model.objectWillChange)
        let view = LoginScreen(container: container)
        return view
    }
}
