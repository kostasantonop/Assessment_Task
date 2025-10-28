//
//  GameCell.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 27/10/25.
//

import Foundation
import SwiftUI

struct GameCellModel {
    var competitor1: String
    var competitor2: String
    var elapsed: String
    var time: Double?
}

struct GameCell: View {
    
    var model: GameCellModel
    @State private var elapsed: String
    
    init(model: GameCellModel) {
        self.model = model
        _elapsed = State(initialValue: model.elapsed)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center, spacing: 0) {
                contentView
                Spacer(minLength: 24)
                timeElapsedView
            }
            Divider()
                .background(.white)
        }
        .onAppear {
            if let time = model.time {
                startTimer(with: time)
            }
        }
    }
    
    private var contentView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.competitor1)
                .font(.subheadline)
                .foregroundColor(Color("GoldRay"))
            Text(model.competitor2)
                .font(.subheadline)
                .foregroundColor(Color("GoldRay"))
        }
    }
    
    private var timeElapsedView: some View {
        VStack(alignment: .center, spacing: 4) {
            Text("games_time_label".localized)
                .font(.caption.bold())
                .foregroundColor(Color("GoldRay"))
            Text(elapsed)
                .font(.caption)
                .foregroundColor(Color("GoldRay"))
        }
    }
    
    private func startTimer(with time: Double) {
            Timer.scheduledTimer(withTimeInterval: time, repeats: true) { _ in
                let newElapsed = elapsed.increment(by: time)
                DispatchQueue.main.async {
                    elapsed = newElapsed
                }
            }
        }
}
