//
//  TermsAgreementViewController.swift
//  ReptileHub
//
//  Created by 임재현 on 8/8/24.
//

import UIKit
import GoogleSignIn

class TermsAgreementViewController: UIViewController {
    var user: GIDGoogleUser
    var onAgreementAccepted: (()->Void)?
    var onAgreementDeclined: (()->Void)?
    
    private let agreeButton = UIButton(type: .system)
    private let declineButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    init(user:GIDGoogleUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        view.backgroundColor = .white
        view.addSubview(agreeButton)
        view.addSubview(declineButton)
        
        agreeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-20)
        }
        
        declineButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            
            agreeButton.addTarget(self, action: #selector(agreeButtonTapped), for: .touchUpInside)
            declineButton.addTarget(self, action: #selector(declineButtonTapped), for: .touchUpInside)
            
        }
        
        
    }
    
    @objc private func agreeButtonTapped() {
        onAgreementAccepted?()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func declineButtonTapped() {
        onAgreementDeclined?()
        self.dismiss(animated: true, completion: nil)

    }
}