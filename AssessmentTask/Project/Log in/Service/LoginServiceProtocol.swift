//
//  LoginServiceProtocol.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation
import PromiseKit

public protocol LoginServiceProtocol {
    func getAuthToken() -> Promise<APIResponseToken>
    func getGames() -> Promise<[APIResponseGames]>
}
