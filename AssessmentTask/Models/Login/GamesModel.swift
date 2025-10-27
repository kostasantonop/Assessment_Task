//
//  GamesModel.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 27/10/25.
//

import Foundation

public struct GamesModel: Identifiable {
    public let id = UUID()
    public let competitor1: String
    public let competitor2: String
}
