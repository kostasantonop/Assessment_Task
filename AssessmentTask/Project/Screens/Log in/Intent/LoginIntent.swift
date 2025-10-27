//
//  LoginIntent.swift
//  AssessmentTask
//
//  Created by k.a.antonopoulos on 26/10/25.
//

import Foundation
import PromiseKit

public class LoginIntent {
    
    private var model: LoginModelProtocol?
    private var service: LoginServiceProtocol?
    
    public init(model: LoginModelProtocol, service: LoginServiceProtocol) {
        self.model = model
        self.service = service
    }
}

extension LoginIntent: LoginIntentProtocol {
    
    public func getAuthToken() {
        LoaderManager.shared.show()
        service?.getAuthToken().done { response in
            APIRouter.shared.defaultHeaders["Auth"] = "\(response.token_type) \(response.access_token)"
        }.ensure {
            LoaderManager.shared.hide()
        }.catch { error in
            self.log(error)
        }
    }
    
    public func getGamesAndHeadlines() {
        LoaderManager.shared.show()
        service?.getGamesAndHeadlines().done { games, headlines in
            self.model?.handleSuccessfulResponse(games: games, headlines: headlines)
        }.ensure {
            LoaderManager.shared.hide()
        }.catch { error in
            self.log(error)
        }
    }
    
    public func updateGamesAndHeadlines() {
        LoaderManager.shared.show()
        service?.updateGamesAndHeadlines().done { games, headlines in
            self.model?.handleSuccessfulResponse(games: games, headlines: headlines)
        }.ensure {
            LoaderManager.shared.hide()
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
