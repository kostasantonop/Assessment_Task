//
//  LoginStateContent.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation

public struct LoginStateContent {
    public var games: [GamesModel]?
    public var headlines: [HeadlinesModel]?
}

public enum StateVariant: Equatable {
    case withButton
    case withData
}
