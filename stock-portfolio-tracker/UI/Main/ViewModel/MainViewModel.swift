//
//  MainViewModel.swift
//  stock-portfolio-tracker
//
//  Created by nb-058-41b on 12/12/20.
//

import Combine

class MainViewModel: BaseViewModel<MainViewModelInputType, MainViewModelOutputType>, MainViewModelType {
    
    init(session: SessionType) {
        
    }
    
    // MARK: - MainViewModelOutputType Variables
    
    @Published var testString: String?
    
}

extension MainViewModel: MainViewModelInputType {
    
    func viewDidLoad() {
        Swift.print("Main View Model onViewDidLoad")
    }
    
}

// MARK: - MainViewModelOutputType

extension MainViewModel: MainViewModelOutputType {
    
}
