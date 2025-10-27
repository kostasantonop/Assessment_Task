//
//  LoginScreen.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation
import SwiftUI

struct LoginScreen: View {
    @ObservedObject var container: Container<LoginIntentProtocol, LoginModelStateProtocol>
    
    var body: some View {
        contentView
            .frame(maxWidth: .infinity)
            .background(.green)
    }
    
    private var contentView: some View {
        VStack(alignment: .center, spacing: 32) {
            Text("AppTitle".localized)
                .font(.title)
                .onTapGesture { container.intent.getGamesAndHeadlines() }
                .onAppear { container.intent.getAuthToken() }
            gamesView
                .background(.white)
                .padding(.horizontal, 20)
        }
    }
    
    //TODO: Fix scrolling view issue
    private var gamesView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(container.model.state.content.games ?? []) { game in
                    GameCell( model: GameCellModel(competitor1: game.competitor1, competitor2: game.competitor2))
                        .padding(.horizontal, 4)
                }
            }
        }
    }
}
