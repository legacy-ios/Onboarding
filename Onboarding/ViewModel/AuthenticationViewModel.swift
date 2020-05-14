//
//  AuthenticationViewModel.swift
//  Onboarding
//
//  Created by jungwooram on 2020-05-14.
//  Copyright © 2020 jungwooram. All rights reserved.
//

import UIKit

protocol FormViewModel {
    func updateForm()
}

protocol AuthenticationViewModel {
    var formIsValid: Bool { get }
    var shouldEnableButton: Bool { get }
    var buttonTitleColor: UIColor { get }
    var buttonBackgroundColor: UIColor { get }

}

struct LoginViewModel: AuthenticationViewModel {
    
    var email: String?
    var password: String?
        
    // 둘다 엠티가 아니면 true
    var formIsValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
    }
    
    var shouldEnableButton: Bool {
        return formIsValid
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1.0, alpha: 0.67)
    }
    
    var buttonBackgroundColor: UIColor {
        let enablePurple = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        let disabledPurble = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        return formIsValid ? enablePurple : disabledPurble
    }
    
}

struct RegistrationViewModel: AuthenticationViewModel {
    
    var email: String?
    var password: String?
    var fullName: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
            && fullName?.isEmpty == false
    }
    
    var shouldEnableButton: Bool {
        return formIsValid
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1.0, alpha: 0.67)
    }
    
    var buttonBackgroundColor: UIColor {
        let enablePurple = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        let disabledPurble = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        return formIsValid ? enablePurple : disabledPurble
    }
    
}

struct ResetPasswordViewModel: AuthenticationViewModel {
    
    var email: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
    }
    
    var shouldEnableButton: Bool {
        return formIsValid
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1.0, alpha: 0.67)
    }
    
    var buttonBackgroundColor: UIColor {
        let enablePurple = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        let disabledPurble = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        return formIsValid ? enablePurple : disabledPurble
    }
    
}
