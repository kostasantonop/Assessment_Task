//
//  APIResponseToken.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation

public struct APIResponseToken: Codable {
    public let access_token: String
    public let token_type: String
}
