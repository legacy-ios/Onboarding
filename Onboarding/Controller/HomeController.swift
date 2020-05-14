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
    
    func logout() {
        do{
            try Auth.auth().signOut()
            self.presentLoginController()
        } catch {
            print("DEBUG: Error signing out")
        }
    }
    
    fileprivate func presentLoginController() {
        let controller = LoginController()
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
    }
    
    func authenticateUser() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                self.presentLoginController()
            }
        } else {
            print("DEBUG: User IS Logged in..")
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        authenticateUser()
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        configureGradientBackground()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Firebase Login"
        
        let image = UIImage(systemName: "arrow.left")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
}
