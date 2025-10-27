//
//  GameCell.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 27/10/25.
//

import Foundation
import SwiftUI

struct GameCellModel {
    var competitor1: String?
    var competitor2: String?
}

struct GameCell: View {
    
    let model: GameCellModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.competitor1 ?? "-")
                .font(.headline)
            Text(model.competitor2 ?? "-")
                .font(.headline)
            Divider()
        }
    }
}
