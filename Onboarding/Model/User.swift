//
//  User.swift
//  Onboarding
//
//  Created by jungwooram on 2020-05-15.
//  Copyright © 2020 jungwooram. All rights reserved.
//

import Foundation

struct User {
    let email: String
    let fullname: String
    var hasSeenOnboarding: Bool
    let uid: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.hasSeenOnboarding = dictionary["hasSeenOnboarding"] as? Bool ?? false
    }
    
    init(dictionary: [String: Any]) {
        self.uid = dictionary["uid"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.hasSeenOnboarding = dictionary["hasSeenOnboarding"] as? Bool ?? false
    }
}
