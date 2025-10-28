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
    
    public init() {}
}

extension LoginModel: LoginModelProtocol {
    
    public func handleSuccessfulResponse(games: [APIResponseGames], headlines: [APIResponseHeadlines]) {
        state.stateVariant = .withData
        handleSuccessfulGamesResponse(games)
        handleSuccessfulHeadlinesResponse(headlines)
    }
    
    private func handleSuccessfulGamesResponse(_ games: [APIResponseGames]) {
        state.content.games = games.flatMap { game in
            game.betViews?.flatMap { betView in
                betView.competitions?.flatMap { competition in
                    competition.events?.compactMap { event in
                        guard let captions = event.additionalCaptions, let c1 = captions.competitor1, let c2 = captions.competitor2, let elapsed = event.liveData?.elapsed
                        else {return nil}
                        return GamesModel(competitor1: c1, competitor2: c2, elapsed: elapsed)
                    } ?? []
                } ?? []
            } ?? []
        }
    }
    
    private func handleSuccessfulHeadlinesResponse(_ headlines: [APIResponseHeadlines]) {
        state.content.headlines = headlines.flatMap { headline in
            headline.betViews.compactMap { betView in
                guard let startTime = betView.startTime, let c1 = betView.competitor1Caption, let c2 = betView.competitor2Caption
                else {return nil}
                let betItems: [(String, String)] = betView.betItems?.compactMap { betItem in
                    if let code = betItem.code,
                       let price = betItem.price {
                        return (code, String(price))
                    }
                    return nil
                } ?? []
                return HeadlinesModel(competitor1Caption: c1, competitor2Caption: c2, startTime: startTime, betItems: betItems)
            }
        }
    }
}
