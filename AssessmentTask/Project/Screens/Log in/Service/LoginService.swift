//
//  LoginService.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation
import PromiseKit

class LoginService: LoginServiceProtocol {
    
    func getAuthToken() -> Promise<APIResponseToken> {
        APIRouter.shared.request(urlString: UrlFactory.token.url())
    }
    
    func getGamesAndHeadlines() -> Promise<([APIResponseGames], [APIResponseHeadlines])> {
        return when(fulfilled: getGames(), getHeadlines())
            .map { games, headlines in (games, headlines) }
    }
    
    private func getGames() -> Promise<[APIResponseGames]> {
        APIRouter.shared.request(urlString: UrlFactory.games.url())
    }
    
    private func getHeadlines() -> Promise<[APIResponseHeadlines]> {
        APIRouter.shared.request(urlString: UrlFactory.headlines.url())
    }
    
    func updateGamesAndHeadlines() -> Promise<([APIResponseGames], [APIResponseHeadlines])> {
        return when(fulfilled: updateGames(), updateHeadlines())
            .map { games, headlines in (games, headlines) }
    }
    
    func updateGames() -> Promise<[APIResponseGames]> {
        APIRouter.shared.request(urlString: UrlFactory.updatedGames.url(useUpdate: true))
    }
    
    func updateHeadlines() -> Promise<[APIResponseHeadlines]> {
        APIRouter.shared.request(urlString: UrlFactory.updatedHeadlines.url(useUpdate: true))
    }
}
