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
    let betItems: [(String, String)]
}

struct HeadlineCell: View {
    
    let model: HeadlineCellModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            contentView
            betItemsView
        }
    }
        
    private var contentView: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                HeadlineText(text: model.competitor1)
                HeadlineText(text: model.competitor2)
            }
            
            Spacer(minLength: 140)
            
            HeadlineText(text: model.startTime)
        }
        .padding(16)
        .background(LinearGradient(
            gradient: Gradient(colors: [Color("CharcoalBlack"), Color("GoldRay")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .circular))
    }
    
    private var betItemsView: some View {
        HStack(alignment: .center, spacing: 8) {
            ForEach(model.betItems, id: \.0) { code, price in
                HStack(spacing: 32) {
                    Text(code)
                        .font(.caption)
                        .foregroundColor(Color("BlackGold"))
                    
                    Text(price)
                        .font(.caption)
                        .foregroundColor(Color("BlackGold"))
                }
                .padding(8)
                .background(Color("SnowWhite"))
                .cornerRadius(4)
            }
        }
    }

}

struct HeadlineText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
    }
}
