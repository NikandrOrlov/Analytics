//
//  SearchBarDelegate.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/20/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import STT

protocol SearchBarDelegate: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
}
