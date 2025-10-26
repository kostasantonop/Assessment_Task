//
//  LoginIntent.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation

public class LoginIntent {
    
    private var model: LoginModel?
    private var service: LoginServiceProtocol?
    
    public init(model: LoginModel, service: LoginServiceProtocol) {
        self.model = model
        self.service = service
    }
}

extension LoginIntent: LoginIntentProtocol {}
