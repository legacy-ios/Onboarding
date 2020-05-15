//
//  HomeController.swift
//  Onboarding
//
//  Created by jungwooram on 2020-05-14.
//  Copyright © 2020 jungwooram. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UIViewController {
    
    //MARK: - Properties
    
    private var user: User? {
        didSet {
            presentOnboardingIfNeccessary()
            showWelcomeLabel()
        }
    }
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.alpha = 0
        return label
    }()
    
    //MARK: - Selectors
    
    @objc func handleLogout() {
        
        let alert = UIAlertController(title: nil, message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            self.logout()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - API
    
    func fetchUser() {
        Service.fetchUser { user in
            self.user = user
        }
    }
    
    func logout() {
        do{
            try Auth.auth().signOut()
            self.presentLoginController()
        } catch {
            print("DEBUG: Error signing out")
        }
    }
    
    func authenticateUser() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                self.presentLoginController()
            }
        } else {
            fetchUser()
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        authenticateUser()
    }
    
    //MARK: - Helpers
    
    fileprivate func showWelcomeLabel() {
        guard let user = user else { return }
        guard user.hasSeenOnboarding else { return } // when hasSeenOnboarding is true
        welcomeLabel.text = "Welcome!! \(user.fullname)"
        UIView.animate(withDuration: 1) {
            self.welcomeLabel.alpha = 1
        }
    }
    
    fileprivate func presentLoginController() {
        let controller = LoginController()
        controller.delegate = self
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
    }
    
    fileprivate func presentOnboardingIfNeccessary() {
        guard let user = user else { return }
        if user.hasSeenOnboarding { return }
        let controller = OnboardingController()
        controller.delegate = self
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    func configureUI() {
        configureGradientBackground()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Firebase Login"
        
        let image = UIImage(systemName: "arrow.left")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        view.addSubview(welcomeLabel)
        welcomeLabel.centerX(inView: view)
        welcomeLabel.centerY(inView: view)
    }
}

extension HomeController: OnboardingControllerDelegate {
    func controllerWantsToDismiss(_ controller: OnboardingController) {
        controller.dismiss(animated: true, completion: nil)
        
        Service.updateUserHasSeenOnboarding { (error, ref) in
            self.user?.hasSeenOnboarding = true // 메뉴얼리 업데이트
            print("DEBUG: Didset has seen onboarding")
        }
    }
}

extension HomeController: AuthenticationDelegate {
    func authenticationComplete() {
        dismiss(animated: true, completion: nil)
        fetchUser()
    }
}
