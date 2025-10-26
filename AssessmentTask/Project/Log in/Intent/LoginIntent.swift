//
//  LoginIntent.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation
import PromiseKit

public class LoginIntent {
    
    private var model: LoginModel?
    private var service: LoginServiceProtocol?
    
    public init(model: LoginModel, service: LoginServiceProtocol) {
        self.model = model
        self.service = service
    }
}

extension LoginIntent: LoginIntentProtocol {
    
    public func getAuthToken() {
        service?.getAuthToken().done { response in
            APIRouter.shared.defaultHeaders["Auth"] = "\(response.tokenType) \(response.token)"
            print(APIRouter.shared.defaultHeaders)
        }.catch { error in
            self.log(error)
        }
    }
    
    private func log(_ error: Error) {
        if let error = error as NSError? {
            print("Error: \(error.domain) with error code: \(error.code)")
        } else {
            print(error)
        }
    }
}
