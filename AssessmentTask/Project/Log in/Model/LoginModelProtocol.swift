//
//  LoginModelProtocol.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation

public struct LoginState {
    
    public var content: LoginStateContent = LoginStateContent()
    //TODO: Implement loading
    public init() {}
}

// sourcery: AutoMockable
public protocol EverydayInvestIntroModelStatePotocol {
    var state: LoginState { get }
}

// sourcery: AutoMockable
public protocol LoginModelProtocol: AnyObject {}
