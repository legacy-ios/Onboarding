//
//  OnboardingViewModel.swift
//  Onboarding
//
//  Created by jungwooram on 2020-05-15.
//  Copyright © 2020 jungwooram. All rights reserved.
//

import Foundation

struct OnboardingViewModel {
    
    private let itemCount: Int
    
    init(withItemCount itemCount: Int) {
        self.itemCount = itemCount
    }
    
    func shouldShowGetStartedButton(forIndex index: Int) -> Bool {
        return index == itemCount - 1 ? true : false
    }
}
