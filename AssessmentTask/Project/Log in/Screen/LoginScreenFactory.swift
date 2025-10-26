//
//  LoginScreenFactory.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation

class LoginScreenFactory {
    
    private let data: LoginModelExternalData?
    
    init(data: LoginModelExternalData?) {
        self.data = data
    }

    func make() -> LoginScreen {
        let model = LoginModel(externalData: self.data)
        let intent = LoginIntent(model: model, service: LoginService())
        let container = Container(intent: intent, model: model)
        let view = LoginScreen(container: container)
        return view
    }
}
