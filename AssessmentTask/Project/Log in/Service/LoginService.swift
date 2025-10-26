//
//  LoginService.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation
import PromiseKit

class LoginService: LoginServiceProtocol {
    
    func getAuthToken() -> Promise<APIResponseToken> {
        APIRouter.shared.request(urlString: UrlFactory.token.urlString)
    }
}
