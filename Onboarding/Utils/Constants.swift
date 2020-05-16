//
//  Constants.swift
//  Onboarding
//
//  Created by jungwooram on 2020-05-15.
//  Copyright © 2020 jungwooram. All rights reserved.
//

import Foundation
import Firebase

let MSG_METRICS = "Metrics"
let MSG_DASHBOARD = "Dashboard"
let MSG_NOTIFICATION = "Get Notified"

let MSG_ONBOARDING_METRICS = "Extract valuale insights and come up with data driven product initiatives to help grow your business"
let MSG_ONBOARDING_NOTIFICATIONS = "Get notified when important stuff is happening, so you don't miss out on the action"
let MSG_ONBOARDING_DASHBOARD = "Everything you need all in one place, avaliable throught our dashboard feature"
let MSG_RESET_PASSWORD_LINK_SENT = "We sent a link to your email to reset your password"

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")

