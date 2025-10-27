//
//  APIResponseHeadlines.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 27/10/25.
//

import Foundation

public struct APIResponseHeadlines: Codable {
    public let betViews: [APIResponeseHeadlineBetView]
}

public struct APIResponeseHeadlineBetView: Codable {
    public let competitor1Caption: String?
    public let competitor2Caption: String?
    public let startTime: String?
}
