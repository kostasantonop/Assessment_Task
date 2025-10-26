//
//  APIRouter.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation

enum APIRouter {
    
    private static let urlPrefix = "https://raw.githubusercontent.com/kfiliosNovibet/NoviTest/refs/heads/main/"

    case token
    case games
    case headlines
    case updatedGames
    case updatedHeadlines
    
    var urlString: String {
        switch self {
        case .token:
            return APIRouter.urlPrefix + "token."
        case .games:
            return APIRouter.urlPrefix + "livegames"
        case .headlines:
            return APIRouter.urlPrefix + "headlines"
        case .updatedGames:
            return APIRouter.urlPrefix + "updatedlivegames"
        case .updatedHeadlines:
            return APIRouter.urlPrefix + "updatedheadlines"
        }
    }
}
