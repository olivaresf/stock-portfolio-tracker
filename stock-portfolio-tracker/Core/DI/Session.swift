//
//  Session.swift
//  stock-portfolio-tracker
//
//  Created by nb-058-41b on 12/12/20.
//

import DICE

class Session: SessionType {
    
    let container = DIContainer()
    let appState: Store<AppState>
    
    init(appState: Store<AppState>) {
        self.appState = appState
        bind()
    }
    
    func resolve<T>() -> T {
        return container.resolve()
    }
    
}

private extension Session {
    
    func bind() {
        bindViewModel()
        bindService()
        bindRepository()
        
        DICE.use(container)
    }
    
}

private extension Session {
    
    func bindViewModel() {
        container.register { _ in
            return AppViewModel(session: self)
        }
        container.register { _ in
            return MainViewModel(session: self)
        }
        container.register { _ in
            return WelcomeViewModel(session: self)
        }
        container.register { _ in
            return LoginViewModel(session: self)
        }
        container.register { _ in
            return SignUpViewModel(session: self)
        }
    }
    
}

private extension Session {
    
    func bindService() {
        container.register(AuthServiceType.self) { _ in
            return AuthService()
        }
        container.register(AuthListenerType.self, scope: .single) { _ in
            return AuthListener(appState: self.appState)
        }
    }
    
}

private extension Session {
    
    func bindRepository() {
        container.register(AuthRepositoryType.self) { _ in
            return FirebaseAuthRepository()
        }
    }
    
}
