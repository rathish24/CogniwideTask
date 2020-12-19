//
//  LoginViewModel.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 27/11/20.
//

import Foundation
import RxSwift
import RxCocoa


protocol LoginViewModelInputs {
    var email: BehaviorRelay<String?> { get }
    var password: BehaviorRelay<String?> { get }
    func didTapLogin()
}

protocol LoginViewModelOutputs {
    var emailChecking: Driver<Bool> { get }
    var passwordChecking: Driver<Bool> { get }
    var login: Driver<Void> { get }
}

class LoginViewModel: ViewModelBinding, LoginViewModelInputs, LoginViewModelOutputs {
    
    var inputs: LoginViewModelInputs { return self }
    var outputs: LoginViewModelOutputs { return self }

    var email: BehaviorRelay<String?>
    var password: BehaviorRelay<String?>

    var emailChecking: Driver<Bool>
    var passwordChecking: Driver<Bool>
    var login: Driver<Void>

    private let loginSubject: PublishSubject<Void> = PublishSubject()
    private let emailCheckingSubject: PublishSubject<Bool> = PublishSubject()
    private let passwordCheckingSubject: PublishSubject<Bool> = PublishSubject()

    init() {
        email = BehaviorRelay(value: nil)
        password = BehaviorRelay(value: nil)
        login = loginSubject.asDriver(onErrorJustReturn: ())
        emailChecking = emailCheckingSubject.asDriver(onErrorJustReturn: false)
        passwordChecking = passwordCheckingSubject.asDriver(onErrorJustReturn: false)
    }

    func didTapLogin() {
        let emailIsValid = Utility.validatePattern(text: email.value ?? "")
        let passwordIsValid = Utility.validateLength(text: password.value ?? "", size: (8, 15))
        emailCheckingSubject.onNext(emailIsValid)
        passwordCheckingSubject.onNext(passwordIsValid)
        if emailIsValid && passwordIsValid {
            loginSubject.onNext(())
        }
    }
}


