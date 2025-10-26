//
//  LoginModel.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation

public final class LoginModel: ObservableObject {
    
    @Published public var state = LoginState()
    public var store = LoginStore()
    var externalData: LoginModelExternalData?
    
    public init(externalData: LoginModelExternalData?) {
        self.externalData = externalData
    }
}

extension LoginModel: LoginModelProtocol {}
