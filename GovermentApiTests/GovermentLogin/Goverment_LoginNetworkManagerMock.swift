//
//  Goverment_LoginNetworkManagerMock.swift
//  GovermentApiTests
//
//  Created by Mac on 18/12/23.
//

import XCTest
import GoogleSignIn
@testable import GovermentApi

class Goverment_LoginNetworkManagerMock: AuthenticationManagerProtocol {
    
    var authenticationSuccess = true
    var postNewUserCalled = false
    var authenticateUserLoginCalled = false
    var fetchLognInWithGoogleCalled = false
    var authenticateFaceBiometricsLoginCalled = false

    func createUser(withEmail email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        postNewUserCalled = true
        completion(authenticationSuccess, nil)
    }
    
    func signIn(withEmail email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        authenticateUserLoginCalled = true
        completion(authenticationSuccess, nil)
    }
    
    func signInWithGoogle(clientID: String?, presenting viewController: UIViewController, completion: @escaping (Bool, String?) -> Void) {
        fetchLognInWithGoogleCalled = true
        completion(authenticationSuccess, nil)
    }
    
    func signInWithBiometrics(completion: @escaping (Bool, String?) -> Void) {
        authenticateFaceBiometricsLoginCalled = true
        completion(authenticationSuccess, nil)
    }
}
