//
//  WelcomeView.swift
//  stock-portfolio-tracker
//
//  Created by nb-058-41b on 12/24/20.
//

import SwiftUI
import DICE

struct WelcomeView: View {
    
    @EnvironmentObservableInjected var viewModel: WelcomeViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                VStack {
                    startButton
                }
            }
        }
    }
    
    var startButton: some View {
        NavigationLink(destination:
                        MainView()
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
        ) {
            Text(L10n.Welcome.Button.Start.title)
        }
        // .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var backgroundColor: some View {
        Color(Asset.Colors.primary.color).edgesIgnoringSafeArea(.all)
    }
}
