//
//  HeadlineCell.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 27/10/25.
//

import Foundation
import SwiftUI

struct HeadlineCellModel {
    let competitor1: String
    let competitor2: String
    let startTime: String
}

struct HeadlineCell: View {
    
    let model: HeadlineCellModel
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text(model.competitor1)
                    .font(.headline)
                Text(model.competitor2)
                    .font(.headline)
            }
            
            Spacer(minLength: 24)
            
            Text(model.startTime)
                .font(.headline)
        }
    }
}
