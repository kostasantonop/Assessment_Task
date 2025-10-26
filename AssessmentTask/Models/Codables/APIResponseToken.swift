//
//  APIResponseToken.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation

struct APIResponseToken: Codable {
    let access_token: String
    let token_type: String
}
