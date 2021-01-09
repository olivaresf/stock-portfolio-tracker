//
//  HomeView.swift
//  stock-portfolio-tracker
//
//  Created by nb-058-41b on 1/7/21.
//

import SwiftUI
import DICE

struct HomeView: View {
    
    @EnvironmentObservableInjected var viewModel: HomeViewModel
    
    var body: some View {
        content
            .sheet(
                isPresented: $viewModel.routingState.showModalSheet,
                content: {
                    modalSheet
                })
    }
    
    var content: some View {
        NavigationView {
            VStack(alignment: .leading) {
                portfoliosRow
                portfolios
            }
            .padding([.leading, .trailing], 18)
            .navigationBarTitle(Text("Dashboard"))
        }
    }
    
    var portfoliosRow: some View {
        HStack {
            Text("Portfolios")
            Spacer()
            Button(action: {
                viewModel.input.newPortfolioAction()
            }, label: {
                Image(systemName: "plus")
            })
        }
    }
    
    var portfolios: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.portfolios) { portfolio in
                    PortfolioRow(item: portfolio)
                }
            }
        }
    }
    
    var modalSheet: some View {
        CreatePortfolio()
    }
    
//    func portfolioList(List<Portfolio> portfolios) -> View {
//        List(portfolios) { portfolio in
//            NavigationLink(
//                destination: portfolioView(portfolio: portfolio),
//                tag: country.alpha3Code,
//                selection: $viewModel.routingState.countryDetails) {
//                    PortfolioRow(portfolio: portfolio)
//                }
//        }
//    }
    
}
