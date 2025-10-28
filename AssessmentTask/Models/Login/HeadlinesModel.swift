//
//  HeadlinesModel.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 27/10/25.
//

import Foundation

public struct HeadlinesModel: Identifiable {
    public let id = UUID()
    public let competitor1Caption: String
    public let competitor2Caption: String
    public let startTime: String
    public let betItems: [(String, String)]
}
