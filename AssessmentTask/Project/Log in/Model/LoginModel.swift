//
//  LoginModel.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation

public final class LoginModel: ObservableObject, LoginModelStateProtocol {
    
    @Published public var state: LoginState = LoginState()
    public var store = LoginStore()
    var externalData: LoginModelExternalData?
    
    public init(externalData: LoginModelExternalData?) {
        self.externalData = externalData
    }
}

extension LoginModel: LoginModelProtocol {
    
    public func handleSuccessfulResponse(games: [APIResponseGames], headlines: [APIResponseHeadlines]) {
        handleSuccessfulGamesResponse(games)
    }
    
    private func handleSuccessfulGamesResponse(_ games: [APIResponseGames]) {
        state.content.games = games.flatMap { game in
            game.betViews?.flatMap { betView in
                betView.competitions?.flatMap { competition in
                    competition.events?.compactMap { event in
                        guard let captions = event.additionalCaptions, let c1 = captions.competitor1, let c2 = captions.competitor2
                        else {return nil}
                        return GamesModel(competitor1: c1, competitor2: c2)
                    } ?? []
                } ?? []
            } ?? []
        }
    }
}
