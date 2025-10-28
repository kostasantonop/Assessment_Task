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
        VStack(alignment: .center, spacing: 32) {
            Text("AppTitle".localized)
                .font(.title.bold())
                .padding(.top, 32)
                .onAppear { container.intent.getAuthToken() }
            
            contentView
        }
        .background(.green)
    }
    
    @ViewBuilder
    private var contentView: some View {
        let variant = container.model.state.stateVariant
        switch variant {
        case .withButton:
            contentButtonView
                .frame(maxWidth: .infinity)
        case .withData:
            contentDataView
        }
    }
    
    private var contentButtonView: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer(minLength: 0)
            buttonView
            Spacer(minLength: 0)
        }
        
    }
    
    private var contentDataView: some View {
        VStack(alignment: .center, spacing: 32) {
            headlineView
            gamesView
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .circular))
                .padding(.horizontal, 20)
        }
    }
    
    @ViewBuilder
    private var buttonView: some View {
        Button(action: {
            container.intent.getGamesAndHeadlines()
            startRepeatingUpdates()
        }, label: {
            Text("CTA_button".localized)
                .padding(48)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(8)
        })
    }
    
    private var headlineView: some View {
        CarouselView(model: CarouselModel(time: 5), items: container.model.state.content.headlines ?? []) { headline in
            HeadlineCell(model: HeadlineCellModel(competitor1: headline.competitor1Caption, competitor2: headline.competitor2Caption, startTime: headline.startTime, betItems: headline.betItems))
        }
    }
    
    //TODO: Fix scrolling view issue
    private var gamesView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(container.model.state.content.games ?? []) { game in
                    GameCell(model: GameCellModel(competitor1: game.competitor1, competitor2: game.competitor2, elapsed: game.elapsed.timeInterval?.display() ?? "invalid_time_elapsed".localized, time: 1))
                        .padding(8)
                        .padding(.bottom, 8)
                }
            }
        }
    }
    
    private func startRepeatingUpdates() {
        Task {
            while true {
                try? await Task.sleep(nanoseconds: 10 * 1_000_000_000)
                await MainActor.run {
                    print("Updating....")
                    container.intent.updateGamesAndHeadlines()
                }
            }
        }
    }
}
