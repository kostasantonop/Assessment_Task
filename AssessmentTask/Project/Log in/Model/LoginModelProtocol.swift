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

public struct LoginStore {
    //TODO: Save in App instead of temporary saving
    public var token: String?
    public var tokenType: String?
}

public protocol LoginModelStateProtocol {
    var state: LoginState { get }
}

public protocol LoginModelProtocol: AnyObject {
    func handleSuccessfulResponse(games: [APIResponseGames], headlines: [APIResponseHeadlines])
}
