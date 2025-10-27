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
            headlineView
                .padding(.leading, 20)
            gamesView
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .circular))
                .padding(.horizontal, 20)
        }
    }
    
    //TODO: Implement snap carousel
    private var headlineView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom, spacing: 16) {
                ForEach(container.model.state.content.headlines ?? []) { headline in
                    HeadlineCell(model: HeadlineCellModel(competitor1: headline.competitor1Caption, competitor2: headline.competitor2Caption, startTime: headline.startTime))
                }
            }
        }
    }
    
    //TODO: Fix scrolling view issue
    private var gamesView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(container.model.state.content.games ?? []) { game in
                    GameCell( model: GameCellModel(competitor1: game.competitor1, competitor2: game.competitor2))
                        .padding(8)
                        .padding(.bottom, 8)
                }
            }
        }
    }
}
