//
//  AuthUser.swift
//  ReptileHub
//
//  Created by 임재현 on 8/8/24.
//

import GoogleSignIn
import AuthenticationServices


protocol AuthUser {
    var uid: String { get }
    var email: String? { get }
    var name: String? { get }
}

// GoogleAuthUser 클래스 정의
struct GoogleAuthUser: AuthUser {
    let uid: String
    let email: String?
    let name: String?

    init(user: GIDGoogleUser) {
        self.uid = user.userID ?? ""
        self.email = user.profile?.email
        self.name = user.profile?.name
    }
}

// AppleAuthUser 클래스 정의
struct AppleAuthUser: AuthUser {
    let uid: String
    let email: String?
    let name: String?

    init(credential: ASAuthorizationAppleIDCredential) {
        self.uid = credential.user
        self.email = credential.email
        self.name = credential.fullName?.formatted()
    }
}
