//
//  StartPageViewController.swift
//  SSAnalytics
//
//  Created by Peter Standret on 3/14/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import UIKit
import STT
import RxSwift

class StartPageViewController: SttKeyboardViewController<StartPagePresenter>, StartPageViewDelegate {
    
    @IBOutlet weak var loginButton: UILoginButtons!
    
    @IBOutlet weak var loginView: UILoginView!
    @IBOutlet weak var passwordView: UIPasswordView!
    
    var errorCorect: SttValidationResult!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        settings()
    }
    
    func settings() {
        
        loginButton.layer.cornerRadius = 25
        
        loginView.label.text = ""
        loginView.textField.placeholder = "Label"
        
        passwordView.textField.placeholder = "••••••••••••"
        passwordView.label.text = ""
    }
    
    var set: SttBindingSet<StartPageViewController>!
    override func bind() {
        set = SttBindingSet(parent: self)
        
        set.bind(loginView.textField).to(presenter.email.rawValue)
        set.bind(String.self).forProperty({ $0.loginView.errorLabel.text = $1;
            print($1)
            
        })
            .to(presenter.email.errorValue)
        set.bind(loginView.textField).forTarget(.didEndEditing)
            .to(presenter.validate).withCommandParametr(ValidationFieldType.email)
        
        set.bind(passwordView.textField).to(presenter.password.rawValue)
        set.bind(String.self).forProperty({ $0.passwordView.errorLabel.text = $1;
            print($1)
            
        })
            .to(presenter.password.errorValue)
        set.bind(passwordView.textField).forTarget(.didEndEditing)
            .to(presenter.validate).withCommandParametr(ValidationFieldType.password)
        
        set.bind(loginButton.tap()).to(presenter.setData)
                
        set.apply()
        
        presenter.setData.useIndicator(button: loginButton)
            .disposed(by: presenter.listenerDisposableBag)
        
        
    }
	// MARK: - implementation of StartPageViewDelegate
}
