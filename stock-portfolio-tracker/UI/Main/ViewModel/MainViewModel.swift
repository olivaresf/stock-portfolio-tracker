//
//  MainViewModel.swift
//  stock-portfolio-tracker
//
//  Created by nb-058-41b on 12/12/20.
//

import Combine

class MainViewModel: BaseViewModel<MainViewModelInputType, MainViewModelOutputType>, MainViewModelType {
    
    private let authService: AuthServiceType
    
    override init(session: SessionType) {
        self.authService = session.resolve()
        super.init(session: session)
    }
    
    // MARK: - MainViewModelOutputType Variables
    
    @Published var testString: String?
    var testPublisher: Published<String?>.Publisher { $testString }
    
}

extension MainViewModel: MainViewModelInputType {
    
    func viewDidLoad() {
        Swift.print("[TEST] Main View Model onViewDidLoad")
    }
    
    func signOutAction() {
        authService.logout()
    }
    
}

// MARK: - MainViewModelOutputType

extension MainViewModel: MainViewModelOutputType {
    
}
