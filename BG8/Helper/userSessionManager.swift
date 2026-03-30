//
//  userSessionManager.swift
//  IREP
//
//  Created by Mac HD on 16/07/2025.
//

import SwiftUI

final class UserSessionManager {
    static let shared = UserSessionManager()

    private let tokenKey = "accessToken"
    private let userNameKey = "userName"
    private let emailKey = "email"
    private let phoneNumberKey = "phoneNumber"
    private let profileKey = "profile"
    private let passwordKey = "password"
    private let roleKey = "role"
    private let enableFaceIdKey = "enableFaceId"

    var token: String? {
        get {
            UserDefaults.standard.string(forKey: tokenKey)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: tokenKey)
        }
    }

    var userName: String? {
        get {
            UserDefaults.standard.string(forKey: userNameKey)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: userNameKey)
        }
    }

    var email: String? {
        get {
            UserDefaults.standard.string(forKey: emailKey)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: emailKey)
        }
    }

    var phoneNumber: String? {
        get {
            UserDefaults.standard.string(forKey: phoneNumberKey)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: phoneNumberKey)
        }
    }

    var profile: String? {
        get {
            UserDefaults.standard.string(forKey: profileKey)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: profileKey)
        }
    }

    var password: String? {
        get {
            UserDefaults.standard.string(forKey: passwordKey)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: passwordKey)
        }
    }
    
    var role: Int? {
        get {
            UserDefaults.standard.integer(forKey: roleKey)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: roleKey)
        }
    }
  var enableFaceId: Bool? {
        get {
            UserDefaults.standard.bool(forKey: enableFaceIdKey)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: enableFaceIdKey)
        }
    }

    func clearSession() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
        UserDefaults.standard.removeObject(forKey: userNameKey)
//        UserDefaults.standard.removeObject(forKey: emailKey)
        UserDefaults.standard.removeObject(forKey: phoneNumberKey)
        UserDefaults.standard.removeObject(forKey: profileKey)
//        UserDefaults.standard.removeObject(forKey: passwordKey)
        UserDefaults.standard.removeObject(forKey: roleKey)
    }
}


final class UserSessionFaceId: ObservableObject {
    static let shared = UserSessionFaceId()
    private let enableFaceIdKey = "enableFaceId"

    @Published var enableFaceId: Bool {
        didSet {
            UserDefaults.standard.set(enableFaceId, forKey: enableFaceIdKey)
        }
    }

    private init() {
        self.enableFaceId = UserDefaults.standard.bool(forKey: enableFaceIdKey)
    }
}
