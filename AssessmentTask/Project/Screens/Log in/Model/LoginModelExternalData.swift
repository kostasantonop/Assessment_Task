//
//  LoginModelExternalData.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation

public class LoginModelExternalData {
    
    public var externalContent: LoginModelExternalContent
    
    public init(externalContent: LoginModelExternalContent) {
        self.externalContent = externalContent
    }
}

public struct LoginModelExternalContent {
    public init() {}
}
