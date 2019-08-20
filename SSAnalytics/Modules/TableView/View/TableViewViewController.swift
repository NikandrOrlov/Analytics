//
//  TableViewViewController.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/13/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import UIKit
import STT

class TableViewViewController: SttViewController<TableViewPresenter>, TableViewViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var search: UIBarButtonItem!
    
    var searchController: UISearchController!
    var searchBar: UISearchBar!
    var searchHandler: SttHanlderSearchBar!
    
    private var _source: CellTableViewSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settings()
        setHandler()
	}
    
    func settings() {
        searchHandler = SttHanlderSearchBar()
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 50))
        search.target = self
        search.action = #selector(didNavItemTap(_:))
        searchBar.delegate = searchHandler
    }
    
    func setHandler() {
        searchHandler.addTarget(
            type: .shouldBeginEditing,
            delegate: self,
            handler: { [weak self] (_, bar) in
                self?.presenter.input.value = bar.text ?? ""
        })
        searchHandler.addTarget(
            type: .cancelClicked,
            delegate: self,
            handler: { [weak self] (_, bar) in
                self?.presenter.input.value = bar.text ?? ""
        })
    }
    
    @IBAction func didNavItemTap(_ sender: AnyObject) {
       _ = tableView.tableHeaderView = searchBar
        
    }
    
    var set: SttBindingSet<TableViewViewController>!
    
    override func bind() {
        
        set = SttBindingSet(parent: self)
        
        _source = CellTableViewSource(tableView: tableView, collection: presenter.collection)
        
        
        set.apply()
    }
	// MARK: - implementation of TableViewViewDelegate
}
