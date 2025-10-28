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
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center, spacing: 0) {
                contentView
                Spacer(minLength: 24)
                Text(elapsed)
                    .font(.caption)
            }
            Divider()
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
            Text(model.competitor2)
                .font(.subheadline)
        }
    }
    
    private func startTimer(with time: Double) {
            Timer.scheduledTimer(withTimeInterval: time, repeats: true) { _ in
                let newElapsed = elapsed.deducted(by: time)
                DispatchQueue.main.async {
                    elapsed = newElapsed
                }
            }
        }
}
