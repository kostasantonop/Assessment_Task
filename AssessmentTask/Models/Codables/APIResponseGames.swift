//
//  APIResponseGames.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 27/10/25.
//

import Foundation

public struct APIResponseGames: Codable {
    public let caption: String?
    public let betViews: [APIResponseBetViews]?
}
 
public struct APIResponseBetViews: Codable {
    public let competitions: [APIResponseCompetition]?
}

public struct APIResponseCompetition: Codable {
    public let events: [APIResponseEvent]?
}

public struct APIResponseEvent: Codable {
    public let additionalCaptions: APIResponseAdditionalCaption?
    public let liveData: APIResponseLiveData?
}

public struct APIResponseAdditionalCaption: Codable {
    public let competitor1: String?
    public let competitor2: String?
}

public struct APIResponseLiveData: Codable {
    public let elapsed: String?
}
