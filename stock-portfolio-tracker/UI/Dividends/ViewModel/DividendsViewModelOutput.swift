//
//  DividendsViewModelOutput.swift
//  stock-portfolio-tracker
//
//  Created by nb-058-41b on 1/8/21.
//

import Foundation

protocol DividendsViewModelOutputType {
    var routingState: DividendsRouting { get }
    var dividends: [DividendViewItem] { get }
}
